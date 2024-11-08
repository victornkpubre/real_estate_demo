import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_demo/base/colors.dart';

class AppSearchBar extends StatelessWidget {
  final double value;
  const AppSearchBar({
    super.key, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 32,
      left: 32, 
      right:32,
      child: Row(
        children: [
          Expanded(
            child: Transform.scale(
              scale: value,
              child: Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(32)
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/search_dark.svg",
                      width: 22,
                    ),
                    const SizedBox(width: 8),
                    Text("Saint Petersburg")
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Transform.scale(
            scale: value,
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle
              ),
              padding: EdgeInsets.all(16),
              child: Icon(FontAwesomeIcons.sliders, 
                color: grayColor,
                size: 16,
              )
            ),
          ),
    
        ],
      ),
    );
  }
}