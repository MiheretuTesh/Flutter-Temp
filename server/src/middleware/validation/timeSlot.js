const { body, param } = require("express-validator");
const mongoose = require("mongoose");

exports.validate = (type) => {
  switch (type) {
    case "GET":
      return [
        param("id")
          .custom((value) => {
            return mongoose.Types.ObjectId(value);
          })
          .withMessage("Invalid blood type ID"),
      ];
    case "CREATE":
      return [
        body("endDate").not().isEmpty().withMessage("End Date is required"),
      ];
    case "UPDATE":
      return [
        param("id")
          .custom((value) => {
            return mongoose.Types.ObjectId.isValid(value);
          })
          .withMessage("Invalid Date Input value"),
      ];
  }
};
