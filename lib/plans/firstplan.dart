import 'package:flutter/material.dart';

class Firstpackege extends StatefulWidget {
  const Firstpackege({super.key});

  @override
  State<Firstpackege> createState() => _FirstpackegeState();
}

class _FirstpackegeState extends State<Firstpackege> {
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
            "Monthly",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          Text("£9.99", style: TextStyle(fontSize: 24, color: Colors.white)),
          SizedBox(
            height: 4,
          ),
          Text("Biled Monthly",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
