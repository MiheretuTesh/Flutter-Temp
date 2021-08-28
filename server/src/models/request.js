const mongoose = require("mongoose");
const mongoosePaginate = require("mongoose-paginate");

const requestSchema = new mongoose.Schema(
    {
        unitsNeeded:{
            type: Number
        },
        reasons: {
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
            type: Schema.Types.ObjectId,
            ref: 'User'
        },
        updatedBy: {
            type: Schema.Types.ObjectId,
            ref: 'User'
        },
        donors: [{
            type: Schema.Types.ObjectId, ref: 'User'
        }]
    },
    {
        timestamps: true,
    }
)

requestSchema.plugin(mongoosePaginate);

const Request = mongoose.model('Request', requestSchema);

module.exports = Request;