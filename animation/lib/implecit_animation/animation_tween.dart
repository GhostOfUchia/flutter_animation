import 'package:flutter/material.dart';

class TweenAnimationWidget extends StatefulWidget {
  const TweenAnimationWidget({super.key});

  @override
  State<TweenAnimationWidget> createState() => _TweenAnimationWidgetState();
}

class _TweenAnimationWidgetState extends State<TweenAnimationWidget> with
    SingleTickerProviderStateMixin{
  late Animation animation;
  late Animation colorAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds:2));
    // this is refer to SingleTickerProviderMixin

    animation = Tween(begin: 0.0,end: 300.0).animate(animationController);
    // create animation Class

    colorAnimation = ColorTween(begin: Colors.deepOrange,end: Colors.orange).animate(animationController);
    // create colorAnimation Class
    animationController.addListener(() {
      setState(() {

      });
    }); // its listen all value changes

    animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){ animationController.forward();}
      else if(status == AnimationStatus.dismissed){animationController.reverse();}
      // run animation forward and backward
    });

    animationController.forward(); // it can run the animation on forword

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TweenAnimation"),),
      body: Center(
        child: Container(
          height: animation.value,
          width: animation.value,
          color:colorAnimation.value,
        ),
      ),
    );
  }
}
