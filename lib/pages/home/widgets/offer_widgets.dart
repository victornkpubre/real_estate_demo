
import 'package:flutter/material.dart';
import 'package:real_estate_demo/base/colors.dart';

class CircleOffer extends StatelessWidget {
  final double value;
  const CircleOffer({
    super.key,
    required this.componentHeight, required this.value,
  });

  final double componentHeight;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: value,
      child: Container(
        height: componentHeight,
        width: componentHeight,
        decoration: const ShapeDecoration(
          color: primaryColor,
          shape: CircleBorder(eccentricity: 1)
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text('BUY',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 14
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(((value*1034).toInt()).toString(),
                      style: const TextStyle(
                        color: whiteColor,
                        fontSize: 34,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const Text('offers', 
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 14
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SquareOffer extends StatelessWidget {
  final double value;
  const SquareOffer({
    super.key,
    required this.componentHeight, required this.value,
  });

  final double componentHeight;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: value,
      child: Container(
        height: componentHeight,
        width: componentHeight,
        decoration: const BoxDecoration(
          color: whiteColorSecondary,
          borderRadius: BorderRadius.all(Radius.circular(24))
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text('RENT',
                style: TextStyle(
                  color:secondaryColor,
                  fontSize: 14
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text(((value*2212).toInt()).toString(),
                      style: const TextStyle(
                        color: secondaryColorDark,
                        fontSize: 34,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const Text('offers', 
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 14
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
