import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController =
      TextEditingController(); // Controller for the text input field
  final ScrollController _scrollController =
      ScrollController(); // Controller for scrolling the chat list
  late String _currentLocation; // Variable to store the current location

  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // Retrieve current location when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'), // Assign the contact name
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              controller:
                  _scrollController, // Assign the scroll controller to the ListView
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(35.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller:
                        _messageController, // Assign the controller to the TextFormField
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed:
                      _sendMessage, // Call _sendMessage method when the send button is pressed
                ),
                IconButton(
                  icon: Icon(Icons.location_on),
                  onPressed:
                      _sendLocation, // Call _sendLocation method when the location button is pressed
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String messageText = _messageController.text
        .trim(); // Get the text from the text input field
    if (messageText.isNotEmpty) {
      setState(() {
        messages.add(messageText); // Add the message to the list
      });
      _messageController.clear(); // Clear the text input field
      _scrollToBottom(); // Scroll to the bottom of the chat list
    }
  }

  void _sendLocation() {
    String locationMessage = 'Current Location: $_currentLocation';
    setState(() {
      messages.add(locationMessage); // Add the location message to the list
    });
    _scrollToBottom(); // Scroll to the bottom of the chat list
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController
          .position.maxScrollExtent, // Scroll to the maximum extent
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  String _getCurrentLocation() {
    return _currentLocation = "Kaluthara"; // Get the current location
  }
}
