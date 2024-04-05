import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Second Screen"),
        centerTitle:  true,
        foregroundColor:Colors.white ,
      ),
      body: Center(
        child: Text("Second screen"),
      ),
    );
  }
}
