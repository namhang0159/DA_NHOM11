const bcrypt = require("bcrypt");

const jwt = require("jsonwebtoken");

const User = require("../models/user");

let register = async (req, res, next) => {
  let email = req.body.email;
  if (email === undefined)
    return res.status(400).send("Trường email không tồn tại");
  let admin = await User.findOne({ where: { email, role_id: 1 } });
  if (admin) return res.status(409).send("Email đã tồn tại");
  else {
    try {
      let hashPassword = bcrypt.hashSync(req.body.password, 10);
      let newAdmin = { email: email, password: hashPassword, role_id: 1 };
      let createAdmin = await User.create(newAdmin);
      return res.send(createAdmin);
    } catch (err) {
      console.log(err);
      return res
        .status(400)
        .send("Có lỗi trong quá trình tạo tài khoản vui lòng thử lại");
    }
  }
};

let login = async (req, res, next) => {
  let email = req.body.email;
  if (email === undefined)
    return res.status(400).send("Trường email không tồn tại");
  let password = req.body.password;
  if (password === undefined)
    return res.status(400).send("Trường password không tồn tại");

  try {
    let admin = await User.findOne({ where: { email, role_id: 1 } });
    if (!admin) {
      return res.status(401).send("Email không chính xác");
    }

    let isPasswordValid = bcrypt.compareSync(password, admin.password);
    if (!isPasswordValid) {
      return res.status(401).send("Mật khẩu không chính xác");
    }
    const accessToken = jwt.sign(
      {
        id: admin.user_id,
        email: admin.email,
        role_id: admin.role_id,
      },
      process.env.ACCESSTOKEN_SECRET_KEY,
      { expiresIn: "1d" }
    );

    return res.send({
      message: "Đăng nhập thành công",
      accessToken: accessToken,
      user: { email: admin.email, id: admin.user_id },
    });
  } catch (err) {
    console.log(err);
    return res
      .status(400)
      .send("Có lỗi trong quá trình tạo tài khoản vui lòng thử lại");
  }
};

module.exports = {
  register,
  login,
};
