const { DataTypes } = require("sequelize");
const { sequelize } = require("../configs/database");

const User = require("./user");
const Product_Variant = require("./product_variant");

const Feedback = sequelize.define(
  "Feedback",
  {
    feedback_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    rate: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    content: {
      type: DataTypes.TEXT,
      defaultValue: "",
    },
    user_id: {
      type: DataTypes.UUID, //
      allowNull: false,
    },
    product_variant_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    is_visible: {
      type: DataTypes.BOOLEAN,
      defaultValue: true,
    },
  },
  {
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at",
    tableName: "feedbacks",
  }
);

// 1. Quan hệ với User
Feedback.belongsTo(User, {
  foreignKey: { name: "user_id" },
});
User.hasMany(Feedback, {
  foreignKey: { name: "user_id" },
});

Feedback.belongsTo(Product_Variant, {
  foreignKey: { name: "product_variant_id" },
});

Product_Variant.hasMany(Feedback, {
  foreignKey: { name: "product_variant_id" },
});

module.exports = Feedback;
