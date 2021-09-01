const express = require("express");
const requestValidation = require("../middleware/validation/request");
const requestController = require("../controllers/request");
// const appointmentController = require("../controllers/");
const { verifyUser, verifyRole } = require("../middleware/auth");

const router = express.Router();

router
  .route("/")
  .get(
    verifyUser,
    verifyRole("user", "view", "request"),
    requestController.getAllRequest
  )
  .post(
    verifyUser,
    verifyRole("admin", "create", "request"),
    requestValidation.validate("CREATE"),
    requestController.createRequest
  );

router
  .route("/:id")
  .get(
    verifyUser,
    verifyRole("user", "view", "request"),
    requestValidation.validate("GET"),
    requestController.getRequest
  )
  .patch(
    verifyUser,
    verifyRole("admin", "update", "request"),
    requestValidation.validate("UPDATE"),
    requestController.updateRequest
  )
  .delete(
    verifyUser,
    verifyRole("admin", "delete", "request"),
    requestValidation.validate("DELETE"),
    requestController.deleteRequest
  );

module.exports = router;
