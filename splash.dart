import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use the correct path relative to pubspec.yaml
            Image.asset("lib/auth/assets/logo.png", height: 150),
            const SizedBox(height: 20),
            const Text(
              "Echo Diary",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to login screen
        Future.delayed(Duration(seconds: 2), () {
                Navigator.pushReplacementNamed(context, "/login");
                });


              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
