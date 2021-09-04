const { body } = require('express-validator');

/**
 *
 * @param {String} type
 * LOGIN | SIGNUP
 */
exports.validate = (type) => {
  switch (type) {
    case 'LOGIN':
      return [
        body('phoneNumber')
          .not()
          .isEmpty()
<<<<<<< HEAD
          .withMessage('Phone number is required'),
        body('phoneNumber').isNumeric().withMessage('Incorrect phone number'),
        body('password').not().isEmpty().withMessage('Password is required'),
=======
          .withMessage("Phone number is required"),
        body("password").not().isEmpty().withMessage("Password is required"),
>>>>>>> a681bb41d630274956307be834bfaa53b3a706e1
      ];
    case 'SIGNUP':
      return [
        body('firstName').not().isEmpty().withMessage('First Name is required'),
        body('lastName').not().isEmpty().withMessage('Last Name is required'),
        body('phoneNumber')
          .not()
          .isEmpty()
<<<<<<< HEAD
          .withMessage('Phone Number is Required'),
        body('dateOfBirth')
=======
          .withMessage("Phone Number is Required"),
        body("dateOfBirth")
>>>>>>> a681bb41d630274956307be834bfaa53b3a706e1
          .not()
          .isEmpty()
          .withMessage('Date of birth is Required'),
        body('bloodType').not().isEmpty().withMessage('Blood type is Required'),
        body('password').not().isEmpty().withMessage('Password is required'),
      ];
    default:
      return [];
  }
};
