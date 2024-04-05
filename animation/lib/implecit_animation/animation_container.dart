import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animated_Container extends StatefulWidget {
  const Animated_Container({super.key});

  @override
  State<Animated_Container> createState() => _Animated_ContainerState();
}

class _Animated_ContainerState extends State<Animated_Container> {
  var _width = 200.0;
  var _margin = 15.0;
  var _opacity = 1.0;
  Color color = Colors.orange;
  var _height = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        width: _width,
        color: color,
        margin: EdgeInsets.all(_margin),
        duration: Duration(seconds: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _height,
            ),
            CupertinoButton(
              child: Text("Animate Margin"),
              onPressed: () {
                setState(() {
                  if (_margin == 15) {
                    _margin = 100;
                  } else
                    _margin = 15;
                });
              },
              color: Colors.deepOrange,
            ),
            SizedBox(
              height: _height,
            ),
            CupertinoButton(
              child: Text("Animate Color"),
              onPressed: () {
                setState(() {
                  color = Colors.green;
                });
              },
              color: Colors.black,
            ),
            SizedBox(
              height: _height,
            ),
            CupertinoButton(
              child: Text("Animate Size"),
              onPressed: () {
                setState(() {
                  _width = 400;
                });
              },
              color: Colors.deepPurple,
            ),
            SizedBox(
              height: _height,
            ),
            AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: _opacity,
              child: Container(
                width: 30,
                height: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CupertinoButton(
                child: Text("Animate Opacity"),
                onPressed: () {
                  setState(() {
                    _opacity = 0;
                  });
                })
          ],
        ),
      ),
    );
  }
}
