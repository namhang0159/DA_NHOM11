import React, { useState, useEffect } from 'react';
import { reportService } from '../../services/apiModules'; // Lưu ý đường dẫn import ../..

export default function AdminReports() {
  const [reports, setReports] = useState([]);

  const fetchReports = async () => {
    try {
      const res = await reportService.getAll();
      setReports(res.data.data);
    } catch (error) {
      console.error(error);
    }
  };

  useEffect(() => {
    fetchReports();
  }, []);

  const handleStatus = async (id, status) => {
    if(!confirm(`Bạn chắc chắn muốn chuyển sang trạng thái: ${status}?`)) return;
    try {
      await reportService.updateStatus(id, status);
      fetchReports(); // Refresh lại dữ liệu
    } catch (error) {
      alert("Cập nhật thất bại");
    }
  };

  return (
    <div style={{ padding: '20px' }}>
      <h1>🛡 Admin - Quản lý Báo cáo vi phạm</h1>
      <table border="1" cellPadding="10" style={{ width: '100%', borderCollapse: 'collapse' }}>
        <thead>
          <tr style={{ background: '#f0f0f0' }}>
            <th>ID</th>
            <th>Lý do</th>
            <th>ID Bài viết</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
          </tr>
        </thead>
        <tbody>
          {reports.map(rp => (
            <tr key={rp.id}>
              <td>{rp.id}</td>
              <td>{rp.reason}</td>
              <td>{rp.postId}</td>
              <td>
                <span style={{ 
                  fontWeight: 'bold', 
                  color: rp.status === 'pending' ? 'orange' : rp.status === 'resolved' ? 'green' : 'red' 
                }}>
                  {rp.status.toUpperCase()}
                </span>
              </td>
              <td>
                {rp.status === 'pending' && (
                  <div>
                    <button 
                      onClick={() => handleStatus(rp.id, 'resolved')}
                      style={{ marginRight: '5px', background: 'green', color: 'white', cursor: 'pointer' }}
                    >
                      Duyệt
                    </button>
                    <button 
                      onClick={() => handleStatus(rp.id, 'rejected')}
                      style={{ background: 'gray', color: 'white', cursor: 'pointer' }}
                    >
                      Từ chối
                    </button>
                  </div>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}