import 'package:eshiblood/src/auth/bloc/auth_bloc.dart';
import 'package:eshiblood/src/auth/bloc/auth_event.dart';
import 'package:eshiblood/src/auth/bloc/auth_state.dart';
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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: phoneNumberTextController,
                decoration: inputFieldStyle.copyWith(
                  hintText: "PhoneNumber",
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                obscureText: true,
                controller: passwordTextController,
                decoration: inputFieldStyle.copyWith(
                  hintText: "Password",
                ),
              ),
              SizedBox(height: 10.0),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, authState) {
                  print(authState);
                  // Navigation Code (Eligibility Screen for testing it will be switched to homescren)
                  Navigator.of(context)
                      .pushNamed(RouteGenerator.eligibilityNoticeScreen);
                },
                builder: (context, authState) {
                  return ElevatedButton(
                    onPressed: () {
                      final authBloc = BlocProvider.of<AuthBloc>(context);

                      authBloc.add(
                        LoginEvent(
                          phoneNumber: phoneNumberTextController.text,
                          password: passwordTextController.text,
                        ),
                      );
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
                      style: TextStyle(color: Colors.blueAccent, fontSize: 18),
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
    );
  }
}
