import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static String routeName = "/home_app";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectMenu = "Home";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: [
                    customAppBar(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 5,
                          width: 80,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              "Current location",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(Icons.arrow_drop_down_sharp),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(children: const [
                        Icon(Icons.search),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Seach your meal",
                            style: TextStyle(),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget bottomNavigation() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 75),
          padding:
              const EdgeInsets.only(top: 30, left: 15, bottom: 15, right: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(.15),
                offset: const Offset(-1, -5),
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              modelIcon(
                icon: Icons.grid_view,
                menu: "Produits",
              ),
              modelIcon(
                icon: Icons.favorite,
                menu: "Favorie",
              ),
              const SizedBox(
                width: 100,
              ),
              modelIcon(
                icon: Icons.shopping_cart_rounded,
                menu: "Panier",
              ),
              modelIcon(
                icon: Icons.person,
                menu: "Profil",
              ),
            ],
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 50,
          top: 20,
          child: customHomeButton(),
        ),
      ],
    );
  }

  customHomeButton() {
    return InkWell(
      onTap: () {
        setState(() {
          selectMenu = "Home";
        });
      },
      borderRadius: BorderRadius.circular(80),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: BoxShape.circle,
        ),
        child: AnimatedContainer(
          duration: const Duration(
            seconds: 1,
          ),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 8,
            ),
            color: selectMenu == "Home"
                ? Theme.of(context).primaryColor
                : Colors.grey.withOpacity(.5),
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(
                  .5,
                ),
                offset: const Offset(1, 5),
                blurRadius: 5,
              ),
              BoxShadow(
                color: Colors.grey.withOpacity(.15),
                offset: const Offset(-1, -5),
                blurRadius: 5,
              ),
            ],
          ),
          child: const Icon(
            Icons.home,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  modelIcon({
    IconData? icon,
    String? menu,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectMenu = menu!;
        });
      },
      borderRadius: BorderRadius.circular(30),
      child: Column(
        children: [
          Icon(
            icon,
            color: menu == selectMenu
                ? Theme.of(context).primaryColor
                : Colors.grey.withOpacity(.5),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "$menu",
              style: TextStyle(
                color: menu == selectMenu
                    ? Theme.of(context).primaryColor
                    : Colors.grey.withOpacity(.5),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  customAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: Text(
                  "Good morning Daniel!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Icon(
                Icons.shopping_cart_rounded,
              )
            ],
          ),
        ],
      ),
    );
  }
}
