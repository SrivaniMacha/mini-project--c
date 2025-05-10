import 'package:flutter/material.dart';

class ReferralPage extends StatelessWidget {
  const ReferralPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController referralCodeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Referral Required'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Referral Needed to Continue',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Since you are under 18, please provide a valid referral code from a guardian or existing user to continue using Echo Diary.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: referralCodeController,
              decoration: const InputDecoration(
                labelText: 'Enter Referral Code',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String code = referralCodeController.text.trim();
                  if (code == "ECHO123") {
                    // You can replace with your backend check
                    Navigator.pushNamed(context, '/text_only',
                        arguments: {'age': 17, 'gender': 'Unknown'});

                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid referral code')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
