import 'dart:io';

import 'package:eshiblood/src/auth/bloc/auth_bloc.dart';
import 'package:eshiblood/src/auth/bloc/auth_event.dart';
import 'package:eshiblood/src/auth/bloc/form_submission_status.dart';
import 'package:eshiblood/src/auth/bloc/signup_bloc.dart';
import 'package:eshiblood/src/auth/bloc/signup_event.dart';
import 'package:eshiblood/src/auth/bloc/signup_state.dart';
import 'package:eshiblood/src/utilities/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'FirstName',
                        ),
                        onChanged: (value) => context.read<SignUpBloc>().add(
                              SignUpFirstNameChanged(firstName: value),
                            ),
                      );
                    },
                  ),
                  TextFieldWidget(
                    "Last Name",
                    "Last Name",
                    Icon(
                      Icons.person,
                      color: Color(0xFFD32026),
                    ),
                  ),
                  TextFieldWidget(
                      "Phone Number",
                      "+2519********",
                      Icon(
                        Icons.phone,
                        color: Color(0xFFD32026),
                      ),
                      textInputType: TextInputType.phone),
                  TextFieldWidget(
                    "Email",
                    "Email",
                    Icon(
                      Icons.mail_outline,
                      color: Color(0xFFD32026),
                    ),
                    textInputType: TextInputType.emailAddress,
                  ),
                  TextFieldWidget(
                    "Password",
                    "Password",
                    Icon(
                      Icons.lock,
                      color: Color(0xFFD32026),
                    ),
                    obsecureText: true,
                  ),
                  TextFieldWidget(
                    "Re-enter Password",
                    "Re-enter Password",
                    Icon(
                      Icons.lock,
                      color: Color(0xFFD32026),
                    ),
                    obsecureText: true,
                  ),
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
                  Center(
                    child: GestureDetector(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: 360,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(child: Text("dd/mm/yyyy")),
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
                  ),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return state.formStatus is FormSubmitting
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                context
                                    .read<SignUpBloc>()
                                    .add(SignUpSubmitted());
                              },
                              child: Text('Sign up'),
                            );
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

class TextFieldWidget extends StatelessWidget {
  String label;

  Icon icon;

  String hint;

  TextInputType textInputType;

  bool obsecureText;

  bool readOnly = false;

  TextFieldWidget(String this.label, String this.hint, Icon this.icon,
      {bool this.obsecureText = false,
      TextInputType this.textInputType = TextInputType.text,
      bool this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        style: TextStyle(
          height: 1.8,
          fontSize: 20,
        ),
        readOnly: this.readOnly,
        obscureText: this.obsecureText,
        keyboardType: this.textInputType,
        cursorColor: Color(0xFFD32026),
        decoration: InputDecoration(
          hintText: this.hint,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
          labelText: this.label,
          labelStyle: TextStyle(color: Colors.redAccent, fontSize: 14),
          prefixIcon: this.icon,
          contentPadding: EdgeInsets.only(left: 20),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD32026), width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD32026), width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
