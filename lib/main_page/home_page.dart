import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:textfild/main_page/contact_screen.dart';
import 'package:textfild/main_page/my_button.dart';
import 'package:textfild/main_page/my_card.dart';
import 'package:textfild/main_page/my_list_tile.dart';
import 'package:textfild/profile.dart';
import 'package:textfild/session.dart';

class HomePage extends StatefulWidget {
  final String jwttoken;
  final String email;
  const HomePage({Key? key, required this.jwttoken, required this.email})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_controller.page == 2) {
        _controller.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        _controller.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void onButtonTap(String buttonText) async {
    if (buttonText == 'Location') {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        print(
            'Latitude: ${position.latitude}, Longitude: ${position.longitude}');
        // Display the coordinates or navigate to a new screen to show the coordinates
      } catch (e) {
        print('Error getting location: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Welcome !',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),

                  //Plus button
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey[400], shape: BoxShape.circle),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: const [
                  MyCard(
                    titleMain: 'one',
                    text: 'Description',
                    imagePath: 'assets/people.png',
                  ),
                  MyCard(
                    titleMain: 'Two',
                    text: 'Description',
                    imagePath: 'assets/parents.png',
                  ),
                  MyCard(
                    titleMain: 'Three',
                    text: 'Description',
                    imagePath: 'assets/travel.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade800,
              ),
            ),

            SizedBox(height: 40),

            //3 Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Timer
                  Mybutton(
                    iconImagePath: 'assets/timer.png',
                    buttonText: 'Start Session',
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Session(
                                  jwttoken: widget.jwttoken,
                                  email: widget.email,
                                ))),
                  ),

                  //Location
                  Mybutton(
                    iconImagePath: 'assets/map.png',
                    buttonText: 'profile',
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(
                            jwttoken: widget.jwttoken,
                            email: widget.email,
                          ),
                        )),
                  ),

                  Mybutton(
                    iconImagePath: 'assets/contacts.png',
                    buttonText: 'Contacts',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactsPage(
                                  jwtToken: widget.jwttoken,
                                  email: widget.email,
                                )),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  MyListTile(
                    iconImagePath: 'assets/family.png',
                    titleTitle: 'Child-Parent Mode',
                    titleSubTitle: 'More',
                  ),
                  MyListTile(
                    iconImagePath: 'assets/connection.png',
                    titleTitle: 'Connections',
                    titleSubTitle: 'Add Contacts',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
