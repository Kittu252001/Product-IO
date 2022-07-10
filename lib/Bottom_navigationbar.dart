import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:product_io_assignment/Account.dart';
import 'package:product_io_assignment/Home.dart';
import 'package:product_io_assignment/cart.dart';
// import 'package:product_io_assignment/cart.dart';
import 'package:product_io_assignment/list.dart';
import 'package:product_io_assignment/search.dart';

class Bottompage extends StatefulWidget {
  @override
  _BottompageState createState() => _BottompageState();
}

class _BottompageState extends State<Bottompage> {
  int currentIndex = 0;
  final screens = [
    MyHomePage(
      title: '',
    ),
    search(),
    List(),
    profilepage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        backgroundColor: Colors.white70,
        selectedIndex: currentIndex,
        items: [
          BottomNavyBarItem(
            icon: Icon(
              Icons.home,
            ),
            activeColor: Colors.indigo,
            inactiveColor: Colors.grey,
            title: Text('Home'),
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.search,
            ),
            activeColor: Colors.indigo,
            inactiveColor: Colors.grey,
            title: Text('Search'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            activeColor: Colors.indigo,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            title: Text('Account'),
            activeColor: Colors.indigo,
            inactiveColor: Colors.grey,
          ),
        ],
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
