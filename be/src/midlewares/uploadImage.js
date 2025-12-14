const fs = require("fs");
const path = require("path");
const { v4: uuidv4 } = require("uuid");
const multer = require("multer");

const uploadDir = path.resolve("data/images");

if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, uploadDir);
  },
  filename: function (req, file, cb) {
    let fileExtension = "";
    if (file.mimetype === "image/png") fileExtension = ".png";
    else if (file.mimetype === "image/jpg" || file.mimetype === "image/jpeg")
      fileExtension = ".jpg";

    const uniqueName = uuidv4() + fileExtension;
    cb(null, uniqueName);
  },
});

const upload = multer({
  storage,
  fileFilter: (req, file, cb) => {
    if (["image/png", "image/jpg", "image/jpeg"].includes(file.mimetype)) {
      cb(null, true);
    } else {
      cb(new Error("Invalid mime type"));
    }
  },
});

const fileFilter = (req, file, cb) => {
  if (file.mimetype && file.mimetype.startsWith("image/")) {
    cb(null, true);
  } else {
    cb(new Error("Invalid mime type"), false);
  }
};

const uploadImage = multer({
  storage,
  fileFilter,
}).array("files", 6);

module.exports = uploadImage;
