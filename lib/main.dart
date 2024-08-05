import 'package:coffee_master/datamanager.dart';
import 'package:coffee_master/pages/menupage.dart';
import 'package:coffee_master/pages/offerspage.dart';
import 'package:coffee_master/pages/orderspage.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(const MyApp());
}

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("I am learning $name for the first time."),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) => setState(() {
              name = value;
            }),
          ),
        ),
      ],
    );
  }
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("this is a text widget");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Masters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dataManager = Datamanager();
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentWidget =
        const Text("This is a text widget with greetingsbbbb,,,,,,,,");
    switch (selectedIndex) {
      case 0:
        currentWidget = Menupage(
          datamanager: dataManager,
        );
        break;
      case 1:
        currentWidget = const Offerspage();
        break;
      case 2:
        currentWidget = OrderPage(
          datamanager: dataManager,
        );
        break;
      default:
        currentWidget = const Text("This is a texts selected");
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(child: Image.asset("images/logo.png")),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) => setState(() {
            selectedIndex = value;
          }),
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.yellow.shade400,
          unselectedItemColor: Colors.yellow.shade50,
          items: [
            const BottomNavigationBarItem(
                label: "Menu", icon: Icon(Icons.coffee)),
            const BottomNavigationBarItem(
                label: "Offers", icon: Icon(Icons.local_offer)),
            BottomNavigationBarItem(
              label: "Orders",
              icon: badges.Badge(
                  badgeContent: Text(
                    '${dataManager.cart.length}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  badgeStyle: const badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colors.blue,
                    elevation: 0,
                  ),
                  badgeAnimation: const badges.BadgeAnimation.rotation(
                    animationDuration: Duration(seconds: 1),
                    colorChangeAnimationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                    colorChangeAnimationCurve: Curves.easeInCubic,
                  ),
                  child: const Icon(Icons.shopping_cart)),
            )
          ],
        ),
        body: currentWidget);
  }
}
