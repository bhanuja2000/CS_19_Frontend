import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:http/http.dart' as http;

class PanicMain extends StatefulWidget {
  final VoidCallback startCountdown;
  final String location;
  final double lat;
  final double log;
  final String email;
  const PanicMain(
      {Key? key,
      required this.startCountdown,
      required this.location,
      required this.lat,
      required this.log,
      required this.email})
      : super(key: key);

  @override
  State<PanicMain> createState() => _PanicMainState();
}

class _PanicMainState extends State<PanicMain> {
  bool isActionCompleted = false;
  List<String> emails = [];

  int timeLeft = 0;
  late Timer _countupTimer;

  @override
  void dispose() {
    _countupTimer.cancel(); // Cancel the timer
    super.dispose();
  }

  Future<void> checkconfo() async {
    try {
      String email = widget.email;
      var url = Uri.http('10.0.2.2:8080', 'api2/user1/$email');
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData is List) {
          // Handle list response
          setState(() {
            emails =
                responseData.map((item) => item['contacts'] as String).toList();
          });
        } else if (responseData is Map<String, dynamic>) {
          // Handle map response
          if (responseData.containsKey('contacts')) {
            emails = [responseData['contacts'] as String];
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

  Future<void> sendtrigerLocation(String address) async {
    try {
      String email = widget.email;
      String address = widget.location;
      var url = Uri.http('10.0.2.2:8080', '/api2/action/$email/$address');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json', // Update content type
          },
          body: jsonEncode(<String, dynamic>{
            "latitude": widget.lat,
            "longitude": widget.log,
            "prefredemails": emails,
          }));
      if (response.statusCode == 200) {
        print("okay");
        checkconfo();
        print(response.body);
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _countupTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!isActionCompleted) {
        setState(() {
          timeLeft++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _showHelpMessage() {
    showDialog(
      context: context,
      builder: (context) => Container(
        width: 500, // width of the dialog
        height: 500, // height of the dialog
        child: SimpleDialog(
          title: Center(
            child: Text(
              'Help is on the way !',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'We have notified the contacts.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Lottie.asset(
                    'assets/animation.json',
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Session'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 230,
            child: Center(
              child: Text(
                _formatTime(timeLeft),
                style: TextStyle(fontSize: 70),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 350, //move the button up or down
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  _countupTimer.cancel();
                  widget.startCountdown(); // Start countdown from Session
                },
                child: Text(
                  'END SESSION',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 600.0, 12.0, 50.0),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: isActionCompleted
                    ? Column(
                        children: [
                          Text(
                            'Alert Sent !',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey[900],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          SlideAction(
                            key: Key('slideAction'),
                            borderRadius: 12,
                            elevation: 0,
                            innerColor: Colors.red,
                            outerColor: Colors.red[200],
                            sliderButtonIcon: const Icon(
                              Icons.sos_rounded,
                              color: Colors.white,
                            ),
                            text: 'Emergency Alert',
                            sliderRotate: false,
                            onSubmit: () {
                              setState(() {
                                sendtrigerLocation(widget.location);
                                isActionCompleted = true;
                                _countupTimer.cancel();
                              });
                              _showHelpMessage();
                            },
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Slide to Alert',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[900],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
