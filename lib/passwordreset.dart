import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:textfild/profile.dart';
import 'package:textfild/textfild.dart';
//conformation number entering page

class PasswordResetPage extends StatelessWidget {
  PasswordResetPage({
    super.key,
  });
  TextEditingController confomation_number = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> checkconfo(BuildContext context) async {
    try {
      var url = Uri.http('10.0.2.2:8080', '/api2/confomation');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"confomation": confomation_number.text}),
      );
      if (response.body == "true") {
        var url = Uri.http('10.0.2.2:8080', '/api2/passwordreset');
        var response2 = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(
              {"email": "bsathsara@gmail.com", "password": password.text}),
        );
        if (response2.body == "okay") {
          showPasswordUpdateSuccess(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Passord not correct'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('confomation number not correct'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void fetchpassword(String pass, BuildContext context) async {
    try {
      // if (await checkconfo()) {
      //   print("okay");
      // } else {
      //   print("not");
      // }
      // if (await checkconfo()) {
      //   var url = Uri.http('10.0.2.2:8080', '/api/passwordreset');
      //   var response = await http.post(
      //     url,
      //     headers: {
      //       'Content-Type': 'application/json',
      //       'Authorization': 'Bearer $jwtToken',
      //     },
      //     body: jsonEncode({"email": "bsathsara@gmail.com", "password": pass}),
      //   );
      //   if (response.statusCode == 200) {
      //     showPasswordUpdateSuccess(context);
      //   } else {
      //     print("Successfully update" + response.body);
      //   }
      // } else {
      //   print(confomation_number.text);
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(
      //       content: Text('confomation number not correct'),
      //       duration: Duration(seconds: 2),
      //     ),
      //   );
      // }
    } catch (e) {
      print("Error during registration: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Reset'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter Confomation Number And New Password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: confomation_number,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Confomation Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: password,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                //fetchpassword(password.text.toString(), context);
                checkconfo(context);
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }

  void showPasswordUpdateSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Password updated successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TextFild()),
      );
    });
  }
}
