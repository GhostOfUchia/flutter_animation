import 'package:flutter/material.dart';

class RadialProgressIndicaterAnimation extends StatefulWidget {
  final double progress;
  final Color color;

  const RadialProgressIndicaterAnimation(
      {super.key, required this.progress, required this.color});

  @override
  State<RadialProgressIndicaterAnimation> createState() =>
      _RadialProgressIndicaterAnimationState();
}

class _RadialProgressIndicaterAnimationState
    extends State<RadialProgressIndicaterAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    animation = Tween(begin: 0.0, end: widget.progress).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () { controller.forward(); },
      child: Text("Start"),
      ),
      body: Center(
          child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: animation.value,
                  strokeWidth: 10.0,
                  backgroundColor: Colors.grey,
                  color: widget.color,
                ),
              ),
              Text(
                "${(animation.value * 100).toInt()}%",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              )
            ],
          );
        },
      )),
    );
  }
}
