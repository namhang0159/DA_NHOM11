const express = require("express");

const FeedbackController = require("../controllers/FeedbackController");
const jwtAuth = require("../midlewares/jwtAuth");
const verifyToken = require("../midlewares/jwtAuth");
let router = express.Router();

router.get("/list/:product_id", FeedbackController.list);

router.get("/detail/:product_variant_id", jwtAuth, FeedbackController.detail);

router.post("/create", jwtAuth, FeedbackController.create);

router.put("/update", jwtAuth, FeedbackController.update);

router.get("/all", verifyToken, FeedbackController.getAllFeedbacks);

router.delete("/:id", verifyToken, FeedbackController.deleteFeedback);

module.exports = router;
