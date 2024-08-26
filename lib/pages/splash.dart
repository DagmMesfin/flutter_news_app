import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF3A54E1), // The blue background color
        child: Center(child: Image(image: AssetImage("assets/main_logo.png"))),
      ),
    );
  }
}
