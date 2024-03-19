import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  TextEditingController _verificationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification Code"),
      ),
      body: Column(
        children: [
          const Text(
            "Enter Varification Code",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "An email has been sent from userprofile@cas.org to",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(14),
            child: const Text(
              "If you don't get an email in the next 5 minutescheck your spam folder",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 19,
          ),
          TextField(
            controller: _verificationController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Verification Code',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                // Validate the entered verification code
                String verificationCode = _verificationController.text;
                print(verificationCode);
              },
              child: Text("Okay"),
            ),
          )
        ],
      ),
    );
  }
}
