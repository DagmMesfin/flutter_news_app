import 'package:flutter/material.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/pages/bookmark.dart';
import 'package:news_app/pages/discover.dart';
import 'package:news_app/pages/homepage.dart';
import 'package:news_app/pages/onboarding.dart';
import 'package:news_app/pages/profile_page.dart';
import 'package:news_app/pages/search.dart';
import 'package:news_app/pages/signin.dart';
import 'package:news_app/pages/signup.dart';
import 'package:news_app/pages/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}
