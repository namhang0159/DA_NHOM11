const express = require("express");
const router = express.Router();
const controller = require("../controllers/ReportController");

router.post("/", controller.create);            
router.get("/", controller.findAll);            
router.patch("/:id/status", controller.updateStatus);

module.exports = router;