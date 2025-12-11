const express = require("express");
const cookieParser = require("cookie-parser");
const cors = require("cors");
const path = require("path");
require("dotenv").config();

const db = require("./configs/database");
const setRouter = require("./routes/index");
const { createRecordsDefault } = require("./configs/createRecordsDefault");

const server = express();
const port = 8080;
global.__basedir = __dirname;

const corsOptions = {
  origin: true,
  credentials: true,
};

server.use(cors(corsOptions));
server.use(cookieParser());
server.use(express.json());
server.use(express.urlencoded({ extended: true }));

server.use("/static", express.static(path.join(__dirname, "public")));
server.use(
  "/static/images",
  express.static(path.join(__dirname, "data", "img"))
);

setRouter(server);

(async () => {
  await db.connect();
  await createRecordsDefault();
})();

server.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
