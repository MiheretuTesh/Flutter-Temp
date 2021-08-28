const mongoose = require("mongoose");
const mongoosePaginate = require("mongoose-paginate");

const schema = new mongoose.Schema(
  {
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
    description: {
      type: String,
    },
  },
  {
    timestamps: true,
  }
);

schema.plugin(mongoosePaginate);

const BloodType = mongoose.model("BloodType", schema);

module.exports = BloodType;
