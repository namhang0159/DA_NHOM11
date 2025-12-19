const { DataTypes } = require("sequelize");
const db = require("../configs/database");

const Report = db.sequelize.define("Report", {
  reason: { type: DataTypes.STRING, allowNull: false },
  description: { type: DataTypes.TEXT },
  status: { 
    type: DataTypes.ENUM("pending", "resolved", "rejected"), 
    defaultValue: "pending" 
  },
  postId: { type: DataTypes.INTEGER, allowNull: false }, // FK post
  reporterId: { type: DataTypes.INTEGER } // FK user (optional)
}, { tableName: "reports", timestamps: true });

module.exports = Report;