import 'package:ecommerce/screens/start/start_page.dart';
import 'package:flutter/material.dart';
import 'screens/start/splash_scrren.dart';

class Monkey extends StatelessWidget {
  const Monkey({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF008AF0),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF)
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        StartPage.routeName :(context) =>  const StartPage(),
      },
    );
  }
}