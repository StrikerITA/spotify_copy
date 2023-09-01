import 'package:flutter/material.dart';
import 'package:spotify_copy/services/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Auth().signOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
