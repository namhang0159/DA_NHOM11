import React, { useEffect, useState } from "react";
import {
  getAllFeedbacks,
  deleteFeedback,
  toggleFeedbackVisibility,
  replyToFeedback,
} from "../../services/feedbackService";

const FeedbackAdmin = () => {
  const [feedbacks, setFeedbacks] = useState([]);
  const [loading, setLoading] = useState(true);
  const [page, setPage] = useState(1);
  const [totalPages, setTotalPages] = useState(0);

  const [filterRating, setFilterRating] = useState("");
  const [searchText, setSearchText] = useState("");

  const [replyModalOpen, setReplyModalOpen] = useState(false);
  const [currentFeedbackId, setCurrentFeedbackId] = useState(null);
  const [replyText, setReplyText] = useState("");

  const fetchFeedbacks = async (pageNumber, customRating, customKeyword) => {
    setLoading(true);
    try {
      const r = customRating !== undefined ? customRating : filterRating;
      const k = customKeyword !== undefined ? customKeyword : searchText;

      console.log("Frontend đang gửi:", {
        page: pageNumber,
        rating: r,
        keyword: k,
      });

      const res = await getAllFeedbacks(pageNumber, 10, r, k);

      setFeedbacks(res.data);
      setTotalPages(res.totalPages);
      setPage(res.currentPage);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchFeedbacks(page, filterRating, searchText);
  }, [page]);

  const handleSearch = () => {
    setPage(1);
    fetchFeedbacks(1, filterRating, searchText);
  };

  const handleReset = () => {
    setFilterRating("");
    setSearchText("");
    setPage(1);

    fetchFeedbacks(1, "", "");
  };

  const handleToggle = async (id, currentStatus) => {
    try {
      await toggleFeedbackVisibility(id);
      setFeedbacks(
        feedbacks.map((item) =>
          item.feedback_id === id
            ? { ...item, is_visible: !currentStatus }
            : item
        )
      );
    } catch (error) {
      alert("Lỗi cập nhật!");
    }
  };

  const handleDelete = async (id) => {
    if (window.confirm("Bạn chắc chắn xóa?")) {
      try {
        await deleteFeedback(id);
        // Xóa xong load lại trang hiện tại
        fetchFeedbacks(page, filterRating, searchText);
      } catch (error) {
        alert("Lỗi xóa!");
      }
    }
  };

  const openReplyModal = (feedback) => {
    setCurrentFeedbackId(feedback.feedback_id);
    setReplyText(feedback.reply || "");
    setReplyModalOpen(true);
  };

  const handleSendReply = async () => {
    if (!replyText.trim()) return alert("Nhập nội dung!");
    try {
      await replyToFeedback(currentFeedbackId, replyText);
      setFeedbacks(
        feedbacks.map((item) =>
          item.feedback_id === currentFeedbackId
            ? { ...item, reply: replyText }
            : item
        )
      );
      setReplyModalOpen(false);
    } catch (error) {
      alert("Lỗi gửi!");
    }
  };

  const renderStars = (rate) => "⭐".repeat(rate);
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

  return (
    <div className="feedback-wrapper">
      <div className="filter-bar">
        <div className="filter-group">
          <input
            type="text"
            placeholder="Tìm nội dung đánh giá..."
            value={searchText}
            onChange={(e) => setSearchText(e.target.value)}
            onKeyDown={(e) => e.key === "Enter" && handleSearch()}
          />
        </div>

        <div className="filter-group">
          <select
            value={filterRating}
            onChange={(e) => setFilterRating(e.target.value)}
          >
            <option value="">-- Tất cả sao --</option>
            <option value="5">5 Sao ⭐⭐⭐⭐⭐</option>
            <option value="4">4 Sao ⭐⭐⭐⭐</option>
            <option value="3">3 Sao ⭐⭐⭐</option>
            <option value="2">2 Sao ⭐⭐</option>
            <option value="1">1 Sao ⭐</option>
          </select>
        </div>

        <button className="btn-search" onClick={handleSearch}>
          Tìm kiếm
        </button>
        <button className="btn-reset" onClick={handleReset}>
          Làm mới
        </button>
      </div>

      <div className="table-responsive">
        <table className="table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Khách hàng</th>
              <th>Sản phẩm</th>
              <th>Đánh giá</th>
              <th>Nội dung</th>
              <th>Trả lời</th>
              <th>Ngày tạo</th>
              <th>Trạng thái</th>
              <th>Hành động</th>
            </tr>
          </thead>
          <tbody>
            {loading ? (
              <tr>
                <td colSpan="9" className="text-center p-4">
                  Đang tải dữ liệu...
                </td>
              </tr>
            ) : feedbacks.length > 0 ? (
              feedbacks.map((item) => (
                <tr
                  key={item.feedback_id}
                  className={!item.is_visible ? "opacity-50" : ""}
                >
                  <td>#{item.feedback_id}</td>
                  <td>
                    <div className="fw-bold">{item.customer_name}</div>
                    <small className="text-muted">{item.user_email}</small>
                  </td>
                  <td>
                    <div>{item.product_name}</div>
                    <span className="badge-variant">{item.variant_info}</span>
                  </td>
                  <td className="text-warning text-nowrap">
                    {renderStars(item.rate)} ({item.rate})
                  </td>
                  <td>
                    <div>{item.content}</div>
                    {item.reply && (
                      <div className="admin-reply-box">
                        <small>
                          <b>Admin:</b> {item.reply}
                        </small>
                      </div>
                    )}
                  </td>
                  <td>
                    <button
                      className="btn-reply"
                      onClick={() => openReplyModal(item)}
                    >
                      {item.reply ? "Sửa" : "Trả lời"}
                    </button>
                  </td>
                  <td>{formatDate(item.created_at)}</td>
                  <td>
                    <button
                      className={`btn-toggle ${
                        item.is_visible ? "btn-hide" : "btn-show"
                      }`}
                      onClick={() =>
                        handleToggle(item.feedback_id, item.is_visible)
                      }
                    >
                      {item.is_visible ? "Ẩn" : "Hiện"}
                    </button>
                  </td>
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
                <td colSpan="9" className="text-center p-4">
                  Không tìm thấy kết quả nào.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>

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

      {replyModalOpen && (
        <div className="modal-overlay">
          <div className="modal-content">
            <h3>Trả lời khách hàng</h3>
            <textarea
              rows="4"
              placeholder="Nhập câu trả lời..."
              value={replyText}
              onChange={(e) => setReplyText(e.target.value)}
            ></textarea>
            <div className="modal-actions">
              <button
                className="btn-cancel"
                onClick={() => setReplyModalOpen(false)}
              >
                Hủy
              </button>
              <button className="btn-confirm" onClick={handleSendReply}>
                Gửi
              </button>
            </div>
          </div>
        </div>
      )}

      <style jsx>{`
        .filter-bar {
          display: flex;
          gap: 15px;
          margin-bottom: 20px;
          background: #f8f9fa;
          padding: 15px;
          border-radius: 8px;
          align-items: center;
          flex-wrap: wrap;
        }
        .filter-group input,
        .filter-group select {
          padding: 8px 12px;
          border: 1px solid #ddd;
          border-radius: 4px;
          outline: none;
          min-width: 200px;
        }
        .btn-search {
          background: #007bff;
          color: white;
          border: none;
          padding: 9px 18px;
          border-radius: 4px;
          cursor: pointer;
        }
        .btn-search:hover {
          background: #0056b3;
        }
        .btn-reset {
          background: #6c757d;
          color: white;
          border: none;
          padding: 9px 18px;
          border-radius: 4px;
          cursor: pointer;
        }
        .btn-reset:hover {
          background: #5a6268;
        }
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
          display: inline-block;
          margin-top: 4px;
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
        .opacity-50 {
          background-color: #f9f9f9;
          color: #999;
        }
        .btn-toggle {
          border: none;
          padding: 5px 10px;
          border-radius: 4px;
          cursor: pointer;
          font-size: 13px;
          font-weight: 600;
          min-width: 60px;
        }
        .btn-hide {
          background-color: #ffc107;
          color: #333;
        }
        .btn-hide:hover {
          background-color: #e0a800;
        }
        .btn-show {
          background-color: #28a745;
          color: white;
        }
        .btn-show:hover {
          background-color: #218838;
        }
        .admin-reply-box {
          margin-top: 5px;
          padding: 5px 8px;
          background: #e6f7ff;
          border-left: 3px solid #1890ff;
          font-size: 0.9em;
          color: #333;
        }
        .btn-reply {
          background: #17a2b8;
          color: white;
          border: none;
          padding: 5px 10px;
          border-radius: 4px;
          cursor: pointer;
          font-size: 13px;
        }
        .btn-reply:hover {
          background: #138496;
        }
        .modal-overlay {
          position: fixed;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: rgba(0, 0, 0, 0.5);
          display: flex;
          justify-content: center;
          align-items: center;
          z-index: 1000;
        }
        .modal-content {
          background: white;
          padding: 20px;
          border-radius: 8px;
          width: 400px;
          box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .modal-content h3 {
          margin-top: 0;
          margin-bottom: 15px;
          color: #333;
        }
        .modal-content textarea {
          width: 100%;
          padding: 10px;
          border: 1px solid #ddd;
          border-radius: 4px;
          margin-bottom: 15px;
          resize: vertical;
          font-family: inherit;
        }
        .modal-actions {
          display: flex;
          justify-content: flex-end;
          gap: 10px;
        }
        .btn-cancel {
          background: #6c757d;
          color: white;
          border: none;
          padding: 8px 16px;
          border-radius: 4px;
          cursor: pointer;
        }
        .btn-confirm {
          background: #007bff;
          color: white;
          border: none;
          padding: 8px 16px;
          border-radius: 4px;
          cursor: pointer;
        }
      `}</style>
    </div>
  );
};

export default FeedbackAdmin;
