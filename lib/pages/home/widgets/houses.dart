import 'package:flutter/material.dart';
import 'package:real_estate_demo/base/colors.dart';
import 'package:real_estate_demo/pages/home/widgets/sliding_button.dart';

class HousesWidget extends StatelessWidget {
  const HousesWidget({
    super.key,
    required this.width,
    required this.sliderAnimationCtrl,
    required this.sliderAnimation,
    required this.opacityAnimationCtrl,
    required this.opacityAnimation,
    required this.componentHeight, 
    required this.value,
  });

  final double width;
  final double value;
  final AnimationController sliderAnimationCtrl;
  final Animation sliderAnimation;
  final AnimationController opacityAnimationCtrl;
  final Animation opacityAnimation;
  final double componentHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Transform.translate(
        offset: Offset(0, (MediaQuery.of(context).size.height)*(1 - value)),
        child: Container(
          color: whiteColor,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18)
                    ),
                    width: width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset( 
                        'assets/images/house0.png',
                        fit: BoxFit.fill,
                        
                      ),
                    ),
                  ),

                  AnimatedBuilder(
                    animation: sliderAnimationCtrl,
                    builder: (context, snapshot) {
                      return AnimatedBuilder(
                        animation: opacityAnimationCtrl,
                        builder: (context, snapshot) {
                          return SlidingButton(
                            title: 'Gladkova St, 25',
                            textAligment: CrossAxisAlignment.center,  
                            padding: const EdgeInsets.all(16),
                            value: sliderAnimation.value,
                            opacity: opacityAnimation.value,
                          );
                        }
                      );
                    }
                  )
                ],
              ),
              
              Container(
                padding: const EdgeInsets.all(6),
                color: whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          SizedBox(
                            height: (componentHeight*2)+10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.asset( 
                                'assets/images/house1.png',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          AnimatedBuilder(
                            animation: sliderAnimationCtrl,
                            builder: (context, snapshot) {
                              return AnimatedBuilder(
                                animation: opacityAnimationCtrl,
                                builder: (context, snapshot) {
                                  return SlidingButton(
                                    title: 'Guniba St., 25',
                                    textAligment: CrossAxisAlignment.start,
                                    padding: const EdgeInsets.all(8),
                                    value: sliderAnimation.value,
                                    opacity: opacityAnimation.value,
                                  );
                                }
                              );
                            }
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18)
                                ),
                                width: componentHeight,
                                height: componentHeight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.asset( 
                                    'assets/images/house2.png',
                                    fit: BoxFit.fill,
                                    
                                  ),
                                ),
                              ),
                              AnimatedBuilder(
                                animation: sliderAnimationCtrl,
                                builder: (context, snapshot) {
                                  return AnimatedBuilder(
                                    animation: opacityAnimationCtrl,
                                    builder: (context, snapshot) {
                                      return SlidingButton(
                                        title: 'Trefeleva St., 25',
                                        textAligment: CrossAxisAlignment.start,
                                        padding: const EdgeInsets.all(8),
                                        value: sliderAnimation.value,
                                        opacity: opacityAnimation.value,
                                      );
                                    }
                                  );
                                }
                              )
                              
                            ],
                          ),
                          const SizedBox(height: 10),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18)
                                ),
                                width: componentHeight,
                                height: componentHeight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.asset( 
                                    'assets/images/house3.png',
                                    fit: BoxFit.fill,
                                    
                                  ),
                                ),
                              ),
                    
                              AnimatedBuilder(
                                animation: sliderAnimationCtrl,
                                builder: (context, snapshot) {
                                  return AnimatedBuilder(
                                    animation: opacityAnimationCtrl,
                                    builder: (context, snapshot) {
                                      return SlidingButton(
                                        title: 'Sediva St., 17',
                                        textAligment: CrossAxisAlignment.start,
                                        padding: const EdgeInsets.all(8),
                                        value: sliderAnimation.value,
                                        opacity: opacityAnimation.value,
                                      );
                                    }
                                  );
                                }
                              )
                            ],
                          ),
                        ],
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