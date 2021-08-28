const express = require("express");
const userController = require("../controllers/user");
const userValidation = require("../middleware/validation/user");
const { verifyUser } = require("../middleware/auth");
const uploadImage = require("../controllers/uploadImage");

const router = express.Router();

router.post("/login", userValidation.validate("LOGIN"), userController.login);

router.post(
  "/signup",
  uploadImage,
  userValidation.validate("SIGNUP"),
  userController.signup
);

router.get("/search", verifyUser, userController.searchUserByName);

module.exports = router;
