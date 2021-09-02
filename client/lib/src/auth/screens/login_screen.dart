import 'package:eshiblood/src/auth/bloc/auth_bloc.dart';
import 'package:eshiblood/src/auth/bloc/auth_event.dart';
import 'package:eshiblood/src/auth/bloc/auth_state.dart';
import 'package:eshiblood/src/auth/bloc/form_submission_status.dart';
import 'package:eshiblood/src/auth/bloc/login_bloc.dart';
import 'package:eshiblood/src/auth/bloc/login_event.dart';
import 'package:eshiblood/src/auth/bloc/login_state.dart';
import 'package:eshiblood/src/utilities/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final phoneNumberTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final inputFieldStyle = InputDecoration(
      border: OutlineInputBorder(),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            final formStatus = state.formStatus;
            if (formStatus is SubmissionFailed) {
              _showSnackBar(context, formStatus.errorMessage.toString());
            }
          },
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Validator refer koki loco github
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: phoneNumberTextController,
                      decoration: inputFieldStyle.copyWith(
                        hintText: "PhoneNumber",
                      ),
                      onChanged: (value) => context.read<LoginBloc>().add(
                            LoginPhoneNumberChanged(phoneNumber: value),
                          ),
                    );
                  },
                ),
                SizedBox(height: 10.0),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return TextFormField(
                      obscureText: true,
                      controller: passwordTextController,
                      decoration: inputFieldStyle.copyWith(
                        hintText: "Password",
                      ),
                      onChanged: (value) => context.read<LoginBloc>().add(
                            LoginPasswordChanged(password: value),
                          ),
                    );
                  },
                ),
                SizedBox(height: 10.0),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state.formStatus is FormSubmitting
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              // if (formKey.currentState.validate()) {
                              context.read<LoginBloc>().add(LoginSubmitted());
                            },
                            child: Text("Login"),
                          );
                  },
                ),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign up',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 18),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pushNamed(RouteGenerator.registrationScreen);
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
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
