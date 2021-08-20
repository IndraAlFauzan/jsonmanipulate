import 'package:flutter/material.dart';
import 'package:test2/ui/alldata.dart';
import 'package:test2/ui/brown.dart';
import 'package:test2/ui/furniture_page.dart';
import 'package:test2/ui/home.dart';

import '../constant.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  final screen = [
    const Home(),
    const AllDataPage(),
    const Furniture(),
    const Brow(),
    const Furniture(),
    const Center(
      child: Text('data'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40.0,
        backgroundColor: Colors.white,
        selectedFontSize: 20,
        unselectedFontSize: 17,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black26,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        elevation: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.electric_bike),
            label: 'electronic',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_saver_off),
            label: 'All data',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.fullscreen_exit), label: 'Furniture'),
          BottomNavigationBarItem(
            icon: Icon(Icons.electric_bike),
            label: 'Brown',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_saver_off),
            label: 'Data 1',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Data 2'),
        ],
      ),
    );
  }
}
