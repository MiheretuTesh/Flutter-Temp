const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const mongoosePaginate = require("mongoose-paginate");

/**
 * Schema for storing user
 *  * First Name - user first name
 *  * Last Name - user last name
 *  * Email - user email
 *  * Password - user password
 */
const schema = new mongoose.Schema(
  {
    firstName: {
      type: String,
    },
    lastName: {
      type: String,
    },
    phoneNumber: {
      type: String,
    },
    email: {
      type: String,
    },
    image: {
      type: String,
      default: "default.png",
    },
    address: {
      type: {
        state: {
          type: String,
        },
        city: {
          type: String,
        },
        woreda: {
          type: String,
        },
      },
    },
    gender: {
      type: String,
    },
    dateOfBirth: {
      type: String,
    },
    lastDonation: {
      type: String,
    },
    password: {
      type: String,
      select: false,
    },
    bloodType: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "BloodType",
    },
    roles: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Role",
    },
    totalDonations: {
      type: Number,
      default: 0,
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

schema.pre("save", async function (next) {
  if (this.isModified("password")) {
    this.password = await bcrypt.hash(this.password, 10);
  }
  next();
});

schema.methods.verifyPassword = async function (
  candidatePassword,
  userPassword
) {
  return await bcrypt.compare(candidatePassword, userPassword);
};

schema.plugin(mongoosePaginate);
// schema.methods.

const User = mongoose.model("User", schema);

module.exports = User;
