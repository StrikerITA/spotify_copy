import 'package:flutter/material.dart';
import 'package:spotify_copy/services/auth.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyMain());
}

class MyMain extends StatelessWidget {
  const MyMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Spotify Copy",
      home: StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
