import { useState, useEffect } from "react";
import axios from "axios";
import "bootstrap/dist/css/bootstrap.css";

export default function AddOrderPage() {
  const [customers, setCustomers] = useState([]);
  const [products, setProducts] = useState([]);
  const [selectedCustomer, setSelectedCustomer] = useState(null);
  const [productVariants, setProductVariants] = useState([]);
  const [orderItems, setOrderItems] = useState([]);
  const [items, setItems] = useState([
    {
      product: null,
      colours: [],
      sizes: [],
      colour: null,
      size: null,
      quantity: 1,
    },
  ]);

  const [form, setForm] = useState({
    user_id: "",
    customer_name: "",
    email: "",
    phone_number: "",
    address: "",
    order_items: [],
  });

  // Load customers
  useEffect(() => {
    const loadCustomers = async () => {
      try {
        const res = await axios.post(
          `${process.env.NEXT_PUBLIC_BACKEND_API}/customer/getcustomer`
        );
        setCustomers(res.data);
      } catch (err) {
        console.error("Error loading customers:", err);
      }
    };
    loadCustomers();
  }, []);

  // Load products
  useEffect(() => {
    const loadProducts = async () => {
      try {
        const res = await axios.post(
          `${process.env.NEXT_PUBLIC_BACKEND_API}/product/getProduct`
        );
        setProducts(res.data);
      } catch (err) {
        console.error("Error loading products:", err);
      }
    };
    loadProducts();
  }, []);

  // Select customer
  const handleSelectCustomer = (id) => {
    const cus = customers.find((c) => c.user_id === id);
    if (!cus || !cus.Customer_Info) return;

    setSelectedCustomer(id);
    setForm({
      user_id: id,
      customer_name: cus.Customer_Info.customer_name || "",
      email: cus.email || "",
      phone_number: cus.Customer_Info.phone_number || "",
      address: cus.Customer_Info.address || "",
      order_items: [],
    });
  };

  // Select product
  const handleSelectProduct = async (index, productId) => {
    const data = [...items];
    data[index].product = productId;
    data[index].colour = null;
    data[index].size = null;
    data[index].colours = [];
    data[index].sizes = [];

    try {
      const resV = await axios.post(
        `${process.env.NEXT_PUBLIC_BACKEND_API}/product-variant/getProductV`
      );

      const variants = resV.data || [];
      setProductVariants(variants);

      const variantsOfProduct = variants.filter(
        (v) => v.product_id === productId
      );

      const colourIds = [...new Set(variantsOfProduct.map((v) => v.colour_id))];
      const resC = await axios.get(
        `${process.env.NEXT_PUBLIC_BACKEND_API}/colour/list`
      );
      const coloursAvailable = (resC.data || []).filter((c) =>
        colourIds.includes(c.colour_id)
      );
      data[index].colours = coloursAvailable;

      const resZ = await axios.get(
        `${process.env.NEXT_PUBLIC_BACKEND_API}/size/list`
      );
      const sizeIds = [...new Set(variantsOfProduct.map((v) => v.size_id))];
      const sizesAvailable = (resZ.data || []).filter((s) =>
        sizeIds.includes(s.size_id)
      );
      data[index].sizes = sizesAvailable;

      setItems([...data]);
    } catch (err) {
      console.error("Error loading product variants:", err);
      alert("Không thể tải thông tin sản phẩm");
    }
  };

  // Select colour
  const handleSelectColour = (index, colourId) => {
    const data = [...items];
    data[index].colour = colourId;
    data[index].size = null;

    const variants = productVariants.filter(
      (v) => v.product_id === data[index].product && v.colour_id === colourId
    );

    const originalSizes = data[index].sizes;

    data[index].sizes = variants.map((v) => {
      const sizeInfo = originalSizes.find((s) => s.size_id === v.size_id);
      return {
        size_id: v.size_id,
        product_variant_id: v.product_variant_id,
        size_name: sizeInfo ? sizeInfo.size_name : v.size_name || "N/A",
      };
    });

    setItems([...data]);
  };

  const handleSelectSize = (index, productVariantId) => {
    const data = [...items];
    data[index].size = productVariantId;
    setItems(data);
  };

  const handleChangeQty = (index, qty) => {
    const data = [...items];
    data[index].quantity = qty > 0 ? qty : 1;
    setItems(data);
  };

  // Add items to order
  const handleAddItem = () => {
    const valid = items
      .filter((it) => it.product && it.colour && it.size)
      .map((it) => ({
        product_variant_id: it.size,
        quantity: Number(it.quantity),
      }));

    if (!valid.length) {
      alert("Chưa chọn đầy đủ sản phẩm - màu - size");
      return;
    }

    setOrderItems([...orderItems, ...valid]);

    // Reset items after adding
    setItems([
      {
        product: null,
        colours: [],
        sizes: [],
        colour: null,
        size: null,
        quantity: 1,
      },
    ]);
  };

  // Remove item from order
  const handleRemoveOrderItem = (index) => {
    const newOrderItems = orderItems.filter((_, idx) => idx !== index);
    setOrderItems(newOrderItems);
  };

  // Submit order
  const handleSubmit = async () => {
    if (!selectedCustomer) {
      alert("Vui lòng chọn khách hàng!");
      return;
    }

    if (
      !form.user_id ||
      !form.customer_name ||
      !form.email ||
      !form.phone_number ||
      !form.address
    ) {
      alert("Thông tin khách hàng chưa đầy đủ!");
      console.log("Form state:", form);
      return;
    }

    if (!orderItems.length) {
      alert("Vui lòng thêm sản phẩm vào đơn!");
      return;
    }

    const payload = {
      user_id: form.user_id,
      customer_name: form.customer_name,
      email: form.email,
      phone_number: form.phone_number,
      address: form.address,
      order_items: orderItems,
    };

    console.log("Payload gửi:", payload);

    try {
      const res = await axios.post(
        `${process.env.NEXT_PUBLIC_BACKEND_API}/order/create`,
        payload,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
        }
      );

      alert("Tạo đơn hàng thành công!");

      // Reset form
      setOrderItems([]);
      setItems([
        {
          product: null,
          colours: [],
          sizes: [],
          colour: null,
          size: null,
          quantity: 1,
        },
      ]);
      setSelectedCustomer(null);
      setForm({
        user_id: "",
        customer_name: "",
        email: "",
        phone_number: "",
        address: "",
        order_items: [],
      });
    } catch (err) {
      console.error("Error creating order:", err);
      alert(
        err.response?.data?.message ||
          err.response?.data ||
          "Không thể tạo đơn hàng"
      );
    }
  };

  return (
    <div className="container my-5">
      <div className="row justify-content-center">
        <div className="col-lg-10">
          {/* Header */}
          <div className="card shadow-sm mb-4">
            <div className="card-header text-bold">
              <h3 className="mb-0">
                <i className="bi bi-cart-plus me-2"></i>
                Thêm đơn hàng
              </h3>
            </div>
          </div>

          {/* Select Customer */}
          <div className="card shadow-sm mb-4">
            <div className="card-body">
              <h5 className="card-title mb-3">
                <i className="bi bi-person-fill me-2"></i>
                Thông tin khách hàng
              </h5>

              <div className="mb-3">
                <label className="form-label fw-bold">Chọn khách hàng</label>
                <select
                  className="form-select form-select-lg"
                  value={selectedCustomer || ""}
                  onChange={(e) => handleSelectCustomer(e.target.value)}
                >
                  <option value="">-- Chọn khách hàng --</option>
                  {customers
                    .filter((c) => c.role_id === 2)
                    .map((c) => (
                      <option key={c.user_id} value={c.user_id}>
                        {c.Customer_Info?.customer_name} - {c.email}
                      </option>
                    ))}
                </select>
              </div>

              {selectedCustomer && (
                <div className="alert alert-info mt-3">
                  <div className="row">
                    <div className="col-md-6">
                      <p className="mb-2">
                        <strong>Tên:</strong> {form.customer_name}
                      </p>
                      <p className="mb-2">
                        <strong>Email:</strong> {form.email}
                      </p>
                    </div>
                    <div className="col-md-6">
                      <p className="mb-2">
                        <strong>SĐT:</strong> {form.phone_number}
                      </p>
                      <p className="mb-0">
                        <strong>Địa chỉ:</strong> {form.address}
                      </p>
                    </div>
                  </div>
                </div>
              )}
            </div>
          </div>

          {/* Product Selection */}
          <div className="card shadow-sm mb-4">
            <div className="card-body">
              <h5 className="card-title mb-3">
                <i className="bi bi-box-seam me-2"></i>
                Chọn sản phẩm
              </h5>

              {items.map((item, idx) => (
                <div className="card mb-3 border-secondary" key={idx}>
                  <div className="card-header bg-light">
                    <h6 className="mb-0">Sản phẩm #{idx + 1}</h6>
                  </div>
                  <div className="card-body">
                    <div className="row g-3">
                      {/* Product Select */}
                      <div className="col-md-6">
                        <label className="form-label">Sản phẩm</label>
                        <select
                          className="form-select"
                          value={item.product ?? ""}
                          onChange={(e) =>
                            handleSelectProduct(idx, Number(e.target.value))
                          }
                        >
                          <option value="">-- Chọn sản phẩm --</option>
                          {products.map((p) => (
                            <option key={p.product_id} value={p.product_id}>
                              {p.product_name}
                            </option>
                          ))}
                        </select>
                      </div>

                      {/* Colour Select */}
                      <div className="col-md-6">
                        <label className="form-label">Màu sắc</label>
                        <select
                          className="form-select"
                          value={item.colour ?? ""}
                          onChange={(e) =>
                            handleSelectColour(idx, Number(e.target.value))
                          }
                          disabled={!item.colours.length}
                        >
                          <option value="">-- Chọn màu --</option>
                          {item.colours.map((c) => (
                            <option key={c.colour_id} value={c.colour_id}>
                              {c.colour_name}
                            </option>
                          ))}
                        </select>
                      </div>

                      {/* Size Select */}
                      <div className="col-md-6">
                        <label className="form-label">Kích thước</label>
                        <select
                          className="form-select"
                          value={item.size ?? ""}
                          onChange={(e) =>
                            handleSelectSize(idx, Number(e.target.value))
                          }
                          disabled={!item.sizes.length}
                        >
                          <option value="">-- Chọn size --</option>
                          {item.sizes.map((s) => (
                            <option
                              key={s.product_variant_id}
                              value={s.product_variant_id}
                            >
                              {s.size_name}
                            </option>
                          ))}
                        </select>
                      </div>

                      {/* Quantity */}
                      <div className="col-md-6">
                        <label className="form-label">Số lượng</label>
                        <input
                          type="number"
                          min={1}
                          value={item.quantity}
                          className="form-control"
                          onChange={(e) =>
                            handleChangeQty(idx, Number(e.target.value))
                          }
                        />
                      </div>
                    </div>
                  </div>
                </div>
              ))}

              <div className="d-flex gap-2">
                <button
                  className="btn btn-outline-secondary"
                  onClick={() =>
                    setItems([
                      ...items,
                      {
                        product: null,
                        colours: [],
                        sizes: [],
                        colour: null,
                        size: null,
                        quantity: 1,
                      },
                    ])
                  }
                >
                  <i className="bi bi-plus-circle me-2"></i>
                  Thêm sản phẩm mới
                </button>

                <button onClick={handleAddItem} className="btn btn-primary">
                  <i className="bi bi-cart-plus me-2"></i>
                  Thêm vào đơn hàng
                </button>
              </div>
            </div>
          </div>

          {/* Order Items List */}
          {orderItems.length > 0 && (
            <div className="card shadow-sm mb-4">
              <div className="card-header bg-warning text-dark">
                <h5 className="mb-0">
                  <i className="bi bi-list-check me-2"></i>
                  Danh sách sản phẩm trong đơn ({orderItems.length})
                </h5>
              </div>
              <div className="card-body">
                <div className="table-responsive">
                  <table className="table table-hover">
                    <thead className="table-light">
                      <tr>
                        <th>#</th>
                        <th>Variant ID</th>
                        <th>Số lượng</th>
                        <th className="text-end">Thao tác</th>
                      </tr>
                    </thead>
                    <tbody>
                      {orderItems.map((item, idx) => (
                        <tr key={idx}>
                          <td>{idx + 1}</td>
                          <td>
                            <span className="badge bg-secondary">
                              {item.product_variant_id}
                            </span>
                          </td>
                          <td>
                            <span className="badge bg-info">
                              {item.quantity}
                            </span>
                          </td>
                          <td className="text-end">
                            <button
                              onClick={() => handleRemoveOrderItem(idx)}
                              className="btn btn-sm btn-danger"
                            >
                              <i className="bi bi-trash me-1"></i>
                              Xóa
                            </button>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          )}

          {/* Submit Button */}
          <div className="d-grid gap-2">
            <button
              onClick={handleSubmit}
              disabled={!selectedCustomer || !orderItems.length}
              className={`btn btn-lg ${
                !selectedCustomer || !orderItems.length
                  ? "btn-secondary"
                  : "btn-success"
              }`}
            >
              <i className="bi bi-check-circle me-2"></i>
              Tạo đơn hàng
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
