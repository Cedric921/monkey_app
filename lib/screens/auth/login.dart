
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static String routeName = "login";
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double longSpace = 30;
  double  shortSpace = 10;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(),
            child: Column(children: [
              title(),
              subtitle("Beneficiez de nos services"),
              SizedBox(height: longSpace,)
            ]),
          ),
        ),
      ),
    );
  }

  Widget title() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        "Login",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget subtitle(String subtitle) {
    return  Padding(
      padding:  const EdgeInsets.only(bottom: 15),
      child: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.black54
        ),
      ),
    );
  }

  Widget textField(){
    return const Padding(
      padding: EdgeInsets.only(bottom: 10)
    );
  }
}
