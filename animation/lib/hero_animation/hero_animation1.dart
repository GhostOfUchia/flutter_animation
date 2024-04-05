
import 'package:flutter/material.dart';
import 'hero_animation2.dart';
class HeroAnimationFirst extends StatelessWidget {
  const HeroAnimationFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>HeroAnimationSecond())
              );
            },
            child: Hero(
              tag: 'img',
              child: Image.asset(
                "assets/images/login_screen.png",width: 150,height: 150,),
            ),
          )
      ),

    );
  }
}
