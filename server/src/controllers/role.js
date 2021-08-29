const Role = require("../models/role");
const { validationResult } = require("express-validator");
const User = require("../models/user");

exports.getAllRoles = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }
    const page = req.query.page * 1 || 1;
    const limit = req.query.limit * 1 || 1;

    const result = await Role.paginate(
      { isDeleted: false },
      {
        populate: "users",
        page,
        limit,
        sort: "-createdAt",
      }
    );
    res.status(200).json({
      status: "success",
      result,
    });
  } catch (error) {
    console.log(error);
  }
};

exports.getRole = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }
    const role = await Role.findById(req.params.id);
    if (!role) {
      return res.status(404).json({
        status: "error",
        message: "Role with this ID does not exist",
      });
    }
    if (role.isDeleted) {
      return res.status(404).json({
        status: "error",
        message: "Role with this ID does not exist",
      });
    }
    res.status(200).json({
      status: "success",
      role,
    });
  } catch (error) {
    console.log(error);
  }
};

exports.createRole = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }

    const role = await Role.create({
      ...req.body,
      createdBy: req.user._id,
    });
    res.status(201).json({
      status: "success",
      role,
    });
  } catch (error) {
    console.log(error);
  }
};

exports.updateRole = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }

    const role = await Role.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
    });

    if (!role) {
      return res.status(404).json({
        status: "error",
        message: "Role with this ID does not exist",
      });
    }
    res.status(200).json({
      status: "success",
      role,
    });
  } catch (error) {
    console.log(error);
  }
};

exports.deleteRole = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }
    const role = await Role.findByIdAndUpdate(req.params.id, {
      isDeleted: true,
    });

    if (!role) {
      return res.status(404).json({
        status: "error",
        message: "Role with this ID does not exist",
      });
    }
    res.status(200).json({
      status: "success",
      role: null,
    });
  } catch (error) {
    console.log(error);
  }
};
