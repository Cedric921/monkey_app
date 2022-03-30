import 'package:flutter/material.dart';
import 'package:ecommerce/screens/auth/login.dart';
import 'package:ecommerce/screens/auth/signup.dart';

class StartPage extends StatefulWidget {
  static String routeName = '/start_page';
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: stackElement(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  children: [
                    appName(),
                    slogant(),
                    message(),
                    custormButtom(
                        color: Theme.of(context).primaryColor,
                        colorText: Colors.white,
                        title: "Login",
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Login.routeName);
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    custormButtom(
                        color: Colors.white,
                        colorText: Theme.of(context).primaryColor,
                        title: "Créer un compte",
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Signup.routeName);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  stackElement() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.3 - 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    offset: const Offset(0, 5),
                    blurRadius: 5),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/images/meal.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.3 - 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    offset: const Offset(0, 5),
                    blurRadius: 5),
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Theme.of(context).primaryColor.withOpacity(
                    .3,
                  ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.3 - 125,
            left: MediaQuery.of(context).size.width / 2 - 82.5,
            child: icon(),
          ),
        ],
      ),
    );
  }

  Widget icon() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              offset: const Offset(0, -5),
              blurRadius: 15,
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.all(25),
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                'assets/icons/monkey.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
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
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

//here is our slogant

  Widget slogant() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "Débutez votre journée avec Meal monkey",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
    );
  }

//here is our slogant

  Widget message() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Text(
        "Pour beneficier du max de potentient que Meal monkey vous offre, veillez vous connecter",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  custormButtom({
    Color? color,
    String? title,
    Color? colorText,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(
          15,
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(.15),
                offset: const Offset(0, 5),
                blurRadius: 5),
          ],
          borderRadius: BorderRadius.circular(100),
          color: color,
        ),
        child: Text(
          "$title",
          style: TextStyle(
            color: colorText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
