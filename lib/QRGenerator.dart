import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:textfild/session.dart';

class MyApp extends StatelessWidget {
  final String email;
  final String jwt;
  const MyApp({super.key, required this.email, required this.jwt});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QR_Code_Generator",
      theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Color.fromARGB(255, 157, 215, 242)),
      home: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: const EdgeInsets.fromLTRB(40, 80, 40, 0),
              color: Colors.lightBlueAccent,
              child: const Text(
                "Scan the QR",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(100),
              child: QrImageView(
                data: email,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Session(jwttoken: jwt, email: email),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 38, 178, 243)),
                child: const Text(
                  "Done",
                  style: TextStyle(fontSize: 30),
                )),
          ],
        ),
      ),
    );
  }
}
