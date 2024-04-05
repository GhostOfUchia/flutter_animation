import 'dart:math';

import 'package:flutter/material.dart';

class AnimationColorPallet extends StatefulWidget {
  const AnimationColorPallet({super.key});

  @override
  State<AnimationColorPallet> createState() => _AnimationColorPalletState();
}

class _AnimationColorPalletState extends State<AnimationColorPallet> {
  List<Color> colorList = genrateRandomColor();

  static List<Color> genrateRandomColor() {
    print("button clicked");
    var random = Random();
    return List.generate(5, (index) => Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
    ));
  }

  void regenrateColorlist(){
    setState(() {
       colorList = genrateRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(Color color in colorList)
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: 100,
                height: 100,
                color: color,
                margin: EdgeInsets.all(8.0),
              ),
            ElevatedButton(onPressed:regenrateColorlist, child: Text("Button"))
          ],
        ),
      ),
    );
  }


}


