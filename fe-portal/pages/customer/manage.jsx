import React, { useEffect, useState } from "react";
import axios from "axios";

const Customer = () => {
  const [cus, setCus] = useState([]);
  useEffect(() => {
    const fetchCus = async () => {
      try {
        const result = await axios.post(
          `${process.env.NEXT_PUBLIC_BACKEND_API}/customer/getcustomer`
        );
        setCus(result.data);
        console.log(result.data);
      } catch (err) {
        console.log(err);
      }
    };
    fetchCus();
  }, []);
  return (
    <div className="container p-4">
      <h2 className="mb-4">Danh sách khách hàng</h2>
      {cus.length === 0 ? (
        <p>Chưa có khách hàng nào</p>
      ) : (
        <table className="table table-bordered">
          <thead>
            <tr>
              <th>Email</th>
              <th>Họ và tên</th>
              <th>Số điện thoại</th>
              <th>Địa chỉ</th>
            </tr>
          </thead>
          <tbody>
            {cus.map(
              (c) =>
                c.role_id === 2 && (
                  <tr key={c.user_id}>
                    <td>{c.email}</td>
                    <td>{c.Customer_Info?.customer_name || "-"}</td>
                    <td>{c.Customer_Info?.phone_number || "-"}</td>
                    <td>{c.Customer_Info?.address || "-"}</td>
                  </tr>
                )
            )}
          </tbody>
        </table>
      )}
    </div>
  );
};
export default Customer;
