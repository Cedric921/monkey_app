import 'package:flutter/material.dart';

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
            children:  [stackElement()],
          ),
        ),
      ),
    );
  }

  Widget stackElement() {
    return SizedBox(
      height: MediaQuery.of(context).size.height /2 - 50,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2 - 50,
            width: MediaQuery.of(context).size.width,
            decoration: const  BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              ),
              boxShadow: <BoxShadow>[

              ],
              image: DecorationImage(
                image: AssetImage('assets/images/meal.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2 - 50,
            width: MediaQuery.of(context).size.width,
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
              ),
              color: Theme.of(context).primaryColor.withOpacity(.3)
            ),
          ),
          Positioned(

            child: icon()
          ),
        ],
      ),
    );
  }


  Widget icon() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 25),
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                'assets/images/monkey.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
