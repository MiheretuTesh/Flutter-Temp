import 'dart:io';
import 'package:eshiblood/src/auth/bloc/form_submission_status.dart';
import 'package:eshiblood/src/auth/bloc/signup_bloc.dart';
import 'package:eshiblood/src/auth/bloc/signup_event.dart';
import 'package:eshiblood/src/auth/bloc/signup_state.dart';
import 'package:eshiblood/src/auth/widgets/round_button.dart';
import 'package:eshiblood/src/utilities/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eshiblood/src/auth/widgets/text_input.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: RegisterWidget(),
    );
  }
}

class RegisterWidget extends StatelessWidget {
  RegisterWidget({Key? key}) : super(key: key);

  // final firstNameTextController = TextEditingController();
  // final firstNameTextController = TextEditingController();
  // final firstNameTextController = TextEditingController();
  // final firstNameTextController = TextEditingController();
  var imagePicker;

  @override
  Widget build(BuildContext context) {
    // final inputFieldStyle = InputDecoration(
    //   border: OutlineInputBorder(),
    // );

    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.errorMessage.toString());
        }
      },
      child: Form(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileWidget(),
                  // TextFormField(
                  //   controller: firstNameController,
                  //   decoration: inputFieldStyle.copyWith(
                  //     hintText: "Email",
                  //   ),
                  // ),
                  // BlocBuilder<SignUpBloc, SignUpState>(
                  //   builder: (context, state) {
                  //     return TextFormField(
                  //       decoration: InputDecoration(
                  //         icon: Icon(Icons.person),
                  //         hintText: 'FirstName',
                  //       ),
                  //       onChanged: (value) => context.read<SignUpBloc>().add(
                  //             SignUpFirstNameChanged(firstName: value),
                  //           ),
                  //     );
                  //   },
                  // ),
                  TextInput(
                    prefixIcon: Icons.person,
                    labelText: 'First Name',
                    hintText: 'John',
                  ),
                  TextInput(
                    prefixIcon: Icons.person,
                    labelText: 'Last Name',
                    hintText: 'Doe',
                  ),
                  TextInput(
                    prefixIcon: Icons.phone,
                    labelText: 'PhoneNumber',
                    hintText: '09********',
                    keyboardType: TextInputType.phone,
                  ),
                  TextInput(
                    prefixIcon: Icons.mail,
                    labelText: 'Email',
                    hintText: 'johndoe@example.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextInput(
                    prefixIcon: Icons.lock,
                    labelText: 'Password',
                    hintText: '********',
                  ),
                  // TextFieldWidget(
                  //     "Phone Number",
                  //     "+2519********",
                  //     Icon(
                  //       Icons.phone,
                  //       color: Color(0xFFD32026),
                  //     ),
                  //     textInputType: TextInputType.phone),
                  // TextFieldWidget(
                  //   "Email",
                  //   "Email",
                  //   Icon(
                  //     Icons.mail_outline,
                  //     color: Color(0xFFD32026),
                  //   ),
                  //   textInputType: TextInputType.emailAddress,
                  // ),
                  // TextFieldWidget(
                  //   "Password",
                  //   "Password",
                  //   Icon(
                  //     Icons.lock,
                  //     color: Color(0xFFD32026),
                  //   ),
                  //   obsecureText: true,
                  // ),
                  // TextFieldWidget(
                  //   "Re-enter Password",
                  //   "Re-enter Password",
                  //   Icon(
                  //     Icons.lock,
                  //     color: Color(0xFFD32026),
                  //   ),
                  //   obsecureText: true,
                  // ),
                  // ElevatedButton(
                  //     onPressed: () => {
                  //           showDatePicker(

                  //             context: context,

                  //             initialDate: DateTime.now(),
                  //             firstDate: DateTime(2020),
                  //             lastDate: DateTime(2022),
                  //           )
                  //         },
                  //     child: Text("date")),

                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 360,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(child: Text("dd/mm/yyyy")),
                      ),
                    ),
                    onTap: () => {
                      print("tapped"),
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2022),
                      )
                    },
                  ),

                  GenderRadio(),
                  BloodTypeRadio(),

                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return state.formStatus is FormSubmitting
                          ? CircularProgressIndicator()
                          : RoundButton(
                              onPressed: () {
                                context
                                    .read<SignUpBloc>()
                                    .add(SignUpSubmitted());
                              },
                              text: "Register",
                              textColor: Colors.white,
                              color: Color(0xffd32026),);
                    },
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Log in',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 18),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context)
                                  .pushNamed(RouteGenerator.loginScreen);
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class ProfileWidget extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onTap: () async {
                  // await _picker.pickImage(source: ImageSource.gallery)
                  // File image;
                  print('aaa');
                  var imagePicker =
                      await _picker.pickImage(source: ImageSource.gallery);
                  context
                      .read<SignUpBloc>()
                      .add(SignUpProfileChanged(profile: imagePicker));
                  // await _picker.pickImage(source: ImageSource.gallery)
                },
                child: BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return state.profile == null
                        ? CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                AssetImage("assets/images/person.png"),
                          )
                        : CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                FileImage(File(state.profile.path)),
                          );
                  },
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(offset: Offset(1, 1))],
                  ),
                  child: BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () async {
                          print('aaa');
                          var imagePicker = await _picker.pickImage(
                              source: ImageSource.gallery);
                          context
                              .read<SignUpBloc>()
                              .add(SignUpProfileChanged(profile: imagePicker));

                          // if (imagePicker != null) {
                          //   final authBloc = BlocProvider.of<AuthBloc>(context);

                          //   authBloc.add(SignupEvent(profile: imagePicker));
                          // }
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.grey,
                        ),
                        iconSize: 15,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
            child: Text(
          "Profile",
          style: TextStyle(
            fontSize: 22,
          ),
        )),
      ],
    );
  }
}

class BloodTypeRadio extends StatefulWidget {
  const BloodTypeRadio({Key? key}) : super(key: key);

  @override
  _BloodTypeRadioState createState() => _BloodTypeRadioState();
}

class _BloodTypeRadioState extends State<BloodTypeRadio> {
  String bloodType = "A+";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        width: 350,
        // height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.red),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(width: 20,),
            Text("Blood Type"),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "A+";
                        setState(() {});
                      },
                      value: "A+",
                    ),
                    Text("A+")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "B+";
                        setState(() {});
                      },
                      value: "B+",
                    ),
                    Text("B+")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "AB+";
                        setState(() {});
                      },
                      value: "AB+",
                    ),
                    Text("AB+")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "O+";
                        setState(() {});
                      },
                      value: "O+",
                    ),
                    Text("O+")
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "A-";
                        setState(() {});
                      },
                      value: "A-",
                    ),
                    Text("A-")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "B-";
                        setState(() {});
                      },
                      value: "B-",
                    ),
                    Text("B-")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "AB-";
                        setState(() {});
                      },
                      value: "AB-",
                    ),
                    Text("AB-")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "O-";
                        setState(() {});
                      },
                      value: "O-",
                    ),
                    Text("O-")
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GenderRadio extends StatefulWidget {
  const GenderRadio({Key? key}) : super(key: key);

  @override
  _GenderRadioState createState() => _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  String gender = "male";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.red),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(width: 20,),
            Text("Gender"),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Radio(
                      groupValue: this.gender,
                      onChanged: (String? value) {
                        this.gender = "male";
                        setState(() {});
                      },
                      value: "male",
                    ),
                    Text("Male")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      groupValue: this.gender,
                      onChanged: (String? value) {
                        this.gender = "female";
                        setState(() {});
                      },
                      value: "female",
                    ),
                    Text("Female")
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
