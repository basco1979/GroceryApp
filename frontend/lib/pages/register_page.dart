import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../../config.dart';
import '../models/register_request_model.dart';
import '../api/api_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? fullName;
  String? password;
  String? confirmPassword;
  String? email;
  bool hideConfirmPassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#283B71"),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _registerUI(context),
          ),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/ShoppingAppLogo.png",
                    fit: BoxFit.contain,
                    width: 250,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 30, top: 50),
            child: Text(
              "Register",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.face),
              "fullname",
              "Full name",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Fullname can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) {
                fullName = onSavedVal.toString().trim();
              },
              showPrefixIcon: true,
              fontSize: 14,
              prefixIconPaddingLeft: 10,
              initialValue: "",
              obscureText: false,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.black,
              borderColor: Colors.white,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.6),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.mail),
              "email",
              "Email",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Email can\'t be empty.';
                }
                bool emailIsValid = RegExp(
                        r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(onValidateVal);
                if (!emailIsValid) {
                  return "Invalid Email";
                }
                return null;
              },
              (onSavedVal) {
                email = onSavedVal.toString().trim();
              },
              initialValue: "",
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
                context,
                const Icon(Icons.lock),
                "password",
                "Password",
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return 'Password can\'t be empty.';
                  }

                  return null;
                },
                (onSavedVal) {
                  password = onSavedVal.toString().trim();
                },
                initialValue: "",
                obscureText: hidePassword,
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                borderColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  color: Colors.white.withOpacity(0.7),
                  icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                onChange: (val) {
                  password = val;
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.lock),
              "confirmPassword",
              "Confirm Password",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return '* Required';
                }
                if (onValidateVal != password) {
                  return "Confirm password not matched";
                }

                return null;
              },
              (onSavedVal) {
                confirmPassword = onSavedVal.toString().trim();
              },
              initialValue: "",
              obscureText: hideConfirmPassword,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hideConfirmPassword = !hideConfirmPassword;
                  });
                },
                color: Colors.white.withOpacity(0.7),
                icon: Icon(
                  hideConfirmPassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Register",
              () {
                if (validateAndSave()) {
                  setState(() {
                    isApiCallProcess = true;
                  });

                  APIservice.registerUser(fullName!, email!, password!).then(
                    (response) {
                      setState(() {
                        isApiCallProcess = false;
                      });

                      if (response) {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          "Registration Successful. Please login to the account",
                          "OK",
                          () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/login", (route) => false);
                          },
                        );
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          "This email already registered",
                          "OK",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    },
                  );
                }
              },
              btnColor: HexColor("283B71"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: <TextSpan>[
                  const TextSpan(text: "Already have an account?"),
                  TextSpan(
                      text: "Sign In",
                      style: const TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/login", (route) => false);
                        })
                ])),
          )
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
