const mongoose = require("mongoose");
const mongoosePaginate = require("mongoose-paginate");

const appointmentSchema = new mongoose.Schema(
  {
    userId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
    acceptorId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
    startDate: {
      type: Date,
    },
    endDate: {
      type: Date,
    },
    status: {
      type: String,
      enum: ["active", "pending", "closed", "rejected", "canceled"],
      default: "pending",
    },
    appointmentDescription: {
      type: String,
    },
    height: {
      type: Number,
    },
    weight: {
      type: Number,
    },
    donationCenter: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "DonationCenter",
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

appointmentSchema.plugin(mongoosePaginate);

const Appointment = mongoose.model("Appointment", appointmentSchema);

module.exports = Appointment;
