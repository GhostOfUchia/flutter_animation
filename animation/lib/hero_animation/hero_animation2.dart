
import 'package:flutter/material.dart';

import 'hero_animation1.dart';
class HeroAnimationSecond extends StatelessWidget {
  const HeroAnimationSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.pop(context,()=>HeroAnimationFirst());
        },
        child: Hero(
          tag: 'img',
          child: Image.asset("assets/images/login_screen.png"),
        ),
      ),
    );
  }
}
