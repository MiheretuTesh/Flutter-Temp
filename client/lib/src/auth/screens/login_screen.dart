import 'package:eshiblood/src/auth/bloc/auth_bloc.dart';
import 'package:eshiblood/src/auth/bloc/auth_event.dart';
import 'package:eshiblood/src/auth/bloc/auth_state.dart';
import 'package:eshiblood/src/auth/bloc/form_submission_status.dart';
import 'package:eshiblood/src/auth/bloc/login_bloc.dart';
import 'package:eshiblood/src/auth/bloc/login_event.dart';
import 'package:eshiblood/src/auth/bloc/login_state.dart';
import 'package:eshiblood/src/auth/bloc/password_visibility_bloc.dart';
import 'package:eshiblood/src/auth/bloc/password_visibility_state.dart';
import 'package:eshiblood/src/utilities/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return BlocProvider(
      create: (context) => ToggleBloc(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: size.height - 200,
              color: Color(0xFFD32026),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeOutQuad,
              top: keyboardOpen ? -size.height / 3.7 : 0.0,
              child: WaveWidget(
                size: size,
                yOffset: size.height / 3.0,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: keyboardOpen
                        ? Container()
                        : Image.asset(
                            'assets/images/eshi_blood_logo.png',
                            width: 140.0,
                          ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text('Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      )),
                ],
              ),
            ),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                final formStatus = state.formStatus;
                print(state);
                if (formStatus is SubmissionFailed) {
                  _showSnackBar(context, formStatus.errorMessage.toString());
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 15.0,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                          return TextInput(
                            prefixIcon: Icons.phone,
                            labelText: 'Phone Number',
                            hintText: '09********',
                            keyboardType: TextInputType.phone,
                            obsecureText: false,
                            onChanged: (value) => context.read<LoginBloc>().add(
                                LoginPhoneNumberChanged(phoneNumber: value)),
                            onValidate: (value) => state.isPhoneNumberValid
                                ? null
                                : 'Invalid Phone Number',
                          );
                        }),
                        SizedBox(
                          height: 10.0,
                        ),
                        BlocBuilder<ToggleBloc, VisibilityState>(
                            builder: (context, toggleState) {
                          return BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return TextInput(
                                prefixIcon: Icons.lock,
                                suffixIcon: toggleState.isVisible
                                    ? IconButton(
                                        onPressed: () {
                                          context.read<ToggleBloc>().add(
                                              ToggleEvent.toggleVisibility);
                                        },
                                        icon: Icon(Icons.visibility_off))
                                    : IconButton(
                                        onPressed: () {
                                          context.read<ToggleBloc>().add(
                                              ToggleEvent.toggleVisibility);
                                        },
                                        icon: Icon(Icons.visibility)),
                                labelText: 'Password',
                                hintText: '🔑🔑',
                                keyboardType: TextInputType.visiblePassword,
                                obsecureText: toggleState.isVisible,
                                onChanged: (value) => context
                                    .read<LoginBloc>()
                                    .add(LoginPasswordChanged(password: value)),
                                onValidate: (value) => state.isPasswordValid
                                    ? null
                                    : 'Password must be at least 4 character',
                              );
                            },
                          );
                        }),
                        // TODO: Forgot password
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     GestureDetector(
                        //         onTap: () {},
                        //         child: Text('Forgot Password',
                        //             style: TextStyle(color: Color(0xFFD32026)))),
                        //   ],
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return state.formStatus is FormSubmitting
                                ? CircularProgressIndicator()
                                : RoundButton(
                                    text: 'LogIn',
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        context
                                            .read<LoginBloc>()
                                            .add(LoginSubmitted());
                                      }
                                    },
                                    color: Color(0xFFD32026),
                                    textColor: Colors.white,
                                  );
                          },
                        ),
                        HorizontalDivider(
                          label: 'or',
                          height: 4.0,
                        ),
                        RoundButton(
                          text: 'Sign Up',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteGenerator.registrationScreen);
                          },
                          color: Color(0xFFFFFFFF),
                          textColor: Color(0xFFD32026),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

class WaveWidget extends StatefulWidget {
  final Size size;
  final double yOffset;
  final Color color;

  WaveWidget({required this.size, required this.yOffset, required this.color});

  @override
  _WaveWidgetState createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {
  late AnimationController animationController;
  List<Offset> wavePoints = [];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    )..addListener(() {
        wavePoints.clear();
        final double waveSpeed = animationController.value * 1080;
        final double fullSphere = animationController.value * Math.pi * 2;
        final double normalizer = Math.cos(fullSphere);
        final double waveWidth = Math.pi / 270;
        final double waveHeight = 20.0;

        for (int i = 0; i <= widget.size.width.toInt(); ++i) {
          double calc = Math.sin((waveSpeed - i) * waveWidth);
          wavePoints.add(Offset(
            i.toDouble(),
            calc * waveHeight * normalizer + widget.yOffset,
          ));
        }
      });

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return ClipPath(
            clipper: ClipperWidget(
              waveList: wavePoints,
            ),
            child: Container(
              width: widget.size.width,
              height: widget.size.height,
              color: widget.color,
            ));
      },
    );
  }
}

class ClipperWidget extends CustomClipper<Path> {
  final List<Offset> waveList;

  ClipperWidget({required this.waveList});

  @override
  getClip(Size size) {
    final Path path = Path();
    path.addPolygon(waveList, false);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

class TextInput extends StatelessWidget {
  final IconData? prefixIcon;
  final IconButton? suffixIcon;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obsecureText;
  final Function(String)? onChanged;
  final int? maxLines;
  final String? Function(String?)? onValidate;

  TextInput(
      {this.maxLines,
      this.prefixIcon,
      this.suffixIcon,
      this.labelText,
      this.hintText,
      this.keyboardType,
      this.obsecureText,
      this.onChanged,
      this.onValidate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              width: 0.8,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          labelText: '$labelText',
          hintText: '$hintText',
          hintStyle: TextStyle(
            color: Color(0xFF707070),
          ),
          prefixIcon: Icon(prefixIcon, color: Color(0xFFD32026)),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD32026), width: 1.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD32026), width: 2.0),
              borderRadius: BorderRadius.circular(30.0)),
        ),
        cursorColor: Color(0xFFD32026),
        onChanged: onChanged,
        validator: onValidate,
        keyboardType: keyboardType,
        obscureText: obsecureText ?? false,
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final Color? color;
  final String? text;
  final Color? textColor;
  final VoidCallback onPressed;
  final double? padding;
  final double? borderCurve;
  final double? width;
  final double? height;

  RoundButton(
      {this.color,
      this.text,
      required this.onPressed,
      this.textColor,
      this.padding,
      this.borderCurve,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 12.0),
      child: Material(
        shadowColor: Color(0xFFD32026),
        elevation: 10.0,
        color: color,
        borderRadius: BorderRadius.circular(borderCurve ?? 30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: width ?? 200.0,
          height: height ?? 55.0,
          child: Text(
            '$text',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    required this.label,
    this.height,
  });

  final String label;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: Color(0xFFD32026),
              height: height,
            )),
      ),
      Text(label, style: TextStyle(color: Color(0xFFD32026))),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: Color(0xFFD32026),
              height: height,
            )),
      ),
    ]);
  }
}

void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
