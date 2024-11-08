import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_demo/base/colors.dart';

class SlidingButton extends StatelessWidget {
  final String title;
  final CrossAxisAlignment textAligment;
  final EdgeInsets padding;
  final double value;
  final double opacity;
  
  const SlidingButton({
    super.key,
    required this.title,
    required this.textAligment, required this.padding, required this.value, required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: (MediaQuery.of(context).size.width - 42 - 50)* value,
      child: Container(
        padding: padding,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(215, 221, 221, 221).withAlpha(200),
            borderRadius: const BorderRadius.all(Radius.circular(32))
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: textAligment,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: value<0.05? 
                      Opacity(
                        opacity: opacity,
                        child: Text(title, style: const TextStyle(
                          letterSpacing: -0.7,
                          fontWeight: FontWeight.w700,
                          color: fontBlackColor,
                          fontSize: 16
                        )),
                      ): Container(),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(32)
                    ),
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      FontAwesomeIcons.chevronRight,
                      size: 10,
                      color: secondaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
