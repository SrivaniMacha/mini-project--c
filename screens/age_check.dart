import 'package:flutter/material.dart';

class AgeCheckScreen extends StatefulWidget {
  const AgeCheckScreen({super.key});

  @override
  State<AgeCheckScreen> createState() => _AgeCheckScreenState();
}

class _AgeCheckScreenState extends State<AgeCheckScreen> {
  final TextEditingController _ageController = TextEditingController();
  String _accessMessage = "";

  String getAccessLevel(int age) {
    if (age < 18) return "referral_required";
    if (age < 60) return "text_allowed";
    return "pictorial_not_allowed";
  }

  void _checkAccess() {
    int? age = int.tryParse(_ageController.text);
    if (age == null) {
      setState(() {
        _accessMessage = "Please enter a valid age.";
      });
      return;
    }

    String accessLevel = getAccessLevel(age);

    if (accessLevel == "referral_required") {
      Navigator.pushNamed(context, '/referral');
    } else if (accessLevel == "text_allowed") {
      Navigator.pushNamed(context, '/text_only');
    } else {
      Navigator.pushNamed(context, '/pictorial');
    }
  }
  void _proceedBasedOnAgeAndGender(int age, String gender) {
    if (age >= 60) {
      Navigator.pushNamed(context, '/pictorial_templates');
    } else if (age >= 18 && age < 60) {
      Navigator.pushNamed(
        context,
        '/text_templates',
        arguments: {'age': age, 'gender': gender},
      );
    } else {
      //ScaffoldMessenger.of(context).showSnackBar(
       // SnackBar(content: Text("Referral required for underage users.")),
      Navigator.pushNamed(context, '/referral');
      //);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Check Your Age")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter your age"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAccess,
              child: const Text("Check Access"),
            ),
            const SizedBox(height: 20),
            Text(_accessMessage, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
