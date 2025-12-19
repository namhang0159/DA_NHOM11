const { DataTypes } = require("sequelize");
const db = require("../configs/database");

const Post = db.sequelize.define("Post", {
  title: { type: DataTypes.STRING, allowNull: false },
  slug: { type: DataTypes.STRING, unique: true },
  content: { type: DataTypes.TEXT },
  thumbnail: { type: DataTypes.STRING },
  status: { 
    type: DataTypes.ENUM("draft", "published", "hidden"), 
    defaultValue: "published" 
  },
  userId: { type: DataTypes.INTEGER, allowNull: false } 
}, { tableName: "posts", timestamps: true });

module.exports = Post;