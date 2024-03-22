import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.shade100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animation2.json',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Ensure peace of mind with our child-parent mode, allowing you to schedule journeys and stay connected with your child’s current location. ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
