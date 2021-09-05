const Request = require("../models/request");

const { validationResult } = require("express-validator");
const User = require("../models/user");

exports.getAllRequest = async (req, res, next) => {
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

    const result = await Request.paginate(
      { isDeleted: false },
      {
        populate: {
          path: "bloodType createdBy updatedBy donors",
          populate: { path: "donors", model: "User" },
        },
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

exports.getRequest = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }
    const request = await Request.findOne({
      _id: req.params.id,
      isDeleted: false,
    }).populate("bloodType donors createdBy updatedBy");

    if (!request) {
      return res.status(404).json({
        status: "error",
        message: "Request with this ID does not exist",
      });
    }
    if (request.isDeleted) {
      return res.status(404).json({
        status: "error",
        message: "Request with this ID does not exist",
      });
    }
    res.status(200).json({
      status: "success",
      request,
    });
  } catch (error) {
    console.log(error);
  }
};

exports.createRequest = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }
    
    const userBloodType = await BloodType.findOne({
      bloodTypeName: req.body.bloodType,
    });

    const request = await Request.create({
      ...req.body,
      bloodType: userBloodType._id,
      createdBy: req.user._id,
      updatedBy: req.user._id,
      donors: [req.user._id],
    });

    res.status(201).json({
      status: "success",
      request,
    });
  } catch (error) {
    console.log(error);
  }
};

exports.updateRequest = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }

    const request = await Request.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
    });

    if (!request) {
      return res.status(404).json({
        status: "error",
        message: "Request with this ID does not exist",
      });
    }
    res.status(200).json({
      status: "success",
      request,
    });
  } catch (error) {
    console.log(error);
  }
};

exports.deleteRequest = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }
    const request = await Request.findByIdAndUpdate(req.params.id, {
      isDeleted: true,
    });

    if (!request) {
      return res.status(404).json({
        status: "error",
        message: "Request with this ID does not exist",
      });
    }
    res.status(200).json({
      status: "success",
      request: null,
    });
  } catch (error) {
    console.log(error);
  }
};
