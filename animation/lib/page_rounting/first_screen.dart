import 'dart:async';

import 'package:animation/page_rounting/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with SingleTickerProviderStateMixin {
  late Animation<double> scaleAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    scaleAnimation = Tween(begin: 1.0,end: 10.0).animate(controller);

    controller.addListener(() {
      if(scaleAnimation.isCompleted){
       Navigator.of(context).push(
         PageRouteBuilder(
             pageBuilder:(context,animation,seconderyAnimation){
               return SecondScreen();
             },
         transitionsBuilder: (context,animation,seconderyAnimation,child){
               final tween = Tween(begin: Offset(0,-1),end: Offset(0,0)).animate(animation);

              return SlideTransition(
                position:tween,
                child: child,
              );
         }
         ),
       );
        Timer(Duration(milliseconds: 500), () { controller.reset(); });

      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            controller.forward();

          },
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              width: 100,
              height: 100,
              decoration:BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green
              ) ,
            ),
          ),
        ),
      ),
    );
  }
}
