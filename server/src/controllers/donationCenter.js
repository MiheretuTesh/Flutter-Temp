const DonationCenter = require("../models/donationCenter");
const appointmentController = require("../controllers/appointment");
const { validationResult } = require("express-validator");

DonationCenter.createIndexes({ address: { city: "text" } });

exports.getAllDonationCenter = async (req, res, next) => {
  try {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
      res.status(404).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }
    const page = req.query.page * 1 || 1;
    const limit = req.query.limit * 1 || 1;
    const status = req.query.status || "open";

    const result = await DonationCenter.paginate(
      { isDeleted: false, status },
      {
        page,
        limit,
        sort: "-createdAt",
        populate: {
          path: "timeSlot createdBy updatedBy",
          populate: { path: "roles", model: "Role" },
        },
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

exports.getDonationCenter = async (req, res, next) => {
  try {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
      res.status(404).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }
    const donationCenter = await DonationCenter.findById(req.params.id, {
      isDeleted: false,
    }).populate("timeSlot createdBy updatedBy");
    if (!donationCenter) {
      return res.status(404).json({
        status: "error",
        message: "Donation Center with this ID does not exist",
      });
    }
    if (donationCenter.isDeleted) {
      return res.status(404).json({
        status: "error",
        message: "Donation Center with this ID does not exist",
      });
    }
    res.status(200).json({
      status: "success",
      donationCenter,
    });
  } catch (error) {
    console.log(error);
  }
};

exports.createDonationCenter = async (req, res, next) => {
  try {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
      res.status(404).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }

    const donationCenter = await DonationCenter.create({
      ...req.body,
      timeSlot: req.body.timeSlot._id,
      createdBy: req.user._id,
      updatedBy: req.user._id,
    });

    res.status(201).json({
      status: "success",
      donationCenter,
    });
  } catch (error) {
    console.log(error);
  }
};

exports.updateDonationCenter = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }

    const donationCenter = await DonationCenter.findByIdAndUpdate(
      req.params.id,
      req.body,
      {
        new: true,
        populate: "timeSlot createdBy updatedBy",
      }
    );

    if (!donationCenter) {
      return res.status(404).json({
        status: "error",
        message: "Donation Center with this ID does not exist",
      });
    }
    res.status(200).json({
      status: "success",
      donationCenter,
    });
  } catch (error) {
    console.log(error);
  }
};

exports.deleteDonationCenter = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }
    const donationCenter = await DonationCenter.findById(req.params.id, {
      isDeleted: true,
    });

    if (!donationCenter) {
      return res.status(404).json({
        status: "error",
        message: "Donation Center ID soes not exist",
      });
    }
    res.status(200).json({
      status: "success",
      donationCenter: null,
    });
  } catch (error) {}
};

exports.getNearDonationCenter = async (req, res, next) => {
  try {
    const page = req.query.page * 1 || 1;
    const limit = req.query.limit * 1 || 1;
    const { state, city, woreda } = req.user.address;
    // userAddress = {
    //   bsonType: "object",
    //   properties: {
    //     address: {
    //       // bsonType:"object"
    //     },
    //   },
    // };

    const result = await DonationCenter.paginate(
      {
        $and: [
          { isDeleted: { $eq: false } },
          { status: { $eq: "open" } },
          {
            $or: [
              {
                address: {
                  state: { $eq: state },
                  city: { $text: { $search: city } },
                },
              },
            ],
          },
        ],
      },
      {
        page,
        limit,
        sort: "-createdAt",
        populate: "timeSlot createdBy updatedBy",
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
