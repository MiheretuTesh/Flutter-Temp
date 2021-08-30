const express = require("express");
const donationCenterValidation = require("../middleware/validation/donationCenter");
const donationCenterController = require("../controllers/donationCenter");
const appointmentController = require("../controllers/appointment");
const { verifyUser, verifyRole } = require("../middleware/auth");

const router = express.Router();

router
  .route("/")
  .get(
    verifyUser,
    verifyRole("user", "view", "donationCenter"),
    donationCenterController.getAllDonationCenter
  )
  .post(
    verifyUser,
    verifyRole("admin", "create", "donationCenter"),
    donationCenterValidation.validate("CREATE"),
    donationCenterController.createDonationCenter
  );

router
  .route("/:id")
  .get(
    verifyUser,
    verifyRole("user", "get", "donationCenter"),
    donationCenterValidation.validate("GET"),
    donationCenterController.getDonationCenter
  )
  .patch(
    verifyUser,
    verifyRole("admin", "update", "donationCenter"),
    donationCenterValidation.validate("UPDATE"),
    donationCenterController.updateDonationCenter
  )
  .delete(
    verifyUser,
    verifyRole("admin", "delete", "donationCenter"),
    donationCenterValidation.validate("DELETE"),
    donationCenterController.deleteDonationCenter
  );
module.exports = router;
