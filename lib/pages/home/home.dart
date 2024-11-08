// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:real_estate_demo/base/colors.dart';
import 'package:real_estate_demo/pages/home/widgets/bottom_navigation.dart';
import 'package:real_estate_demo/pages/home/widgets/greetings.dart';
import 'package:real_estate_demo/pages/home/widgets/header.dart';
import 'package:real_estate_demo/pages/home/widgets/houses.dart';
import 'package:real_estate_demo/pages/home/widgets/offer_widgets.dart';
import 'package:real_estate_demo/pages/search/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with TickerProviderStateMixin{
  late Animation 
    sliderAnimation, 
    sliderOpacityAnimation, 
    headerAnimation, 
    headerAnimationOpacity, 
    titleAnimation, 
    offerAnimation, 
    navAnimation, 
    housesAnimation; 
  late AnimationController 
    sliderAnimationCtrl, 
    sliderOpacityAnimationCtrl, 
    headerAnimationCtrl, 
    headerAnimationOpacityCtrl, 
    titleAnimationCtrl, 
    offerAnimationCtrl, 
    housesAnimationCtrl, 
    navAnimationCtrl; 
  int headerAnimationDuration = 800; 

  @override
  void initState() {
    sliderAnimationCtrl = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: headerAnimationDuration),
    );
    sliderAnimation = Tween<double>(begin: 1, end: 0)
      .animate(sliderAnimationCtrl);
    
    sliderOpacityAnimationCtrl = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: headerAnimationDuration),
    );
    sliderOpacityAnimation = Tween<double>(begin: 0, end: 1)
      .animate(sliderOpacityAnimationCtrl);

    headerAnimationCtrl = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: (headerAnimationDuration).ceil()),
    );
    headerAnimation = Tween<double>(begin: 0, end: 1)
      .animate(headerAnimationCtrl);
    
    headerAnimationOpacityCtrl = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: (headerAnimationDuration).ceil()),
    );
    headerAnimationOpacity = Tween<double>(begin: 0, end: 1)
      .animate(headerAnimationOpacityCtrl);

    titleAnimationCtrl = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: (headerAnimationDuration).ceil()),
    );
    titleAnimation = Tween<double>(begin: 0, end: 1)
      .animate(titleAnimationCtrl);

    offerAnimationCtrl = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: (headerAnimationDuration).ceil()),
    );
    offerAnimation = Tween<double>(begin: 0, end: 1)
      .animate(offerAnimationCtrl);

    housesAnimationCtrl = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: (headerAnimationDuration).ceil()),
    );
    housesAnimation = Tween<double>(begin: 0, end: 1)
      .animate(housesAnimationCtrl);

    navAnimationCtrl = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: (headerAnimationDuration/3).ceil()),
    );
    navAnimation = Tween<double>(begin: 0, end: 1)
      .animate(navAnimationCtrl);

    startAnimation();
    super.initState();
  }

  Future<void> startAnimation() async {
    await headerAnimationCtrl.forward();
    await headerAnimationOpacityCtrl.forward();
    await titleAnimationCtrl.forward();
    offerAnimationCtrl.forward();
    await Future.delayed(Duration(milliseconds: (headerAnimationDuration/1.5).ceil()));
    await housesAnimationCtrl.forward();
    await sliderAnimationCtrl.forward();
    await sliderOpacityAnimationCtrl.forward();
    await navAnimationCtrl.forward();
  }
  @override
  void dispose() {
    sliderAnimationCtrl.dispose();
    sliderOpacityAnimationCtrl.dispose();
    headerAnimationCtrl.dispose();
    headerAnimationOpacityCtrl.dispose();
    titleAnimationCtrl.dispose();
    offerAnimationCtrl.dispose();
    housesAnimationCtrl.dispose();
    navAnimationCtrl.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double componentHeight = width/2.2;

    return Scaffold(
      body: Container(
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(130, 255, 248, 237), primaryColor],
            stops: [0.2, 1],
            begin: Alignment(-2, -1),
            end: Alignment(1, 2),
          )
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
            
                      AnimatedBuilder(
                        animation: headerAnimationCtrl, 
                        builder: (context, snapshot) {
                          return AnimatedBuilder(
                            animation: headerAnimationOpacityCtrl, 
                            builder: (context, _) {
                              return Header(
                                value: headerAnimation.value, 
                                opacity: headerAnimationOpacity.value
                              );
                            }
                          );
                        }
                      ),
                      const SizedBox(height: 32),
                  
                      AnimatedBuilder(
                        animation: titleAnimationCtrl, 
                        builder: (context, snapshot) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Greetings(value: titleAnimation.value),
                            ],
                          );
                        }
                      ),
                      const SizedBox(height: 32),
                  
                      AnimatedBuilder(
                        animation: offerAnimationCtrl,
                        builder: (context, snapshot) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleOffer(
                                value: offerAnimation.value,
                                componentHeight: componentHeight
                              ),
                              SquareOffer(
                                value: offerAnimation.value,
                                componentHeight: componentHeight
                              ),
                            ],
                          );
                        }
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
        
            //Houses Panel
            AnimatedBuilder(
              animation: housesAnimationCtrl,
              builder: (context, snapshot) {
                return HousesWidget(
                  width: width, 
                  value: housesAnimation.value,
                  sliderAnimationCtrl: sliderAnimationCtrl, 
                  sliderAnimation: sliderAnimation, 
                  opacityAnimationCtrl: sliderOpacityAnimationCtrl, 
                  opacityAnimation: sliderOpacityAnimation, 
                  componentHeight: componentHeight, 
                );
              }
            ),
        
            
            
            AnimatedBuilder(
              animation: navAnimationCtrl,
              builder: (context, snapshot) {
                return BottomNavigation(
                  value: navAnimation.value, 
                  activeIndex: 2,
                  onClick: (index){
                    if(index == 0){
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => SearchPage(),
                          transitionDuration: Duration(milliseconds: 800),
                          transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                        ),
                      );
                            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                      //   return SearchPage();
                      // }));
                    }
                  }
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}


