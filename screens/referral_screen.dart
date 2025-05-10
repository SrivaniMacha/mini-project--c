import 'package:flutter/material.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Referral Required")),
      body: const Center(child: Text("Please get a referral to proceed.")),
    );
  }
}

