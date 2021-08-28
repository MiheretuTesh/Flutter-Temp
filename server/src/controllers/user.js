const User = require("../models/user");
const Role = require("../models/role");

const jwt = require("jsonwebtoken");
const { validationResult } = require("express-validator");

// uplodaing images

const getToken = (id) => {
  return jwt.sign({ id }, process.env.JWT_SECRET_KEY, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });
};

const isAgeAboveEighteen = async function (user) {
  const birthDate = new Date(user.dateOfBirth);
  const monthDiff = Date.now() - birthDate.getTime();
  const ageDiff = new Date(monthDiff);
  const year = ageDiff.getUTCFullYear();
  const age = Math.abs(year - 1970);
  return age >= 18 || false;
};

/**
 * @param {Object} req,
 * @param {Object}
 */

exports.login = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }

    const user = await User.findOne({
      phoneNumber: req.body.phoneNumber,
    }).select("++password");

    if (
      !user ||
      !(await user.verifyPassword(req.body.password, user.password))
    ) {
      res.status(401).json({
        status: "error",
        message: "Invalid email or password",
      });
    }
    const token = getToken(user._id);
    res.status(201).json({
      status: "success",
      token,
      user,
    });
  } catch (err) {
    console.log(err);
  }
};

exports.signup = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }
    // req.body.roles = await
    // const roleId = (await Role.findOne({ roleName: "user" })) || " ";
    const user = await User.create({
      ...req.body,
      image: req.file.filename,
      // roles: [{ roleId }],
    });
    const token = getToken(user._id);
    res.status(201).json({
      status: "success",
      token,
      user,
    });
  } catch (err) {
    //TODO: Handle Error
    console.log(err);
  }
};

exports.searchUserByName = async (req, res, next) => {
  try {
    const regex = new RegExp(req.query.q);
    const users = await User.find({
      $and: [
        {
          firstName: {
            $regex: regex,
            $options: "si",
          },
        },
        {
          _id: { $ne: req.user._id },
        },
      ],
    });
    res.status(200).json({
      status: "success",
      users,
    });
  } catch (err) {
    //TODO: Handle Error
  }
};
