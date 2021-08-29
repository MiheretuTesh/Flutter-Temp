const DonationCenter = require('../models/donationCenter');

const { validationResult } = require("express-validation");

exports.getAllDonationCenter = async(req, res, next) => {
    try{
        const errors = validationResult(req);

        if(!errors.isEmpty()){
            res.status(404).json({
                status: "error",
                message: errors.array()[0].msg,
            });
        }
        const page = req.query.page * 1 || 1;
        const limit = req.query.limit * 1 || 1;
    
        const result = await DonationCenter.paginate(
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

exports.getDonationCenter = async(req, res, next) => {
    try{
        const errors = validationResult(req);

        if(!errors.isEmpty()) {
            res.status(404).json({
                status: "error",
                message: errors.array()[0].msg,
            });
        }
        const donationCenter = await DonationCenter.findById(req.params.id);
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

exports.createDonationCenter = async(req, res, next) => {
    try{
        const errors = validationResult(req);
    
        if(!errors.isEmpty()) {
            res.status(404).json({
                status: "error",
                message: errors.array()[0].msg,
            });
    }

    const donationCenter = await DonationCenter.create({
        ...req.body,
        timeSlot: req.body.timeSlot._id,
        createdBy: req.user._id,
        updatedBy: req.user._id
    });

    res.status(201).json({
        status: "success",
        donationCenter,
      });
    }catch(error) {
        console.log(error);
    }
};

exports.updateDonationCenter = async(req, res, next) => {
    try{
        const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        status: "error",
        message: errors.array()[0].msg,
      });
    }

    const donationCenter = await DonationCenter.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
    });

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
    }catch(error){
      console.log(error);
    }
};

exports.deleteDonationCenter = async(req, res, next) => {
  try {
    const errors = validationResult(req);
  if(!errors.isEmpty()) {
    res.status(400).json({
      status: "error",
      message: errors.array()[0].msg,
    });
  }
  const donationCenter = await DonationCenter.findById(req.params.id, {
    isDeleted: true,
  });

  if(!donationCenter) {
    return res.status(404).json({
      status: "error",
      message: "Donation Center ID soes not exist"
    });
  }
  res.status(200).json({
    status: "success",
    donationCenter: null,
  })
  } catch (error) {
    
  }
}