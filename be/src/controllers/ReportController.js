const Report = require("../models/report");
const Post = require("../models/post");

Report.belongsTo(Post, { foreignKey: "postId" });

exports.create = async (req, res) => {
  try {
    const { reason, description, postId, reporterId } = req.body;

    const postExists = await Post.findByPk(postId);
    if (!postExists) return res.status(404).json({ msg: "Post not found to report" });

    const newReport = await Report.create({
      reason, description, postId,
      reporterId: reporterId || req.user?.id
    });

    return res.status(201).json({ success: true, data: newReport });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};

exports.findAll = async (req, res) => {
  try {
    const { status } = req.query;
    const where = status ? { status } : {};

    const reports = await Report.findAll({
      where,
      include: [{ 
        model: Post, 
        attributes: ["id", "title", "slug"] // Chỉ lấy trường cần thiết
      }],
      order: [["createdAt", "DESC"]],
    });

    return res.status(200).json({ success: true, data: reports });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};

exports.updateStatus = async (req, res) => {
  try {
    const { status } = req.body; // 'resolved' | 'rejected'
    if (!status) return res.status(400).json({ msg: "Status required" });

    const [updated] = await Report.update({ status }, { where: { id: req.params.id } });
    if (!updated) return res.status(404).json({ msg: "Report not found" });

    return res.status(200).json({ success: true, msg: "Status updated" });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};