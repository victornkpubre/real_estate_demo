
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_demo/base/colors.dart';

class Header extends StatelessWidget {
  final double value;
  final double opacity;
  const Header({super.key, required this.value, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width/2.5*value,
          color: whiteColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              value == 1? Icon(
                FontAwesomeIcons.locationDot, 
                color: secondaryColor,
                size: 14,
              ): Container(),
              value == 1? const SizedBox(width: 4): Container(),
              SizedBox(height: 26),
              value == 1? Opacity(
                opacity: opacity,
                child: Text("Saint Petersburg",
                  style: TextStyle(
                    fontSize: 16*value,
                    color: secondaryColor,
                    letterSpacing: -0.8,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ): Container()
            ],
          ),
        ),

        // Image.asset(src)
      ],
    );
  }
}