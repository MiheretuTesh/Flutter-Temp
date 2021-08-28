const mongoose = require("mongoose");
const mongoosePaginate = require("mongoose-paginate");

const donationCenterSchema = new mongoose.schema(
    {
        name:{type: String},
        address: {
            type: {
                state:{
                    type: String,
                },
                city:{ 
                    type: String,
                },
                street:{
                    type: String
                }
            },
        },
        timeSlot: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "TimeSlot"
        },
        createdBy:{
            type: mongoose.Schema.Types.ObjectId, 
            ref: 'User'
        },
        updatedBy: {
            type: mongoose.Schema.Types.ObjectId, 
            ref: 'User'
        },
    },
    {
        timestamps: true,
    }
)

donationCenterSchema.plugin(mongoosePaginate);

const DonationCenter = mongoose.model('DonationCenter', donationCenterSchema);

module.exports = DonationCenter;
