const { Sequelize } = require("sequelize");
const { Op } = require("sequelize");

// Import Models
const Order = require("../models/order");
const User = require("../models/user");
const Customer_Info = require("../models/customer_info");
const Product_Variant = require("../models/product_variant");
const Product = require("../models/product");
const Order_Item = require("../models/order_item");
const Feedback = require("../models/feedback");
const Order_Status_Change_History = require("../models/order_status_change_history");
const Colour = require("../models/colour");
const Size = require("../models/size");

// 1. TẠO FEEDBACK
let create = async (req, res, next) => {
  // Lấy customer_id từ token (admin role=1, user role=2)
  // Nếu middleware trả về req.token.id thì dùng req.token.id
  let customer_id = req.token.customer_id || req.token.id;

  if (!customer_id)
    return res.status(400).send({ message: "Access Token không hợp lệ" });

  let { product_variant_id, rate, content } = req.body;

  if (!product_variant_id)
    return res.status(400).send("Thiếu product_variant_id");
  if (rate === undefined) return res.status(400).send("Thiếu rate");

  try {
    // Check User
    let customer = await User.findOne({ where: { user_id: customer_id } });
    if (!customer) return res.status(400).send("Customer không tồn tại");

    // Check Variant
    var productVariant = await Product_Variant.findOne({
      where: { product_variant_id },
    });
    if (!productVariant)
      return res.status(400).send("Product Variant không tồn tại");

    // Check trùng lặp
    let existingFeedback = await Feedback.findOne({
      where: { user_id: customer_id, product_variant_id },
    });
    if (existingFeedback)
      return res.status(400).send("Bạn đã đánh giá sản phẩm này rồi");

    // Check đã mua hàng (đơn hàng thành công)
    let order = await Order.findOne({
      include: [
        {
          model: Order_Item,
          where: { product_variant_id: product_variant_id },
        },
        { model: Order_Status_Change_History, where: { state_id: 4 } }, // 4: Đã giao hàng
      ],
      where: { user_id: customer_id },
    });

    if (order) {
      // Tạo feedback
      let feedback = await Feedback.create({
        user_id: customer_id,
        product_variant_id,
        rate,
        content: content || "",
      });

      // TÍNH TOÁN LẠI RATING
      let product = await productVariant.getProduct();
      if (product) {
        let product_id = product.product_id;

        let [result] = await Feedback.findAll({
          attributes: [
            [Sequelize.fn("avg", Sequelize.col("rate")), "avg"],
            [Sequelize.fn("count", Sequelize.col("rate")), "count"],
          ],
          include: {
            model: Product_Variant,
            where: { product_id: product_id },
          },
        });

        let rating = parseFloat(result.dataValues.avg || 0).toFixed(1);
        let feedback_quantity = parseInt(result.dataValues.count || 0);

        await product.update({ rating, feedback_quantity });
      }

      return res.status(200).send(feedback);
    } else {
      return res
        .status(400)
        .send("Bạn chưa mua sản phẩm này hoặc đơn hàng chưa hoàn thành");
    }
  } catch (err) {
    console.log(err);
    return res.status(500).send("Lỗi server: " + err.message);
  }
};

let update = async (req, res, next) => {
  let { feedback_id, rate, content } = req.body;
  if (!feedback_id) return res.status(400).send("Thiếu feedback_id");

  try {
    let feedback = await Feedback.findByPk(feedback_id);
    if (!feedback) return res.status(400).send("Feedback không tồn tại");

    await feedback.update({ rate, content });

    let productVariant = await Product_Variant.findByPk(
      feedback.product_variant_id
    );

    if (productVariant) {
      let product = await productVariant.getProduct();
      if (product) {
        let product_id = product.product_id;
        let [result] = await Feedback.findAll({
          attributes: [[Sequelize.fn("avg", Sequelize.col("rate")), "avg"]],
          include: { model: Product_Variant, where: { product_id } },
        });

        let rating = parseFloat(result.dataValues.avg || 0).toFixed(1);
        await product.update({ rating });
      }
    }

    return res.send({ message: "Cập nhật feedback thành công!" });
  } catch (err) {
    console.log(err);
    return res.status(500).send("Lỗi server");
  }
};

// 3. CHI TIẾT
let detail = async (req, res, next) => {
  let customer_id = req.token.customer_id || req.token.id;
  let product_variant_id = req.params.product_variant_id;

  try {
    let feedback = await Feedback.findOne({
      attributes: ["feedback_id", "rate", "content"],
      where: { user_id: customer_id, product_variant_id },
    });
    if (!feedback) return res.status(404).send("Chưa có đánh giá");
    return res.send(feedback);
  } catch (err) {
    return res.status(500).send("Lỗi server");
  }
};

// 4. LIST (PUBLIC)
let list = async (req, res, next) => {
  let product_id = req.params.product_id;

  try {
    let feedbackList = await Feedback.findAll({
      attributes: ["rate", "content", "created_at"],
      include: [
        {
          model: User,
          attributes: ["email"],
          include: [{ model: Customer_Info, attributes: ["customer_name"] }],
        },
        {
          model: Product_Variant,
          where: { product_id },
          attributes: ["product_variant_id"],
          include: [
            { model: Colour, attributes: ["colour_name"] },
            { model: Size, attributes: ["size_name"] },
          ],
        },
      ],
      order: [["created_at", "DESC"]],
    });

    let result = feedbackList.map((fb) => ({
      customer:
        fb.User && fb.User.Customer_Info
          ? fb.User.Customer_Info.customer_name
          : "Ẩn danh",
      rate: fb.rate,
      colour:
        fb.Product_Variant && fb.Product_Variant.Colour
          ? fb.Product_Variant.Colour.colour_name
          : "",
      size:
        fb.Product_Variant && fb.Product_Variant.Size
          ? fb.Product_Variant.Size.size_name
          : "",
      content: fb.content,
      created_at: fb.created_at,
    }));

    return res.send(result);
  } catch (err) {
    console.log(err);
    return res.status(500).send("Lỗi server");
  }
};

let getAllFeedbacks = async (req, res, next) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const offset = (page - 1) * limit;

    const { count, rows } = await Feedback.findAndCountAll({
      limit: limit,
      offset: offset,
      order: [["created_at", "DESC"]],
      include: [
        {
          model: User,
          attributes: ["email", "user_id"],
          include: [{ model: Customer_Info, attributes: ["customer_name"] }],
        },
        {
          model: Product_Variant,

          attributes: ["product_variant_id"],
          paranoid: false,
          include: [
            {
              model: Product,
              attributes: ["product_name"],
              paranoid: false,
            },
            { model: Colour, attributes: ["colour_name"] },
            { model: Size, attributes: ["size_name"] },
          ],
        },
      ],
      distinct: true,
    });

    const formattedData = rows.map((fb) => {
      const variant = fb.product_variant || fb.Product_Variant;

      const product = variant ? variant.Product || variant.product : null;
      const color = variant ? variant.Colour || variant.colour : null;
      const size = variant ? variant.Size || variant.size : null;

      return {
        feedback_id: fb.feedback_id,
        user_email: fb.User ? fb.User.email : "Deleted User",
        customer_name:
          fb.User && fb.User.Customer_Info
            ? fb.User.Customer_Info.customer_name
            : "N/A",

        product_name: product
          ? product.product_name
          : "Sản phẩm không xác định",

        variant_info: variant
          ? `${color ? color.colour_name : "?"} - ${
              size ? size.size_name : "?"
            }`
          : "Biến thể không xác định",

        rate: fb.rate,
        content: fb.content,
        created_at: fb.created_at,
      };
    });

    return res.status(200).json({
      totalItems: count,
      totalPages: Math.ceil(count / limit),
      currentPage: page,
      data: formattedData,
    });
  } catch (err) {
    console.log("Error getAllFeedbacks:", err);
    return res.status(500).send("Lỗi lấy danh sách feedback");
  }
};

let deleteFeedback = async (req, res, next) => {
  let feedback_id = req.params.id;

  try {
    let feedback = await Feedback.findByPk(feedback_id);
    if (!feedback) {
      return res.status(404).send("Feedback không tồn tại");
    }

    // Lấy ID variant để tính lại điểm sau khi xóa
    let variantId = feedback.product_variant_id;

    // Xóa feedback
    await feedback.destroy();

    // Tính toán lại điểm số

    let productVariant = await Product_Variant.findByPk(variantId, {
      paranoid: false,
    });

    if (productVariant) {
      let product = await productVariant.getProduct({ paranoid: false });
      if (product) {
        let product_id = product.product_id;

        let [result] = await Feedback.findAll({
          attributes: [
            [Sequelize.fn("avg", Sequelize.col("rate")), "avg"],
            [Sequelize.fn("count", Sequelize.col("rate")), "count"],
          ],
          include: {
            model: Product_Variant,
            where: { product_id },
            paranoid: false, // Tính cả các feedback của variant đã xóa
          },
        });

        let rating = parseFloat(result.dataValues.avg || 0).toFixed(1);
        let feedback_quantity = parseInt(result.dataValues.count || 0);

        await product.update({ rating, feedback_quantity });
      }
    }

    return res
      .status(200)
      .send({ message: "Xóa feedback và cập nhật điểm đánh giá thành công" });
  } catch (err) {
    console.log("Error deleteFeedback:", err);
    return res.status(500).send("Lỗi khi xóa feedback");
  }
};
let toggleVisibility = async (req, res, next) => {
  let feedback_id = req.params.id;

  try {
    let feedback = await Feedback.findByPk(feedback_id);
    if (!feedback) return res.status(404).send("Feedback không tồn tại");

    // 1. Đảo ngược trạng thái (True -> False, False -> True)
    let newStatus = !feedback.is_visible;
    await feedback.update({ is_visible: newStatus });

    // 2. TÍNH LẠI RATING CHO SẢN PHẨM (Chỉ tính các feedback đang hiện)
    let productVariant = await feedback.getProduct_variant(); // Hàm sequelize tự sinh
    if (productVariant) {
      let product = await productVariant.getProduct();
      if (product) {
        let product_id = product.product_id;

        let [result] = await Feedback.findAll({
          attributes: [
            [Sequelize.fn("avg", Sequelize.col("rate")), "avg"],
            [Sequelize.fn("count", Sequelize.col("rate")), "count"],
          ],
          include: { model: Product_Variant, where: { product_id } },
          // QUAN TRỌNG: Chỉ tính điểm các comment ĐANG HIỆN
          where: { is_visible: true },
        });

        let rating = parseFloat(result.dataValues.avg || 0).toFixed(1);
        let feedback_quantity = parseInt(result.dataValues.count || 0);

        await product.update({ rating, feedback_quantity });
      }
    }

    return res.status(200).send({
      message: newStatus ? "Đã hiển thị feedback" : "Đã ẩn feedback",
      is_visible: newStatus,
    });
  } catch (err) {
    console.log("Error toggleVisibility:", err);
    return res.status(500).send("Lỗi server");
  }
};

module.exports = {
  create,
  update,
  detail,
  list,
  getAllFeedbacks,
  deleteFeedback,
  toggleVisibility,
};
