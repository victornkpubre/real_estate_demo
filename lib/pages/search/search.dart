// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_demo/base/colors.dart';
import 'package:real_estate_demo/pages/home/home.dart';
import 'package:real_estate_demo/pages/home/widgets/bottom_navigation.dart';
import 'package:real_estate_demo/pages/search/widgets/mappin.dart';
import 'package:real_estate_demo/pages/search/widgets/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  
  late Animation 
    growAnimation1, 
    growAnimation2,
    popupAnimation,
    layerAnimation; 
  late AnimationController 
    growAnimationCtrl1, 
    growAnimationCtrl2, 
    popupAnimationCtrl,
    layerAnimationCtrl;
  int headerAnimationDuration = 900; 


  @override
  void initState() {

    growAnimationCtrl1 = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: headerAnimationDuration),
    );
    growAnimation1 = Tween<double>(begin: 0, end: 1)
      .animate(growAnimationCtrl1);
    
    growAnimationCtrl2 = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: (headerAnimationDuration/2).toInt()),
    );
    growAnimation2 = Tween<double>(begin: 0, end: 1)
      .animate(growAnimationCtrl2);

    popupAnimationCtrl = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: (headerAnimationDuration/4).toInt()),
    );
    popupAnimation = Tween<double>(begin: 0, end: 1)
      .animate(popupAnimationCtrl);

    layerAnimationCtrl = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: headerAnimationDuration),
    );
    layerAnimation = Tween<double>(begin: 1, end: 0)
      .animate(layerAnimationCtrl);

    startAnimations();

    super.initState();
  }

  Future<void> startAnimations() async {
    await Future.delayed(Duration(milliseconds: 1000));
    await growAnimationCtrl1.forward();
    await growAnimationCtrl2.forward();
  }

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

  @override
  void dispose() {
    growAnimationCtrl1.dispose(); 
    growAnimationCtrl2.dispose();
    popupAnimationCtrl.dispose();
    layerAnimationCtrl.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/darkmatter2.jpg',
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),

          AnimatedBuilder(
            animation: growAnimationCtrl1,
            builder: (context, _) {
              return AppSearchBar(value: growAnimation1.value);
            }
          ),

          AnimatedBuilder(
              animation: growAnimationCtrl2,
              builder: (context, _) {
              return AnimatedBuilder(
                animation: layerAnimationCtrl,
                builder: (context, _) {
                  print("layer value is ${layerAnimation.value}");
                  return MapPin(
                    top: 100,
                    left: 64,
                    value: growAnimation2.value, 
                    layerValue: layerAnimation.value, 
                    layer: true
                  );
                }
              );
            }
          ),
          AnimatedBuilder(
              animation: growAnimationCtrl2,
              builder: (context, _) {
              return AnimatedBuilder(
                animation: layerAnimationCtrl,
                builder: (context, _) {
                  print("layer value is ${layerAnimation.value}");
                  return MapPin(
                    top: 300,
                    left: 80,
                    value: growAnimation2.value, 
                    layerValue: layerAnimation.value, 
                    layer: true
                  );
                }
              );
            }
          ),
          AnimatedBuilder(
              animation: growAnimationCtrl2,
              builder: (context, _) {
              return AnimatedBuilder(
                animation: layerAnimationCtrl,
                builder: (context, _) {
                  print("layer value is ${layerAnimation.value}");
                  return MapPin(
                    top: 200,
                    left: 200,
                    value: growAnimation2.value, 
                    layerValue: layerAnimation.value, 
                    layer: true
                  );
                }
              );
            }
          ),
          AnimatedBuilder(
              animation: growAnimationCtrl2,
              builder: (context, _) {
              return AnimatedBuilder(
                animation: layerAnimationCtrl,
                builder: (context, _) {
                  print("layer value is ${layerAnimation.value}");
                  return MapPin(
                    top: 350,
                    left: 220,
                    value: growAnimation2.value, 
                    layerValue: layerAnimation.value, 
                    layer: true
                  );
                }
              );
            }
          ),
          AnimatedBuilder(
              animation: growAnimationCtrl2,
              builder: (context, _) {
              return AnimatedBuilder(
                animation: layerAnimationCtrl,
                builder: (context, _) {
                  print("layer value is ${layerAnimation.value}");
                  return MapPin(
                    top: 450,
                    left: 64,
                    value: growAnimation2.value, 
                    layerValue: layerAnimation.value, 
                    layer: true
                  );
                }
              );
            }
          ),

          //Bottom Menu
          Positioned(
            bottom: 112,
            left: 32,
            right:32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [

                    //Left Icons
                    AnimatedBuilder(
                      animation: growAnimationCtrl1,
                      builder: (context, _) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/4,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Transform.scale(
                                  scale: growAnimation1.value,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: grayColor.withAlpha(150),
                                      shape: BoxShape.circle
                                    ),
                                    padding: EdgeInsets.all(16),
                                    child: Icon(
                                      Icons.work, 
                                      size: 18,
                                      color: whiteColor,)
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              width: MediaQuery.of(context).size.width/4,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    if(popupAnimationCtrl.isForwardOrCompleted) {
                                      popupAnimationCtrl.reverse();
                                    }
                                    else {
                                      popupAnimationCtrl.forward();
                                    }
                                  },
                                  child: Transform.scale(
                                    scale: growAnimation1.value,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: grayColor.withAlpha(150),
                                        shape: BoxShape.circle
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Icon(
                                        FontAwesomeIcons.paperPlane, 
                                        size: 18,
                                        color: whiteColor,)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    ),

                    //Menu Popup
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child:  AnimatedBuilder(
                        animation: popupAnimationCtrl,
                        builder: (context, _) {
                          return Transform.scale(
                            origin: Offset(-80, 28),
                            scaleX: popupAnimation.value,
                            scaleY: popupAnimation.value,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 255, 252, 235),
                                    borderRadius: BorderRadius.circular(18)
                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            size: 14,
                                            color: grayColor,
                                            FontAwesomeIcons.shieldHeart
                                          ),
                                          const SizedBox(width: 8),
                                          Text('Copy areas',
                                            style: TextStyle(color: grayColor, fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Icon(
                                            size: 14,
                                            color: grayColor,
                                            Icons.wallet_outlined
                                          ),
                                          const SizedBox(width: 8),
                                          Text('Price',
                                            style: TextStyle(color: grayColor, fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Icon(
                                            size: 14,
                                            color: grayColor,
                                            FontAwesomeIcons.buildingColumns
                                          ),
                                          const SizedBox(width: 8),
                                          Text('Infrastructure',
                                            style: TextStyle(color: grayColor, fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      InkWell(
                                        onTap: (){
                                          if(layerAnimationCtrl.isForwardOrCompleted) {
                                            print('reversing layer animation');
                                            layerAnimationCtrl.reverse();
                                          }
                                          else {
                                            print('strating layer animation');
                                            layerAnimationCtrl.forward();
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              size: 14,
                                              color: grayColor,
                                              FontAwesomeIcons.layerGroup
                                            ),
                                            const SizedBox(width: 8),
                                            Text('Without any layer',
                                              style: TextStyle(color: grayColor, fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                                const SizedBox(height: 4),
                                const SizedBox(height: 50)
                              ],
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                ),
                
                AnimatedBuilder(
                  animation: growAnimationCtrl1,
                  builder: (context, _) {
                    return Transform.scale(
                      scale: growAnimation1.value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: grayColor.withAlpha(150),
                          borderRadius: BorderRadius.circular(32)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        child: Row(
                          children: [
                            Icon(Icons.menu, color: whiteColor),
                            const SizedBox(width: 4),
                            Text("list of variants", style: TextStyle(color: whiteColor))
                          ],
                        ),
                      ),
                    );
                  }
                )
              ],
            ),
          ),

          

          BottomNavigation(
            value: 1, 
            activeIndex: 0,
            onClick: (index) {
              if(index == 2){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => HomePage(),
                    transitionDuration: Duration(milliseconds: 800),
                    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
