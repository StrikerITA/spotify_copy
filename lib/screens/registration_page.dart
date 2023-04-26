import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify_copy/services/auth.dart';
import 'package:spotify_copy/utils/colors.dart';
import 'package:spotify_copy/components/CustomTextField.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var _emailCtrl = TextEditingController();
  var _passCtrl = TextEditingController();

  Future<void> signUp() async {
    try {
      Auth().signUp(email: _emailCtrl.text, password: _passCtrl.text);
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
                    signUp();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: bgColor, fontSize: size.height * 0.020, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
