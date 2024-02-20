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
            child: const Text(
              "M.D.B.R Kannangara",
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
            child: const Text(
              "bsathsara@gmail.com",
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
            child: const Text(
              "0754806795",
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
            child: const Text(
              "Premium User",
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
                  onPressed: () {},
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
