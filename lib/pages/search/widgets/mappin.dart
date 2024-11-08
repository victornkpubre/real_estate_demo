


// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_demo/base/colors.dart';

class MapPin extends StatefulWidget {
  final double value;
  final double left;
  final double top;
  final double layerValue;
  final bool layer;
  const MapPin({
    super.key, required this.layer, required this.value, required this.layerValue, required this.left, required this.top,
  });

  @override
  State<MapPin> createState() => _MapPinState();
}

class _MapPinState extends State<MapPin> {

  @override
  Widget build(BuildContext context) {
    double? shrinkMinMax(double value, double min, double max) {
      double num = value*(max - min) + min;
      
      if(num < min) {
        return min;
      }
      if(num > max) {
        return max;
      }
      return num;
    }    

    return Positioned(
      top: widget.top,
      left: widget.left,
      width: shrinkMinMax(widget.layerValue, 36, 100),
      height: 48,
      child: Transform.scale(
        scale: widget.value,
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            )
          ),
          child: Stack(
            children: [
              Opacity(
                opacity: widget.layerValue,
                child: Container(
                  // color: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child:  Text('30.3mm P', 
                    style: TextStyle(
                      fontSize: 14*widget.layerValue,
                      color: whiteColor)
                  ),  
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: Opacity(
                  opacity: 1 - widget.layerValue,
                  child: Container(
                    // color: Colors.amber,
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                    child: Icon(
                      color: whiteColor,
                      FontAwesomeIcons.buildingColumns, size: 14)
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}