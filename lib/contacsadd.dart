import 'package:flutter/material.dart';

void main() {
  runApp(PreferredContactsApp());
}

class PreferredContactsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferred Contacts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PreferredContactsPage(),
    );
  }
}

class PreferredContactsPage extends StatefulWidget {
  @override
  _PreferredContactsPageState createState() => _PreferredContactsPageState();
}

class _PreferredContactsPageState extends State<PreferredContactsPage> {
  // Dummy list of contacts
  List<Contact> contacts = [
    Contact(
        name: 'John Doe',
        phoneNumber: '123-456-7890',
        email: 'john@example.com'),
    Contact(
        name: 'Jane Smith',
        phoneNumber: '987-654-3210',
        email: 'jane@example.com'),
    // Add more contacts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferred Contacts'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Phone: ${contacts[index].phoneNumber}'),
                Text('Email: ${contacts[index].email}'),
              ],
            ),
            onTap: () {
              // Handle contact tap
              // You can implement actions like calling, messaging, or emailing the contact here
              print('Tapped contact: ${contacts[index].name}');
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add contact screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddContactPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: Center(
        child: Text('Add Contact Form'),
      ),
    );
  }
}

class Contact {
  final String name;
  final String phoneNumber;
  final String email;

  Contact({required this.name, required this.phoneNumber, required this.email});
}
