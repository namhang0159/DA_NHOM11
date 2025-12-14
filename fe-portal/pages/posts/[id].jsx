import React, { useEffect, useState } from "react";
import { useRouter } from "next/router";
import { postService } from "../../services/apiModules"; // Đảm bảo đường dẫn import đúng

const PostDetail = () => {
  const router = useRouter();
  const { id } = router.query; // Lấy ID từ URL (ví dụ: posts/5 -> id = 5)
  
  const [post, setPost] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if(!id) return; // Chờ Next.js lấy được ID

    const fetchPostDetail = async () => {
      try {
        const res = await postService.getOne(id);
        // Tùy cấu trúc trả về của BE, thường là res.data.data hoặc res.data
        setPost(res.data.data || res.data); 
      } catch (error) {
        alert("Không tìm thấy bài viết hoặc lỗi Server");
      } finally {
        setLoading(false);
      }
    };

    fetchPostDetail();
  }, [id]);

  if (loading) return <div className="p-5">⏳ Đang tải bài viết...</div>;
  if (!post) return <div className="p-5">❌ Bài viết không tồn tại.</div>;

  return (
    <div className="container" style={{ padding: "40px", maxWidth: "800px", margin: "0 auto" }}>
      <button onClick={() => router.back()} style={{ marginBottom: "20px", cursor: "pointer" }}>
        ⬅ Quay lại
      </button>

      {/* Ảnh thumbnail nếu có */}
      {post.thumbnail && (
        <img 
          src={post.thumbnail} 
          alt={post.title} 
          style={{ width: "100%", maxHeight: "400px", objectFit: "cover", borderRadius: "10px" }} 
        />
      )}

      <h1 style={{ color: "#333", marginTop: "20px" }}>{post.title}</h1>
      
      <div style={{ color: "#666", fontSize: "14px", marginBottom: "30px" }}>
        <span>Tác giả ID: {post.userId}</span> | 
        <span> Ngày đăng: {new Date(post.createdAt).toLocaleDateString()}</span>
      </div>

      <hr />

      {/* Nội dung bài viết */}
      <div className="content" style={{ lineHeight: "1.6", fontSize: "18px", marginTop: "30px" }}>
        {/* Nếu nội dung là HTML (từ Editor) thì dùng cái dưới, nếu text thường thì dùng {post.content} */}
        {post.content} 
      </div>
    </div>
  );
};

export default PostDetail;