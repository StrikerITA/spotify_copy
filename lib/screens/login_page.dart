// ignore_for_file: empty_catches, unused_catch_clause
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_copy/screens/registration_page.dart';
import 'package:spotify_copy/services/auth.dart';
import 'package:spotify_copy/utils/colors.dart';
import 'package:spotify_copy/components/CustomTextField.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailCtrl = TextEditingController();
  var _passCtrl = TextEditingController();
  bool isLogin = true;
  bool _obscureText = true;

  Future<void> signIn() async {
    Auth().signIn(context, email: _emailCtrl.text, password: _passCtrl.text);
  }

  @override
  void initState() {
    _emailCtrl = TextEditingController();
    _passCtrl = TextEditingController();
    _emailCtrl.addListener(() {
      setState(() {});
    });
    _passCtrl.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    CupertinoAlertDialog passError = CupertinoAlertDialog(
      title: const Text("Incorrect credentials!"),
      content: const Text(
        "If you lost the password try to reset it or click ok to try another password",
      ),
      //azioni del bottone
      actions: [
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        CupertinoDialogAction(
          child: const Text('Reset password'),
          onPressed: () {
            Navigator.of(context).pop();
            //add launchURL with reset password url
          },
        ),
      ],
    );

    //no blank space
    CupertinoAlertDialog noBlank = CupertinoAlertDialog(
      title: const Text("Insert your credentials correctly"),
      content: const Text(
        "Enter your email and password in the marked fields",
      ),
      //azioni del bottone
      actions: [
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    return Scaffold(
      backgroundColor: bgColor,
      resizeToAvoidBottomInset: false,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Spotify logo
              Image.network(
                "https://storage.googleapis.com/pr-newsroom-wp/1/2018/11/Spotify_Logo_RGB_White.png",
                scale: size.aspectRatio * 30,
              ),
              SizedBox(height: size.height * 0.03),
              //Spotify account text
              Text(
                "Sign up for a free \n Spotify account",
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: size.height * 0.03),
              ),
              SizedBox(height: size.height * 0.03),
              //Email
              CustomTextField(
                obscureText: false,
                txtCtrl: _emailCtrl,
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.white60,
                ),
                height: 0.08,
                width: 0.8,
              ),
              SizedBox(height: size.height * 0.01),
              //Password
              CustomTextField(
                txtCtrl: _passCtrl,
                obscureText: _obscureText,
                //TODO: need to fix the OBS button
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.white60,
                ),
                suffixButton: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  padding: const EdgeInsets.only(right: 10),
                  icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.white60),
                ),
                height: 0.08,
                width: 0.8,
              ),
              SizedBox(height: size.height * 0.02),
              //LoginButton
              SizedBox(
                width: size.width * 0.7,
                height: size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_passCtrl.text.isNotEmpty && EmailValidator.validate(_emailCtrl.text) == true) {
                      signIn();
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return noBlank;
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(color: bgColor, fontSize: size.height * 0.020, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              //Sign up?
              Row(
                children: [
                  const Text(
                    "Want to join on Spotify?",
                    style: TextStyle(color: textColor),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
                    },
                    child: const Text("Sign up"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
