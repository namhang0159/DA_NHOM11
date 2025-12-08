import React, { useEffect, useState } from "react";
import {
  getAllFeedbacks,
  deleteFeedback,
} from "../../services/feedbackService";

const FeedbackAdmin = () => {
  const [feedbacks, setFeedbacks] = useState([]);
  const [loading, setLoading] = useState(true);
  const [page, setPage] = useState(1);
  const [totalPages, setTotalPages] = useState(0);

  const fetchFeedbacks = async (pageNumber) => {
    setLoading(true);
    try {
      const res = await getAllFeedbacks(pageNumber);

      setFeedbacks(res.data);
      setTotalPages(res.totalPages);
      setPage(res.currentPage);
    } catch (error) {
      alert("Lỗi tải dữ liệu. Hãy đảm bảo bạn đã đăng nhập Admin.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchFeedbacks(page);
  }, [page]);

  const handleDelete = async (id) => {
    if (
      window.confirm(
        "Bạn chắc chắn muốn xóa feedback này? Điểm rating sản phẩm sẽ được tính toán lại."
      )
    ) {
      try {
        await deleteFeedback(id);
        alert("Xóa thành công!");
        fetchFeedbacks(page); // Load lại trang
      } catch (error) {
        alert("Xóa thất bại!");
      }
    }
  };

  const renderStars = (rate) => "⭐".repeat(rate);

  // Format ngày giờ đẹp
  const formatDate = (dateString) => {
    if (!dateString) return "";
    return new Date(dateString).toLocaleDateString("vi-VN", {
      day: "2-digit",
      month: "2-digit",
      year: "numeric",
      hour: "2-digit",
      minute: "2-digit",
    });
  };

  if (loading)
    return <div className="p-4 text-center">Đang tải dữ liệu...</div>;

  return (
    <div className="feedback-wrapper">
      <div className="table-responsive">
        <table className="table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Khách hàng</th>
              <th>Sản phẩm</th>
              <th>Biến thể</th>
              <th>Đánh giá</th>
              <th>Nội dung</th>
              <th>Ngày tạo</th>
              <th>Hành động</th>
            </tr>
          </thead>
          <tbody>
            {feedbacks.length > 0 ? (
              feedbacks.map((item) => (
                <tr key={item.feedback_id}>
                  <td>#{item.feedback_id}</td>
                  <td>
                    <div className="fw-bold">{item.customer_name}</div>
                    <small className="text-muted">{item.user_email}</small>
                  </td>
                  <td>{item.product_name}</td>
                  <td>
                    <span className="badge-variant">{item.variant_info}</span>
                  </td>
                  <td className="text-warning text-nowrap">
                    {renderStars(item.rate)} ({item.rate})
                  </td>
                  <td>{item.content}</td>
                  <td>{formatDate(item.created_at)}</td>
                  <td>
                    <button
                      className="btn-delete"
                      onClick={() => handleDelete(item.feedback_id)}
                    >
                      Xóa
                    </button>
                  </td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan="8" className="text-center">
                  Chưa có đánh giá nào.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>

      {/* Pagination */}
      <div className="pagination">
        <button disabled={page <= 1} onClick={() => setPage(page - 1)}>
          &laquo; Trước
        </button>
        <span className="page-info">
          Trang {page} / {totalPages}
        </span>
        <button disabled={page >= totalPages} onClick={() => setPage(page + 1)}>
          Sau &raquo;
        </button>
      </div>

      <style jsx>{`
        .feedback-wrapper {
          padding: 20px;
          background: #fff;
          border-radius: 8px;
          box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        .table {
          width: 100%;
          border-collapse: collapse;
        }
        .table th,
        .table td {
          padding: 12px 15px;
          border-bottom: 1px solid #eee;
          text-align: left;
          vertical-align: middle;
        }
        .table th {
          background-color: #f8f9fa;
          font-weight: 600;
          color: #495057;
        }
        .badge-variant {
          background: #e9ecef;
          padding: 4px 8px;
          border-radius: 4px;
          font-size: 0.85em;
          white-space: nowrap;
        }
        .text-muted {
          color: #6c757d;
          font-size: 0.85em;
        }
        .fw-bold {
          font-weight: 600;
        }
        .text-warning {
          color: #ffc107;
        }
        .text-nowrap {
          white-space: nowrap;
        }

        .btn-delete {
          background: #dc3545;
          color: white;
          border: none;
          padding: 6px 12px;
          border-radius: 4px;
          cursor: pointer;
          transition: 0.2s;
        }
        .btn-delete:hover {
          background: #c82333;
        }

        .pagination {
          display: flex;
          justify-content: center;
          align-items: center;
          margin-top: 20px;
          gap: 15px;
        }
        .pagination button {
          padding: 8px 16px;
          border: 1px solid #dee2e6;
          background: white;
          cursor: pointer;
          border-radius: 4px;
        }
        .pagination button:disabled {
          background: #e9ecef;
          cursor: not-allowed;
          color: #adb5bd;
        }
      `}</style>
    </div>
  );
};

export default FeedbackAdmin;
