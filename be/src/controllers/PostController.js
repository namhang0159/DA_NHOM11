const Post = require("../models/post");

// Tạo bài viết
exports.create = async (req, res) => {
  try {
    const { title, content, slug, thumbnail, userId } = req.body;
    if (!title) return res.status(400).json({ msg: "Title is required" });

    const newPost = await Post.create({
      title, content, slug, thumbnail,
      userId: userId || req.user?.id || 1 
    });

    return res.status(201).json({ success: true, data: newPost });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};

exports.findAll = async (req, res) => {
  try {
    const { page = 1, limit = 10, status } = req.query;
    const offset = (page - 1) * limit;
    const where = status ? { status } : {};

    const { count, rows } = await Post.findAndCountAll({
      where,
      limit: parseInt(limit),
      offset: parseInt(offset),
      order: [["createdAt", "DESC"]],
    });

    return res.status(200).json({
      success: true,
      total: count,
      totalPages: Math.ceil(count / limit),
      currentPage: parseInt(page),
      data: rows,
    });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};

exports.findOne = async (req, res) => {
  try {
    const post = await Post.findByPk(req.params.id);
    if (!post) return res.status(404).json({ msg: "Post not found" });
    return res.status(200).json({ success: true, data: post });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};

exports.update = async (req, res) => {
  try {
    const [updated] = await Post.update(req.body, { where: { id: req.params.id } });
    if (!updated) return res.status(404).json({ msg: "Post not found or no change" });
    
    return res.status(200).json({ success: true, msg: "Updated successfully" });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};

exports.delete = async (req, res) => {
  try {
    const deleted = await Post.destroy({ where: { id: req.params.id } });
    if (!deleted) return res.status(404).json({ msg: "Post not found" });
    
    return res.status(200).json({ success: true, msg: "Deleted successfully" });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};