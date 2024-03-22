import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:textfild/textfild.dart';

class Profile extends StatefulWidget {
  final String jwttoken;
  final String email;
  const Profile({super.key, required this.jwttoken, required this.email});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController mobilenumber = new TextEditingController();
  TextEditingController account = new TextEditingController();

  void okay() async {
    var url = Uri.http('10.0.2.2:8080', '/api/findemail');
    try {
      String token = widget.jwttoken;
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"email": widget.email}),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        setState(() {
          email.text = jsonMap['userEmail'] ?? '';
          name.text = jsonMap['userName'] ?? '';
          account.text = jsonMap['userRole'] ?? '';
          mobilenumber.text = jsonMap['userMobileNo'] ?? '';
        });
        print(name.text.toString());
        print(mobilenumber.text.toString());
        print(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    okay();
  }

  @override
  Widget build(BuildContext context) {
    print(name.text.toString());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 67, 166, 248),
          actions: [
            PopupMenuButton(
                itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: "first item",
                        child: const Text("Traval Hestory"),
                        onTap: () => print("Traval Hestory"),
                      ),
                      PopupMenuItem(
                        value: "Subscription Plans",
                        child: const Text("preferred contacts"),
                        onTap: () => Navigator.of(context).pushNamed('si2'),
                      ),
                      PopupMenuItem(
                        value: "third item",
                        child: const Text("Main page"),
                        onTap: () => print("Main page"),
                      ),
                      PopupMenuItem(
                        value: "first item",
                        child: const Text("Help"),
                        onTap: () {
                          print("help");
                        },
                      )
                    ])
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Color.fromARGB(255, 67, 166, 248),
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    //margin: const EdgeInsets.all(40),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    child: ClipOval(
                        child: Image.asset(
                      "assets/user.png",
                      fit: BoxFit.cover,
                      height: 250,
                      width: 250,
                    )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                    "Bhanuja",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 15),
            child: const Row(
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 10),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              name.text.toString(),
              style: TextStyle(fontSize: 15),
            ),
          ),
          const Divider(
            thickness: 3,
            color: Colors.grey,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 10),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              email.text.toString(),
              style: TextStyle(fontSize: 15),
            ),
          ),
          const Divider(
            thickness: 3,
            color: Colors.grey,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 10),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Mobile Number",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              mobilenumber.text.toString(),
              style: TextStyle(fontSize: 15),
            ),
          ),
          const Divider(
            thickness: 3,
            color: Colors.grey,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 10),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Account Status",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              account.text.toString(),
              style: TextStyle(fontSize: 15),
            ),
          ),
          const Divider(
            thickness: 3,
            color: Colors.grey,
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(height: 50),
          Center(
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TextFild(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    "Log Out",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
