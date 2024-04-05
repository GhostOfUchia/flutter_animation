import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    animation = Tween(begin: 0.0,end: 1.0).animate(controller);
    controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reverse();
      } else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             AnimatedBuilder(
               animation: animation,
               builder: (BuildContext context, Widget? child) {
                 return CustomPaint(
                   size: Size(200,400),
                   painter: BouncingBall(animation.value),
                 );
               },

             )
          ],
        ),

      ),
    );
  }
}

class BouncingBall extends CustomPainter{
  double value;
  BouncingBall( this.value);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(size.width-(size.width*value), size.height-(size.height*value)),
        30,
        Paint()..color = Colors.brown
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
