import 'package:flutter/material.dart';

import 'start_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool hasStared = false;
  @override
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }

  init() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        hasStared = true;
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
                Navigator.pushNamed(context, StartPage.routeName);
              },
              curve: Curves.bounceInOut,
              top: hasStared
                  ? MediaQuery.of(context).size.height / 2 - 150
                  : -200,
              left: MediaQuery.of(context).size.width / 2 - 75,
              child: icon(),
            ),
          ],
        ),
      ),
    );
  }

  Widget backGround() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/meal.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black.withOpacity(.7),
      ),
    );
  }

  Widget slogant() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "Debutez votre journnée en consommation un produit de Meal Monkey",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // here is ours app name
  appName() {
    return Text.rich(
      TextSpan(
        text: "Meal",
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

// here we create ours slpash images
  Widget icon() {
    return Container(
      margin: const EdgeInsets.only(bottom: 35),
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/monkey.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
