import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PasswordResetPage extends StatelessWidget {
  TextEditingController password = TextEditingController();
  fetchpassword() async {
    var url = Uri.http('localhost:8080', '/api/findemail');
    try {} catch (e) {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $jwtToken',
        },
        body: jsonEncode({"password": "$password"}),
      );
      if (response.body == "okay") {
        print("password reaet done");
      }
      else{
        print("not done")
      }

      print(e.toString());
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
              'Enter your New Password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
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
                print(password.text.toString());
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
