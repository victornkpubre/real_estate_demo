import 'package:flutter/material.dart';
import 'package:real_estate_demo/base/colors.dart';
import 'package:real_estate_demo/pages/home/widgets/menu_button.dart';


class BottomNavigation extends StatefulWidget {
  final double value;
  final int activeIndex;
  final Function(int) onClick;
  const BottomNavigation({super.key, required this.value, required this.activeIndex, required this.onClick});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<String> icons = [
    'assets/icons/search.svg',
    'assets/icons/chat.svg',
    'assets/icons/home.svg',
    'assets/icons/heart.svg',
    'assets/icons/profile.svg',
  ];
  late int currentIndex;


  @override
  void initState() {
    currentIndex = widget.activeIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Transform.translate(
        offset: Offset(0, MediaQuery.of(context).size.width/4*(1 -widget.value)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: blackAccent,
                  borderRadius: BorderRadius.circular(32)
                ),
                padding: const EdgeInsets.symmetric(vertical:4, horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: icons.map((icon) {
                    int index = icons.indexOf(icon);
        
                    return MenuButton(
                      icon: icon,
                      index: index,
                      currentIndex: currentIndex,
                      active: index==currentIndex,
                      onClick: (selection){
                        if(selection != null) {
                          setState(() {
                            currentIndex = selection;
                          });

                          widget.onClick(selection);
                        }
                      },
                    );
                  }).toList()
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}