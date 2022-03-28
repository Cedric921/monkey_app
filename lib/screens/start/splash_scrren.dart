import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool hasStarted = false;
  @override
  void initState() {
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
      body: Stack(children: [
        background(),
        Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              children: [appName(), slogan()],
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(seconds: 3),
          curve: Curves.bounceInOut,
          top: hasStarted ?
            MediaQuery.of(context).size.width / 2 - 150 : -200,
          left: MediaQuery.of(context).size.width / 2 - 75,
          child: icon(),
        )
      ]),
    ));
  }

  Widget background() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/meal.jpg'),
            fit: BoxFit.cover)
          ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.7)
        ),
      ),
    );
  }

  Widget slogan() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Debuter otre journne en consommant le Meal ",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white70),
      ),
    );
  }

  //here our app name
  Widget appName() {
    return Text.rich(TextSpan(
        text: "Meal",
        style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold),
        children: const <TextSpan>[
          TextSpan(
            text: "Monkey",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )
        ]));
  }
//here is our app name

//here we create our splash image
  Widget icon() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 180,
      width: 180,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(
                'assets/images/monkey.jpg',
              ),
              fit: BoxFit.cover)),
    );
  }
}
