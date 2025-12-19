// services/apiModules.js
import axios from 'axios';

// Cấu hình axios cơ bản
const instance = axios.create({
  baseURL: 'http://localhost:8080/api', // URL server backend của bạn
  headers: {
    'Content-Type': 'application/json',
  },
});

export const postService = {
  getAll: (params) => instance.get('/post', { params }), // params: { page, limit }
  create: (data) => instance.post('/post', data),
  getOne: (id) => instance.get(`/post/${id}`),
};

export const reportService = {
  create: (data) => instance.post('/report', data),
  getAll: (status) => instance.get('/report', { params: { status } }),
  updateStatus: (id, status) => instance.patch(`/report/${id}/status`, { status }),
};

export default instance;