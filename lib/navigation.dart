// import 'package:e_softwarica/screens/about_Page.dart';
// import 'package:e_softwarica/screens/add_student.dart';
// import 'package:e_softwarica/screens/button.dart';
// import 'package:e_softwarica/screens/home_screen.dart';
// import 'package:e_softwarica/screens/HomeScreen.dart';
// import 'package:e_softwarica/screens/home_screen.dart';
// import 'package:e_softwarica/widgets/home/HomeBody.dart';

import 'package:batch28_api_starter/screen/HomeScreen.dart';
import 'package:batch28_api_starter/widgets/home/HomeBody.dart';
import 'package:flutter/material.dart';

class ButtomNavigation extends StatefulWidget {
  const ButtomNavigation({required Key key}) : super(key: key);

  @override
  ButtomNavigationState createState() => ButtomNavigationState();
}

class ButtomNavigationState extends State<ButtomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    HomeBody(),
    // Home(),
    // AddStudent(),
    // AddStudentt(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 81, 56, 194),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_sharp),
            label: 'Add Student',
            backgroundColor: Color.fromARGB(255, 47, 39, 200),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Gallery',
            backgroundColor: Color.fromARGB(255, 68, 43, 229),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 58, 37, 245),
        onTap: _onItemTapped,
      ),
    );
  }
}
