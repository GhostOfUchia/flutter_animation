import 'dart:ffi';

import 'package:flutter/material.dart';
class AnimationLoginScreen extends StatefulWidget {
  const AnimationLoginScreen({super.key});

  @override
  State<AnimationLoginScreen> createState() => _AnimationLoginScreenState();
}

class _AnimationLoginScreenState extends State<AnimationLoginScreen> with SingleTickerProviderStateMixin {

  late Animation<double> logoFadeAnimation;
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double>  scaleAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration:Duration(milliseconds: 2000));
    logoFadeAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);
    slideAnimation = Tween(begin: Offset(-1,-1),end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve:Curves.ease));

    scaleAnimation = Tween(begin: 0.0,end: 1.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeTransition(
              opacity: logoFadeAnimation,
              child: FlutterLogo(size: 100,)),
          SlideTransition(
            position: slideAnimation,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ScaleTransition(
                scale: scaleAnimation,
                   child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        label: Text('Email'),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          label: Text('Password')
                      ),
                    ),
                    ElevatedButton(onPressed:(){},
                        child:Text("Login"))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
