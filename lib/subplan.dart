import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:textfild/plans/firstplan.dart';
import 'package:textfild/plans/seondpan.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  bool isselected = true;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3366FF),
      ),
      body: Container(
        height: screenHeight,
        width: screenwidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF3366FF),
                Color(0xFF003366),
              ]),
        ),
        child: Column(children: [
          Text(
            "Subscribe to Premium",
            style: GoogleFonts.acme(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w600), // Customizing font size and color
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => print("first"),
                  child: Firstpackege(),
                ),
                GestureDetector(
                  onTap: () => print("second"),
                  child: Secondplan(),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 20),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Benefits:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "✔  Unlimited access to premium content",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "✔  Personalized recommendations",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "✔  Personalized plans based ",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "✔  Personalized recommendations",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 230,
          ),
          Container(
            width: 400,
            height: 50,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 231, 56, 43)),
                child: const Text(
                  "Subscribe Now",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ]),
      ),
    );
  }
}
