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
      appBar: AppBar(actions: [
        PopupMenuButton(
            itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                      value: "first item", child: Text("Traval Hestory")),
                  const PopupMenuItem(
                      value: "first item", child: Text("preferred contacts")),
                  const PopupMenuItem(
                      value: "first item", child: Text("Main page")),
                  const PopupMenuItem(value: "first item", child: Text("Help"))
                ])
      ]),
    );
  }
}
