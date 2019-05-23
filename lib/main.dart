import 'package:flutter/material.dart';
import 'ui/home_screen.dart';

void main() => runApp(new MainScreen());

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "BMI Calculator",
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("BMI"),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent.shade400,
        ),
        body: new HomeScreen(),
      ),
    );
  }
}
