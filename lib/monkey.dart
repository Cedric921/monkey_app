import 'package:flutter/material.dart';
import 'package:ecommerce/screens/app/home/home.dart';
import 'package:ecommerce/screens/auth/login.dart';
import 'package:ecommerce/screens/auth/signup.dart';
import 'package:ecommerce/screens/start/splash_screen.dart';
import 'package:ecommerce/screens/start/start_page.dart';
import 'package:ecommerce/screens/start/anounce_page.dart';

class Monkey extends StatelessWidget {
  const Monkey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF008AF0),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      debugShowCheckedModeBanner: false,
      home: const AnouncePage(),
      routes: {
        StartPage.routeName: (context) => const StartPage(),
        Login.routeName: (context) => const Login(),
        Signup.routeName: (context) => const Signup(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        Home.routeName: (context) => const Home(),
      },
    );
  }
}