import 'package:flutter/material.dart';

import 'start_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  bool hasStarted = false;
  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        hasStarted = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            backGround(),
            Center(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                      width: 150,
                    ),
                    appName(),
                    slogant(),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
                duration: const Duration(seconds: 3),
                onEnd: () {
                  Navigator.pushReplacementNamed(context, StartPage.routeName);
                },
                curve: Curves.bounceInOut,
                top: hasStarted
                    ? MediaQuery.of(context).size.height / 2 - 150
                    : -200,
                left: MediaQuery.of(context).size.width / 2 - 75,
                child: icon()),
          ],
        ),
      ),
    );
  }
//here is our bg

  Widget backGround() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/meal.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.7),
        ),
      ),
    );
  }

//here is our slogant

  Widget slogant() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "Débutez votre journée en consomant un produit de Meal monkey",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
    );
  }

//here is our app name
  Widget appName() {
    return Text.rich(
      TextSpan(
        text: "Meal ",
        style: TextStyle(
          fontSize: 24,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
        children: const <TextSpan>[
          TextSpan(
            text: "Monkey",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

// here we create our splash's image
  Widget icon() {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            'assets/icons/icon.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}