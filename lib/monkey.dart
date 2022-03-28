import 'package:flutter/material.dart';
import 'screens/start/splash_scrren.dart';

class Monkey extends StatelessWidget {
  const Monkey({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF008AF0),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5)
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}