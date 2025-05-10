// lib/widgets/motivational_popup.dart
import 'package:flutter/material.dart';
import 'dart:math';

class MotivationalPopup extends StatelessWidget {
  final List<String> quotes = [
    "Keep going, you're doing great!",
    "Every day is a new beginning.",
    "You're stronger than you think.",
    "Turn your wounds into wisdom.",
    "Small steps every day lead to big changes."
  ];

  MotivationalPopup({super.key});

  void show(BuildContext context) {
    final quote = quotes[Random().nextInt(quotes.length)];

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Motivation'),
        content: Text(quote),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Thanks!'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.lightbulb),
      label: const Text('Get Motivation'),
      onPressed: () => show(context),
    );
  }
}
