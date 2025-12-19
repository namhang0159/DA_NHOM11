import React from "react";
import Head from "next/head";

import FeedbackAdmin from "../../components/FeedbackManagementPage/FeedbackAdmin";

const FeedbackManagePage = () => {
  return (
    <>
      <Head>
        <title>Quản lý đánh giá | Admin Portal</title>
      </Head>

      <div style={{ padding: "20px", width: "100%" }}>
        <h2
          style={{
            marginBottom: "20px",
            fontSize: "24px",
            fontWeight: "bold",
            color: "#333",
          }}
        >
          Quản lý Đánh Giá & Phản Hồi
        </h2>

        <FeedbackAdmin />
      </div>
    </>
  );
};

export default FeedbackManagePage;
