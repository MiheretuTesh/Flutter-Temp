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
    permissions: {
      type: [
        {
          type: String,
          enum: ["view", "create", "update", "delete"],
        },
      ],
      default: ["view", "create", "update", "delete"],
    },
    title: {
      type: [{ type: String }],
      default: ["appointment"],
    },
    createdBy: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
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

schema.plugin(mongoosePaginate);

const Role = mongoose.model("Role", schema);

module.exports = Role;
