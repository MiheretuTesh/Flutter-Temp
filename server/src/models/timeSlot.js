const mongoose = require("mongoose");
const mongoosePaginate = require("mongoose-paginate");

const timeSlotSchema = new mongoose.Schema(
  {
    startDate: { type: Date },
    endDate: { type: Date },
    status: {
      type: String,
      enum: ["Active", "Pending", "Closed"],
    },
    isDeleted: {
      type: Boolean,
      default: false,
    },
  },
  {
    timestamps: true,
  }
);

timeSlotSchema.plugin(mongoosePaginate);

const TimeSlot = mongoose.model("TimeSlot", timeSlotSchema);

module.exports = TimeSlot;
