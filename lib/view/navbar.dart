import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:uas/view/home_view.dart';
import 'package:uas/view/search.dart';
import 'package:uas/view/library.dart';
import 'package:uas/view/profile.dart';

class Navbar extends StatefulWidget {
  String str = "";
  Navbar({Key? key, required this.str}) : super(key: key);
  @override
  State<Navbar> createState() => _Navbar();
}

class _Navbar extends State<Navbar> {
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkMode) {
    setState(() {
      themeData = (isDarkMode) ? ThemeData.dark() : ThemeData.light();
    });
  }
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      Home(str: widget.str, setTheme:setTheme),
      search(),
      Library(),
      Profile()
    ];
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        unselectedItemColor: Colors.grey,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        unselectedFontSize: 14,
        selectedItemColor: Color.fromARGB(225,192,106,1),
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add),
            label: 'Playlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}