const { body, param } = require("express-validator");
const mongoose = require("mongoose");

exports.validate = (type) => {
  switch (type) {
    case "GET":
      return [
        param("id")
          .custom((value) => {
            return mongoose.Types.ObjectId.isValid(value);
          })
          .withMessage("Invalid Request ID"),
      ];
    case "CREATE":
      return [
        body("unitsNeeded")
          .not()
          .isEmpty()
          .withMessage("Units of Blood is required"),
        body("totalDonation")
          .not()
          .isEmpty()
          .withMessage("Total donation is required"),
        body("reason").not().isEmpty().withMessage("Reason is required"),
        body("bloodType").not().isEmpty().withMessage("Blood type is required"),
        body("createdBy").not().isEmpty().withMessage("Created by is required"),
      ];
    case "UPDATE":
      return [
        param("id")
          .custom((value) => {
            return mongoose.Types.ObjectId.isValid(value);
          })
          .withMessage("Invalid request ID"),
        body("unitsNeeded")
          .optional()
          .not()
          .isEmpty()
          .withMessage("Blood unit is required"),
        body("reason")
          .optional()
          .not()
          .isEmpty()
          .withMessage("Reason is required"),
        body("bloodType")
          .optional()
          .not()
          .isEmpty()
          .withMessage("Blood type is required"),
        body("createdBy")
          .optional()
          .not()
          .isEmpty()
          .withMessage("Created by is required"),
      ];
    case "DELETE":
      return [
        param("id")
          .custom((value) => {
            return mongoose.Types.ObjectId.isValid(value);
          })
          .withMessage("Invalid request ID"),
      ];
  }
};
