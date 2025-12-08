import axios from "axios";

const API_URL = "http://localhost:8080/api/feedback";

const getAuthHeader = () => {
  if (typeof window === "undefined") return {};

  try {
    const storageItem = localStorage.getItem("admin-storage");
    console.log("admin-storage from localStorage:", storageItem);

    if (!storageItem) return {};

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
      getAuthHeader()
    );
    return response.data;
  } catch (error) {
    console.error("Lỗi lấy danh sách feedback:", error);
    throw error;
  }
};

export const deleteFeedback = async (id) => {
  try {
    const response = await axios.delete(`${API_URL}/${id}`, getAuthHeader());
    return response.data;
  } catch (error) {
    console.error("Lỗi xóa feedback:", error);
    throw error;
  }
};
export const toggleFeedbackVisibility = async (id) => {
  try {
    const response = await axios.put(
      `${API_URL}/toggle/${id}`,
      {},
      getAuthHeader()
    );
    return response.data;
  } catch (error) {
    console.error("Lỗi toggle status:", error);
    throw error;
  }
};
export const replyToFeedback = async (id, replyContent) => {
  try {
    const response = await axios.put(
      `${API_URL}/reply/${id}`,
      { reply: replyContent },
      getAuthHeader()
    );
    return response.data;
  } catch (error) {
    console.error("Lỗi trả lời feedback:", error);
    throw error;
  }
};
