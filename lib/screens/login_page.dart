import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify_copy/screens/registration_page.dart';
import 'package:spotify_copy/services/auth.dart';
import 'package:spotify_copy/utils/colors.dart';
import 'package:spotify_copy/components/CustomTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailCtrl = TextEditingController();
  var _passCtrl = TextEditingController();
  bool isLogin = true;

  Future<void> signIn() async {
    try {
      Auth().signIn(email: _emailCtrl.text, password: _passCtrl.text);
    } on FirebaseAuthException catch (error) {}
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
    bool obscureText = false;

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
                txtCtrl: _emailCtrl,
                suffixButton: IconButton(
                  onPressed: () {},
                  padding: const EdgeInsets.only(right: 10),
                  icon: const Icon(Icons.email_outlined, color: Colors.white60),
                ),
                height: 0.08,
                width: 0.8,
              ),
              SizedBox(height: size.height * 0.01),
              //Password
              CustomTextField(
                txtCtrl: _passCtrl,
                obscureText: obscureText,
                suffixButton: IconButton(
                  onPressed: () {
                    if (obscureText == true) {
                      setState(() {
                        obscureText = false;
                      });
                    } else {
                      setState(() {
                        obscureText = true;
                      });
                    }
                  },
                  padding: const EdgeInsets.only(right: 10),
                  icon: const Icon(Icons.remove_red_eye, color: Colors.white60),
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
                  onPressed: () {
                    signIn();
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
