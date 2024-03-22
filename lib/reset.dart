import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:textfild/repassword.dart';
import 'package:textfild/textfild.dart';
//final page

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  // void fetchpassword(String pass, BuildContext context) async {
  //   try {
  //     var url = Uri.http('10.0.2.2:8080', '/api/emailfound');
  //     var response = await http.post(
  //       url,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $jwtToken',
  //       },
  //       body: jsonEncode({
  //         "email": "bsathsara@gmail.com",
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //     } else {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const Repasssword()),
  //       );
  //       print("Registration failed with status code: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     print("Error during registration: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TextFild(),
                    ));
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Image.asset(
                'assets/pass.jpg',
                width: double.infinity,
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Password Reset Email Sent",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                        "your Account security is our prioity we sent you secure link to safely change your password and keep your account protect"),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TextFild(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(98, 205, 222, 169)),
                          child: const Text(
                            "Done",
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
