import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:textfild/passwordreset.dart';
//firstpage of password reset

class Repasssword extends StatefulWidget {
  const Repasssword({Key? key}) : super(key: key);

  State<Repasssword> createState() => _RepassswordState();
}

class _RepassswordState extends State<Repasssword> {
  TextEditingController email = TextEditingController();

  void fetchpassword(String email, BuildContext context) async {
    try {
      var url = Uri.http('10.0.2.2:8080', '/api2/emailfound');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
        }),
      );

      if (response.body == "okay") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PasswordResetPage()),
        );
      } else {
        print("Registration failed with status code: ${response.statusCode}");

        print(response.body);
        print(email);
      }
    } catch (e) {
      print("Error during registration: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest Password"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Forgot Password",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "dont worry sometimes people can forget too, enter your email and we will send you a password reset link.",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  labelText: "Email", prefix: Icon(Icons.email)),
            ),
            SizedBox(height: 17),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      fetchpassword(email.text.toString(), context);
                    },
                    child: Text("Submit")))
          ],
        ),
      ),
    );
  }
}
