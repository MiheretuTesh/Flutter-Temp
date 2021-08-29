const Appointment = require('../models/appointment');

const { validationResult } = require("express-validation");

exports.getAllAppointments = async (req, res, next) => {
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
    
        const result = await Appointment.paginate(
          { isDeleted: false },
          {
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
      const appointment = await Appointment.findById(req.params.id);
      if (!appointment) {
        return res.status(404).json({
          status: "error",
          message: "Appointment with this ID does not exist",
        });
      }
      if (appointment.isDeleted) {
        return res.status(404).json({
          status: "error",
          message: "Appoinmets with this ID does not exist",
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

  
exports.createAppointment = async (req, res, next) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.status(400).json({
          status: "error",
          message: errors.array()[0].msg,
        });
      }
  
      const appointment = await Appointment.create({
        ...req.body,
        userId: req.user._id,
        donationCenter: req.body.donationCenter._id,
      });
      
      res.status(201).json({
        status: "success",
        appointment,
      });
    } catch (error) {
      console.log(error);
    }
};


exports.updateAppointment = async (req, res, next) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.status(400).json({
          status: "error",
          message: errors.array()[0].msg,
        });
      }
  
      const appointment = await Appointment.findByIdAndUpdate(req.params.id, req.body, {
        new: true,
      });
  
      if (!appointment) {
        return res.status(404).json({
          status: "error",
          message: "Role with this ID does not exist",
        });
      }
      res.status(200).json({
        status: "success",
        appointment,
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
      const appointment = await Appointment.findByIdAndUpdate(req.params.id, {
        isDeleted: true,
      });
  
      if (!appointment) {
        return res.status(404).json({
          status: "error",
          message: "Role with this ID does not exist",
        });
      }
      res.status(200).json({
        status: "success",
        appointment: null,
      });
    } catch (error) {
      console.log(error);
    }
  };