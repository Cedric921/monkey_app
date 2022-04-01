
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:ecommerce/screens/app/home/home.dart';
import 'package:ecommerce/screens/auth/signup.dart';

class Login extends StatefulWidget {
  static String routeName = "login";
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  TapGestureRecognizer? _forgotPassword, _signup;

  double longSpace = 30; // pour le grands espace
  double shortSpace = 10; // pour les distances courtes

  @override
  void initState() {
    _forgotPassword = TapGestureRecognizer()..onTap = () {};
    _signup = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pushNamed(context, Signup.routeName);
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      title(),
                      subtitle("Beneficiez de nos service"),
                      SizedBox(
                        height: longSpace,
                      ),
                      textField(
                        hint: "Username",
                      ),
                      SizedBox(
                        height: shortSpace,
                      ),
                      textField(
                        hint: "Password",
                      ),
                      SizedBox(
                        height: longSpace,
                      ),
                      custormButtom(
                          color: Theme.of(context).primaryColor,
                          title: "Login",
                          colorText: Colors.white,
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, Home.routeName);
                          }),
                      SizedBox(
                        height: shortSpace,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Forgot password?",
                          recognizer: _forgotPassword,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: longSpace,
                      ),
                      signupWith(),
                      SizedBox(
                        height: longSpace,
                      ),
                      custormButtom(
                        color: const Color(0xFF4267B2),
                        title: "Facebook",
                        colorText: Colors.white,
                        icon: Icons.facebook,
                      ),
                      SizedBox(
                        height: shortSpace,
                      ),
                      custormButtom(
                        color: Colors.red,
                        title: "Login with google",
                        colorText: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Text.rich(
                TextSpan(
                  text: "Don't you have an account? ",
                  recognizer: _forgotPassword,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Sign up",
                      recognizer: _signup,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  signupWith() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.5,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.5),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "or",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1.5,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget title() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        "Login",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget subtitle(String subtitle) {
    return Text(
      subtitle,
      style: const TextStyle(
        color: Colors.black54,
      ),
    );
  }

  Widget textField({
    String? hint,
    TextEditingController? controller,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFebebeb),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }

  custormButtom({
    Color? color,
    String? title,
    Color? colorText,
    IconData? icon,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Row(
                children: [
                  Icon(
                    icon,
                    color: colorText,
                  ),
                  SizedBox(
                    width: shortSpace,
                  ),
                ],
              ),
            Text(
              "$title",
              style: TextStyle(
                color: colorText,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
