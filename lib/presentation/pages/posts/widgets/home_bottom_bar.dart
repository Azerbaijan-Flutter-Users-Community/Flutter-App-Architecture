import 'package:flutter/material.dart';

class HomeBottomBar extends StatefulWidget {
  @override
  _HomeBottomBarState createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          label: 'Posts',
          icon: Icon(Icons.list_alt),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.account_circle_rounded),
        ),
      ],
    );
  }
}
