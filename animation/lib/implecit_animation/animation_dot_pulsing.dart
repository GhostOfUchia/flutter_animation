import 'package:flutter/material.dart';

class AnimationPulsing extends StatefulWidget {
  const AnimationPulsing({super.key});

  @override
  State<AnimationPulsing> createState() => _AnimationPulsingState();
}

class _AnimationPulsingState extends State<AnimationPulsing> {
  double size = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0,end: 200.0),
          duration:Duration(milliseconds: 2000) ,
          builder: (BuildContext context, size, Widget? child) {
            return Container(
              width: size,
              height:size,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: size/2,
                        blurRadius: size
                    )
                  ]
              ),
            );
          },

        ),
      ),
    );
  }
}
