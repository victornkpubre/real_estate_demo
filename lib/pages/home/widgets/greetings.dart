import 'package:flutter/material.dart';
import 'package:real_estate_demo/base/colors.dart';

class Greetings extends StatelessWidget {
  final double value;
  const Greetings({
    super.key, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: value,
          child: const Text("Hi Marina",
            style: TextStyle(
              color: secondaryColor, 
              fontSize: 22,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        ClipRRect(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Transform.translate(
              offset: Offset(0, 42*(1-value)),
              child: const Text(
                "let's select your",
                style: TextStyle(
                  color: blackColor,
                  fontSize: 40,
                  letterSpacing: -0.5,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
        ClipRect(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Transform.translate(
              offset: Offset(0, 42*(1-value)),
              child: const Text(
                "perfect place",
                style: TextStyle(
                  color: blackColor,
                  fontSize: 40,
                  letterSpacing: -0.5,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}