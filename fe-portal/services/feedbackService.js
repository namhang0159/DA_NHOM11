import axios from "axios";

const API_URL = "http://localhost:8080/api/feedback";

const getAuthHeader = () => {
  // Check để tránh lỗi khi render phía server của Next.js
  if (typeof window === "undefined") return {};

  try {
    // 1. Lấy chuỗi JSON từ key 'admin-storage'
    const storageItem = localStorage.getItem("admin-storage");
    console.log("admin-storage from localStorage:", storageItem);

    if (!storageItem) return {};

    // 2. Parse chuỗi JSON đó ra thành Object
    const parsedData = JSON.parse(storageItem);

    const token = parsedData?.state?.adminInfo?.accessToken;

    if (token) {
      return { headers: { Authorization: `Bearer ${token}` } };
    } else {
      console.warn("Không tìm thấy accessToken trong admin-storage");
    }
  } catch (error) {
    console.error("Lỗi khi lấy token từ LocalStorage:", error);
  }

  return {};
};

export const getAllFeedbacks = async (page = 1, limit = 10) => {
  try {
    const response = await axios.get(
      `${API_URL}/all?page=${page}&limit=${limit}`,
      getAuthHeader() // Tự động lấy token
    );
    return response.data;
  } catch (error) {
    console.error("Lỗi lấy danh sách feedback:", error);
    throw error;
  }
};

export const deleteFeedback = async (id) => {
  try {
    const response = await axios.delete(
      `${API_URL}/${id}`,
      getAuthHeader() // Tự động lấy token
    );
    return response.data;
  } catch (error) {
    console.error("Lỗi xóa feedback:", error);
    throw error;
  }
};
