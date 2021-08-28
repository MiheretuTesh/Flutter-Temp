const mongoose = require("mongoose");
const mongoosePaginate = require("mongoose-paginate");

/**
 * Schema for storing role
 *  * roleName - role name
 *  * actions - role description
 *  *
 */
const schema = new mongoose.Schema(
  {
    roleName: {
      type: String,
    },
    _permissions: [
      {
        type: String,
      },
    ],
    createdBy: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
  },
  {
    timestamps: true,
  }
);

schema.plugin(mongoosePaginate);

const Role = mongoose.model("Role", schema);

module.exports = Role;
