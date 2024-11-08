
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_demo/base/colors.dart';

class MenuButton extends StatefulWidget {
  final bool active;
  final int index;
  final int currentIndex;
  final String icon;
  final Function(int?) onClick;
  final double iconSize;
  final double iconPadding;
  final double iconSizeDifference;
  const MenuButton({
    super.key, 
    this.active = false, 
    required this.icon, 
    required this.onClick, 
    this.iconSize = 26, 
    this.iconPadding = 14, 
    this.iconSizeDifference = 4, required this.index, required this.currentIndex,  
  });

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  late bool active;
  late double inactiveSize;

  @override
  void initState() {
    super.initState();
    active = widget.active;
    inactiveSize = ((widget.iconSize + widget.iconPadding) - widget.iconSizeDifference)*0.5;
  }

  @override
  Widget build(BuildContext context) {
    print("button ${widget.index} is active? ${widget.active}");
    return Stack(
      children: [ 
        ButtonAnimationBuilder(
          icon: widget.icon,
          iconSize: widget.iconSize,
          iconPadding: widget.iconPadding, 
          inactiveSize: inactiveSize, 
          duration: 150,
          active: widget.active,
          onClick: (active) {
            if(active){
              widget.onClick(widget.index);
            }
            else {
              widget.onClick(null);
            }
          },
        ),
      ],
    );
  }
}


class ButtonAnimationBuilder extends StatefulWidget {
  final int duration;
  final bool active;
  final String icon;
  final double iconSize;
  final double iconPadding;
  final double inactiveSize;
  final Function(bool) onClick;
  const ButtonAnimationBuilder({
    super.key,
    required this.duration, required this.iconSize, required this.iconPadding, required this.icon, required this.inactiveSize, required this.onClick, required this.active,
  });

  @override
  State<ButtonAnimationBuilder> createState() => _ButtonAnimationBuilderState();
}

class _ButtonAnimationBuilderState extends State<ButtonAnimationBuilder> with TickerProviderStateMixin {
  double marginFactor1 = 0; // 0 -16
  double widthFactor1 = 0; // 0 - 8
  double opacityFactor = 0;
  double marginFactor2 = 0; // 0 -16
  double opacityFactor2 = 0;
  late bool active;
  late Animation animation1, animation2, animation3; 
  late AnimationController animationCtrl1, animationCtrl2, animationCtrl3; 

  @override
  void initState() {
    super.initState();
    active = widget.active;

    animationCtrl1 = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: widget.duration - 10),
      reverseDuration: Duration(milliseconds: widget.duration*2),
    );
    animationCtrl2 = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: widget.duration - 10),
      reverseDuration: Duration(milliseconds: widget.duration*2- 10),
    );
    animationCtrl3 = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: widget.duration),
      reverseDuration: Duration(milliseconds: widget.duration),
    );
    animation1 = Tween<double>(begin: 0, end: 1).animate(animationCtrl1);
    animation2 = Tween<double>(begin: 0, end: 1).animate(animationCtrl2);
    animation3 = Tween<double>(begin: active? 1:0, end: active? 0:1).animate(animationCtrl3);
  }
  @override
  void didUpdateWidget(covariant ButtonAnimationBuilder oldWidget) {
    active = widget.active;
    opacityFactor = 0;

    animationCtrl1 = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: widget.duration - 10),
      reverseDuration: Duration(milliseconds: widget.duration*2),
    );
    animationCtrl2 = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: widget.duration - 10),
      reverseDuration: Duration(milliseconds: widget.duration*2- 10),
    );
    animationCtrl3 = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: widget.duration*4),
    );
    animation1 = Tween<double>(begin: 0, end: 1).animate(animationCtrl1);
    animation2 = Tween<double>(begin: 0, end: 1).animate(animationCtrl2);
    animation3 = Tween<double>(begin: active? 1:0, end: active? 0:1).animate(animationCtrl3);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    animationCtrl1.dispose();
    animationCtrl2.dispose();
    animationCtrl3.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if(!active) {
          opacityFactor = 1;
          opacityFactor2 = 1;

          animationCtrl2.forward().then((value) {
            animationCtrl2.reverse();
          });
          
          await animationCtrl1.forward();
          await Future.delayed(Duration(milliseconds: (widget.duration)));
          animationCtrl1.reverse().then((value){
            opacityFactor = 0;
          });
          
          animationCtrl3.forward().then((value) {
            opacityFactor2 = 0;
          });


          setState(() {
            active = !active;
          });

          widget.onClick(active);
        }
      },
      child: Stack(
        children: [
           AnimatedBuilder(
            animation: animationCtrl3,
            builder: (context, child) {
              return AnimatedOpacity(
                opacity: animation3.value,
                duration: Duration(milliseconds: widget.duration*2),
                child: Container(
                  height: widget.iconSize + (widget.iconPadding*2),
                  width: widget.iconSize + (widget.iconPadding*2),
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    padding: EdgeInsets.all(widget.iconPadding),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor
                    ),
                    child: SizedBox(
                      height: widget.iconSize,
                      width: widget.iconSize,
                    ),
                  ),
                ),
              );
            }
          ),
           AnimatedBuilder(
            animation: animationCtrl3,
            builder: (context, child) {
              return AnimatedOpacity(
                duration: Duration(milliseconds: 100),
                opacity: (1 - animation3.value).toDouble(),
                child: Container(
                  height: widget.iconSize + (widget.iconPadding*2),
                  width: widget.iconSize + (widget.iconPadding*2),
                  padding: EdgeInsets.all(widget.inactiveSize/2),
                  child: Container(
                    padding: active?
                      EdgeInsets.all(widget.iconPadding):
                      EdgeInsets.all(widget.inactiveSize/2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black
                    ),
                    child: SizedBox(
                      height: widget.inactiveSize,
                      width: widget.inactiveSize,
                    ),
                  ),
                ),
              );
            }
          ),
          Container(
          height: widget.iconSize + (widget.iconPadding*2),
          width: widget.iconSize + (widget.iconPadding*2),
          padding: active?  
          const EdgeInsets.all(0):
          EdgeInsets.all(widget.inactiveSize/2),
          child: Container(
            padding: active?  
              EdgeInsets.all(widget.iconPadding):
              EdgeInsets.all(widget.inactiveSize/2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              widget.icon,
              height: active? widget.iconSize: widget.inactiveSize,
              width: active? widget.iconSize: widget.inactiveSize,
            ),
          ),
        ),
          AnimatedBuilder(
            animation: animationCtrl2,
            builder: (context, child) {
          
              marginFactor2 = animation2.value*18;
              opacityFactor2 = animation2.value;
              
              return Opacity(
                opacity: opacityFactor2,
                child: Container(
                  alignment: Alignment.center,
                  height: widget.iconSize + (widget.iconPadding*2) - marginFactor2,
                  width: widget.iconSize + (widget.iconPadding*2) - marginFactor2,
                  margin: EdgeInsets.all(marginFactor2/2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 230, 230, 230),
                      width: 2,
                    ),
                  ),
                ),
              );
            }
          ),
          AnimatedBuilder(
            animation: animationCtrl1,
            builder: (context, child) {
          
              if(animation1.isForwardOrCompleted){
                marginFactor1 = animation1.value*18;
                widthFactor1 = animation1.value*10;
              }
              else {
                marginFactor1 = 18;
                widthFactor1 = animation1.value*10;
              }
              
              return Opacity(
                opacity: opacityFactor,
                child: Container(
                  alignment: Alignment.center,
                  height: widget.iconSize + (widget.iconPadding*2) - marginFactor1,
                  width: widget.iconSize + (widget.iconPadding*2) - marginFactor1,
                  margin: EdgeInsets.all(marginFactor1/2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 230, 230, 230),
                      width: widthFactor1,
                    ),
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
