import 'package:flutter/material.dart';

class Secondplan extends StatelessWidget {
  const Secondplan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 4),
          borderRadius: BorderRadius.circular(12)),
      // color: Colors.white,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Yearly",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          Text("£70.99", style: TextStyle(fontSize: 24, color: Colors.white)),
          SizedBox(
            height: 4,
          ),
          Text("Biled Yearly",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
