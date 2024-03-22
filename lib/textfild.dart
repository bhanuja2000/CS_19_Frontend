import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:textfild/main_page/home_page.dart';
import 'package:textfild/profile.dart';
import 'package:textfild/repassword.dart';
import 'package:textfild/reset.dart';
import 'package:textfild/signup.dart';

class TextFild extends StatefulWidget {
  const TextFild({Key? key}) : super(key: key);

  @override
  _TextFildState createState() => _TextFildState();
}

class _TextFildState extends State<TextFild> {
  late String jwttoken = "";

  bool _isPasswordVisible = false;
  void login(String username, password, BuildContext context) async {
    var url = Uri.http('10.0.2.2:8080', 'sign-in');
    try {
      String basicAuth =
          'Basic ${base64Encode(utf8.encode('$username:$password'))}';
      var response = await http.post(
        url,
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        jwttoken = jsonResponse['access_token'];

        print(jwttoken);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    jwttoken: jwttoken,
                    email: username,
                  )),
        );
      } else {
        print(response.statusCode);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Try Again"),
                content: Text("Password OR Username Not Correct!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('okay'),
                  )
                ],
              );
            });
      }
    } catch (e) {
      Future.error(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.only(top: 50);
    TextEditingController password = TextEditingController();
    TextEditingController username = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: padding,
              child: Row(
                children: [
                  Image.asset(
                    "assets/main.png",
                    width: 200,
                    height: 200,
                  ),
                  const Text(
                    "Good Morning",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: const Row(
                children: [
                  Text(
                    "Loging",
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: username,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_2),
                      hintText: 'User Name',
                    ),
                    autofocus: true,
                    cursorColor: Colors.blue,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      hintText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    obscureText: !_isPasswordVisible,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Repasssword(),
                            ));
                      },
                      child: const Text(
                        'Forgete User Name Or Password',
                        style: TextStyle(
                          color: Color.fromRGBO(252, 108, 100, 20),
                          //decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    login(username.text.toString(), password.text.toString(),
                        context);
                  },
                  child: Text("Login"),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('si1');
                      },
                      icon: const Icon(Icons.facebook),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('si2');
                      },
                      icon: Image.asset(
                        'assets/google.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Signup(jwttokken: jwttoken)),
                  );
                },
                child: const Text(
                  'New User? Registred',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
