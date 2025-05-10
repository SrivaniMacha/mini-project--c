import 'package:flutter/material.dart';
import '../widgets/motivational_popup.dart'; // ✅ Import the motivational popup widget

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Echo Diary'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.edit_note),
              label: const Text("Write Diary"),
              onPressed: () {
                Navigator.pushNamed(context, '/write');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.book),
              label: const Text("Read Diary"),
              onPressed: () {
                Navigator.pushNamed(context, '/read');
              },
            ),
            const SizedBox(height: 20),
            // ✨ Motivational Popup Button
            MotivationalPopup(),
          ],
        ),
      ),
    );
  }
}
