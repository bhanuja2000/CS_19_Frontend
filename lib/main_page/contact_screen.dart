import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;

class ContactsPage extends StatefulWidget {
  final String jwtToken;
  final String email;
  const ContactsPage({Key? key, required this.jwtToken, required this.email})
      : super(key: key);
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<String> contacts = [];
  @override
  void initState() {
    super.initState();
    checkconfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: ListView.separated(
          itemCount: contacts.length,
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 8),
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              startActionPane: ActionPane(
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      // Handle chat action
                    },
                    backgroundColor: Colors.blue,
                    icon: Icons.chat,
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      // Handle delete action
                    },
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                  ),
                ],
              ),
              child: Container(
                color: Colors.grey[300],
                child: ListTile(
                  title: Text(contacts[index]), // Display the contact
                  subtitle: Text("Contact:${index + 1}"),
                  leading: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> checkconfo() async {
    try {
      String token = widget.jwtToken;
      String email = widget.email;
      var url = Uri.http('10.0.2.2:8080', 'api/user1/$email');
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData is List) {
          // Handle list response
          setState(() {
            contacts =
                responseData.map((item) => item['contacts'] as String).toList();
          });
        } else if (responseData is Map<String, dynamic>) {
          // Handle map response
          if (responseData.containsKey('contacts')) {
            contacts = [responseData['contacts'] as String];
          } else {
            print('No contacts found in response.');
          }
        } else {
          print('Unexpected response format.');
        }
      } else {
        print('Failed to fetch contacts: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching contacts: $e');
    }
  }
}
