const User = require("../models/user");
const Role = require("../models/role");
const jwt = require("jsonwebtoken");
const { promisify } = require("util");

/**
 *
 * @param {Object} req
 * @param {Object} res
 * @param {Function} next
 */
exports.verifyUser = async (req, res, next) => {
  try {
    let token = null;
    if (
      req.headers.authorization &&
      req.headers.authorization.startsWith("Bearer")
    ) {
      token = req.headers.authorization.split(" ")[1];
    }

    if (!token) {
      return res.status(401).json({
        status: "error",
        message: "You are not logged in",
      });
    }

    const { id } = await promisify(jwt.verify)(
      token,
      process.env.JWT_SECRET_KEY
    );
    console.log(id);
    const user = await User.findById(id).populate("roles bloodType");
    req.user = user;
    res.setHeader("Content-Type", "application/json");

    next();
  } catch (err) {
    //TODO: Handle Invalid Token, Expired Token
    return res.status(401).json({
      status: "error",
      message: "Your token expired",
    });
    console.log(err);
  }
};

exports.verifyLastDonation = async (req, res, next) => {
  try {
    let user = req.user;
    next();
  } catch (err) {}
};

const checkRole = (userRoles, role) => {};

exports.verifyRole = (roleName, permissionName, titleName) => {
  return async (req, res, next) => {
    try {
      if (!req.user) {
        return res.status(401).json({
          status: "error",
          message: "User Unauthorized",
        });
      }

      const roles = req.user.roles;
      console.log(roles.includes({ roleName: "admin" }), roles);
      const isAllowed = roles.forEach((role) => {
        console.log();
        if (roleName === "user") {
          if (roleName !== role.roleName) {
            return res.status(401).json({
              status: "error",
              message: "Unauthorized user",
            });
          }
        }

        if (!role.title.includes(titleName)) {
          return res.status(401).json({
            status: "error",
            message: "Unauthorized user",
          });
        }

        if (!role.permissions.includes(permissionName)) {
          return res.status(401).json({
            status: "error",
            message: "Unauthorized user",
          });
        }
      });
      next();
    } catch (error) {
      console.log(error);
    }
  };
};
