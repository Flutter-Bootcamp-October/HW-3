import 'package:bloc_homework_tues_week_7/screens/convert_screen.dart';
import 'package:bloc_homework_tues_week_7/screens/home_screen.dart';
import 'package:flutter/material.dart';

class NavBarController extends StatefulWidget {
  const NavBarController({super.key});

  @override
  State<NavBarController> createState() => _NavBarControllerState();
}

class _NavBarControllerState extends State<NavBarController> {
  List<Widget> screens = [
    HomeScreen(),
    ConvertScreen(),
  ];
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[100],
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange),
            label: '',
          ),
        ],
      ),
      body: screens[index],
    );
  }
}
