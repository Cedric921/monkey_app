import 'package:flutter/material.dart';
import 'screens/start/splash_scrren.dart';

class Monkey extends StatelessWidget {
  const Monkey({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}