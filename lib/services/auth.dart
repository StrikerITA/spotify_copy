// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../components/CustomAlertDialog.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  final storage = FirebaseStorage.instance.ref();

  Future<void> signIn(BuildContext context, {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            title: "Authentication error",
            content: error.message,
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> signUp(BuildContext context, {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            title: "Authentication error",
            content: error.message,
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> recoveryPassw(BuildContext context, {required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<String> getImageFB(String fileName) async {
    try {
      return await storage.child(fileName).getDownloadURL();
    } catch (error) {
      print("Errore durante il recupero dell'immagine: $error");
      return 'null';
    }
  }
}
