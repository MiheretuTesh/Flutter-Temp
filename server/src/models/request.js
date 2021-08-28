const mongoose = require("mongoose");
const mongoosePaginate = require("mongoose-paginate");

const requestSchema = new mongoose.Schema(
    {
        unitsNeeded:{
            type: Number
        },
        reason: {
            type: String
        },
        totalDonation: {
            type: Number
        },
        status: {
            type: String,
            enum: [
                "Active",
                "Pending",
                "Closed"
              ],
        },
        bloodType: {
            type: String,
            enum: [
              "A",
              "A+",
              "A-",
              "B",
              "B+",
              "B-",
              "AB",
              "AB+",
              "AB-",
              "O",
              "O+",
              "O-",
            ],
          },
        createdBy: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User'
        },
        updatedBy: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User'
        },
        donors: [{
            type: mongoose.Schema.Types.ObjectId, ref: 'User'
        }]
    },
    {
        timestamps: true,
    }
)

requestSchema.plugin(mongoosePaginate);

const Request = mongoose.model('Request', requestSchema);

module.exports = Request;