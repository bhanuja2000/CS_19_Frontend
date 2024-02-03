import 'package:flutter/material.dart';

class Repasssword extends StatefulWidget {
  const Repasssword({super.key});

  @override
  State<Repasssword> createState() => _RepassswordState();
}

class _RepassswordState extends State<Repasssword> {
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
              decoration: const InputDecoration(
                  labelText: "Email", prefix: Icon(Icons.email)),
            ),
            SizedBox(height: 17),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('si');
                    },
                    child: Text("Submit")))
          ],
        ),
      ),
    );
  }
}
