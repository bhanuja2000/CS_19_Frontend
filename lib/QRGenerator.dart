import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                data: '1234567890',
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  onPrimary: const Color.fromARGB(255, 38, 178, 243)),
              child: const Text(
                "Done",
                 style: TextStyle(fontSize: 30),
              )
            ),
          ],
        ),
      ),
    );
  }
}
