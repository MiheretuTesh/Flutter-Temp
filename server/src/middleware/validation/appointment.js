const { body, param } = require("express-validator");
const mongoose = require("mongoose");

exports.validate = (type) =>{
    switch(type){
        case "GET":
            return[
                param("id")
                    .custom((value) => {
                        return mongoose.Types.ObjectId.isValid(value);
                    })
                    .withMessage("Invalid appointment ID"),
            ];
        case "CREATE":
            return [
                body("appointmentDesription")
                    .not()
                    .isEmpty()
                    .withMessage("Appointment Descriptions is required"),
                body("height")
                    .not()
                    .isEmpty().
                    withMessage("Height is required"),
                body("weight")
                    .not()
                    .isEmpty()
                    .withMessage("Weight is required"),
            ];
        case "UPDATE":
            return [
                param("id")
                    .custom((value) => {
                        return mongoose.Types.ObjectId.isValid(value);
                    }).withMessage("Invalid appointment ID"),
                body("donationCenter")
                    .optional()
                    .not().isEmpty()
                    .withMessage("Donation Center is required"),
            ];
        case "DELETE":
            return [
                param('id')
                    .custom((value) =>{
                        return mongoose.Types.ObjectId.isValid(value);
                    }).withMessage("Invalid appointment ID")
            ]
    }
}