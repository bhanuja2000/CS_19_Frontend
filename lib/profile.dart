import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
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
                        value: "second item",
                        child: const Text("preferred contacts"),
                        onTap: () => print("preferred contacts"),
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
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Color.fromARGB(255, 67, 166, 248)),
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
          )
        ],
      ),
    );
  }
}
