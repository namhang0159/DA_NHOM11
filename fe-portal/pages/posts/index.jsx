import React, { useState, useEffect } from "react";
import Link from "next/link"; // <--- 1. MỚI THÊM: Import Link để chuyển trang
import { postService, reportService } from "../../services/apiModules";

export default function PostPage() {
  const [posts, setPosts] = useState([]);
  const [loading, setLoading] = useState(false);

  // State cho form tạo bài
  const [formData, setFormData] = useState({ title: "", content: "" });

  // Hàm load dữ liệu
  const fetchPosts = async () => {
    try {
      setLoading(true);
      const res = await postService.getAll({ limit: 20 });
      // Kiểm tra kỹ cấu trúc data trả về để tránh lỗi
      setPosts(res.data?.data || []);
    } catch (error) {
      console.error("Lỗi tải bài viết:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchPosts();
  }, []);

  // Hàm xử lý tạo bài viết
  const handleCreate = async (e) => {
    e.preventDefault();
    try {
      const payload = {
        ...formData,
        slug:
          formData.title.toLowerCase().replace(/ /g, "-") + "-" + Date.now(),
        userId: 1, // Giả định ID user
      };
      await postService.create(payload);
      alert("Tạo bài thành công!");
      fetchPosts();
      setFormData({ title: "", content: "" });
    } catch (error) {
      alert("Lỗi tạo bài: " + (error.response?.data?.message || error.message));
    }
  };

  // Hàm xử lý báo cáo
  const handleReport = async (postId) => {
    const reason = prompt("Nhập lý do báo cáo:");
    if (!reason) return;
    try {
      await reportService.create({
        reason,
        description: "Report từ FE Nextjs",
        postId,
        reporterId: 99,
      });
      alert("Đã gửi báo cáo!");
    } catch (error) {
      alert("Lỗi gửi báo cáo");
    }
  };

  return (
    <div style={{ padding: "20px" }}>
      <h1>Quản lý Bài Viết</h1>

      {/* Form tạo mới */}
      <div
        style={{
          marginBottom: "30px",
          padding: "20px",
          border: "1px solid #ccc",
          borderRadius: "8px",
          background: "#f9f9f9",
        }}
      >
        <h3>✍️ Đăng bài mới</h3>
        <div style={{ marginBottom: "10px" }}>
          <input
            style={{
              display: "block",
              padding: "8px",
              width: "100%",
              marginBottom: "10px",
              boxSizing: "border-box",
            }}
            placeholder="Tiêu đề bài viết..."
            value={formData.title}
            onChange={(e) =>
              setFormData({ ...formData, title: e.target.value })
            }
          />
          <textarea
            style={{
              display: "block",
              padding: "8px",
              width: "100%",
              height: "100px",
              boxSizing: "border-box",
            }}
            placeholder="Nội dung bài viết..."
            value={formData.content}
            onChange={(e) =>
              setFormData({ ...formData, content: e.target.value })
            }
          />
        </div>
        <button
          onClick={handleCreate}
          style={{
            padding: "8px 20px",
            background: "#0070f3",
            color: "white",
            border: "none",
            borderRadius: "4px",
            cursor: "pointer",
          }}
        >
          Đăng bài
        </button>
      </div>

      {/* Danh sách bài viết */}
      <h3>📜 Danh sách bài viết</h3>
      {loading ? (
        <p>⏳ Đang tải...</p>
      ) : (
        <ul style={{ listStyle: "none", padding: 0 }}>
          {posts.map((post) => (
            <li
              key={post.id}
              style={{
                marginBottom: "15px",
                border: "1px solid #eee",
                padding: "15px",
                borderRadius: "8px",
                boxShadow: "0 2px 4px rgba(0,0,0,0.05)",
              }}
            >
              <div
                style={{
                  fontSize: "18px",
                  fontWeight: "bold",
                  marginBottom: "5px",
                }}
              >
                <Link
                  href={`/posts/${post.id}`}
                  style={{ textDecoration: "none", color: "#0070f3" }} // Chuyển style lên thẳng Link
                >
                  {post.title}
                </Link>
              </div>

              <div
                style={{
                  fontSize: "12px",
                  color: "#666",
                  marginBottom: "10px",
                }}
              >
                Trạng thái:{" "}
                <span style={{ fontWeight: "bold" }}>{post.status}</span>
                {" | "}
                Ngày tạo: {new Date(post.createdAt).toLocaleDateString()}
              </div>

              <button
                onClick={() => handleReport(post.id)}
                style={{
                  background: "#ff4d4f",
                  color: "white",
                  border: "none",
                  padding: "5px 10px",
                  borderRadius: "4px",
                  cursor: "pointer",
                  fontSize: "12px",
                }}
              >
                🚩 Báo cáo vi phạm
              </button>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
