import 'package:flutter/material.dart';

class AnimationList extends StatefulWidget {
  const AnimationList({super.key});

  @override
  State<AnimationList> createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slidableAnimation;
  late List<Animation<Offset>> animationList;

  final itemCount = 5;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 3000));
    slidableAnimation = Tween(begin: Offset(-1,0),end: Offset.zero).animate(controller);
    animationList = List.generate(itemCount,
            (index) =>Tween(begin: Offset(-1,0),end: Offset.zero )
                .animate(CurvedAnimation(
        parent: controller,
        curve:Interval(index*(1/itemCount), 1)) ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed: () {
          if(controller.isCompleted){controller.reverse();}
          else{controller.forward();}
          },
        child: Text("Start"),
      ) ,
      body: ListView.builder(
        itemCount: 5,
          itemBuilder:(context,int index){
            return SlideTransition(
              position:animationList[index],
              child: ListTile(
                leading: CircleAvatar(child: Text("${index+1}"),),
                title: Text("Line No"),
              ),
            );
          }),
    );
  }
}
