import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:textfild/profile.dart';

class PasswordResetPage extends StatelessWidget {
  TextEditingController password = TextEditingController();
  String jwtToken =
      "eyJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJCaGFudWphIiwic3ViIjoiYnNhdGhzYXJhQGdtYWlsLmNvbSIsImV4cCI6MTcxMDg0Nzc3NSwiaWF0IjoxNzEwODQ2ODc1LCJzY29wZSI6IlJFQUQifQ.epdCPZHRsSELcjh-sgx_WHH0djOh0Z_9bJXab3VkyJxH1Hp2EeH7JOsPLvkM_xzOKn6g7msSR8aWo7Gh-RfnMz_CoUq3R-x6BH8lSQpvMIvWMJDUPLXuGP0kRSG2kH2mfSB2mrKMp1ZWnXjUWi1UUajz6xuTBHGSZ6xAc-49UXRRe_K8tc4q9ngEu-dYBuDthlfQvj_JQelWEV76GqVDfaiGiJ9Jd23-X96lywrYv5DiBRhQMwmI1HTEV9FF0xMHQf70kzhb_f07jwFtQ5Cd-fPBCCa2eiYdR-KVItJQ76K2k6iwgSMv45hyw7fwFfdK3kfwU9jPh1xR6OmFY9Pyow";
  void fetchpassword(String pass, BuildContext context) async {
    try {
      var url = Uri.http('localhost:8080', '/api/passwordreset');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $jwtToken',
        },
        body: jsonEncode({"email": "bsathsara@gmail.com", "password": pass}),
      );

      if (response.statusCode == 200) {
        print("Successfully update" + response.body);
        showPasswordUpdateSuccess(context);
      } else {
        print("Registration failed with status code: ${response.statusCode}");
      }
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
                fetchpassword(password.text.toString(), context);
                print(password.text);
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
        duration: Duration(seconds: 2), // Adjust duration as needed
      ),
    );
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Profile()),
      );
    });
  }
}
