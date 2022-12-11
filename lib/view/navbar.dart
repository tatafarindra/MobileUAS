// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// // import 'package:google_fonts/google_fonts.dart';
// import 'package:ramene/view/homepage.dart';
// import 'package:ramene/view/account.dart';
// import 'package:ramene/view/about.dart';
// import 'package:ramene/view/signup.dart';
//
// class Navbar extends StatefulWidget {
//   String str = "";
//   Navbar({Key? key, required this.str}) : super(key: key);
//   @override
//   State<Navbar> createState() => _Navbar();
// }
//
// class _Navbar extends State<Navbar> {
//   int currentIndex = 0;
//
//   void onTabTapped(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> _children = [
//       Home(str: widget.str),
//       About(),
//       Account(),
//     ];
//     return Scaffold(
//       body: _children[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
//         unselectedItemColor: Colors.grey,
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         unselectedFontSize: 14,
//         selectedItemColor: Color.fromRGBO(0, 137, 56, 1),
//         type: BottomNavigationBarType.fixed,
//         onTap: onTabTapped,
//         items: const [
//           BottomNavigationBarItem(
//             //I want to navigate to a new page Library();
//             icon: Icon(
//               Icons.home,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             //I want to navigate to a new page Store();
//             icon: Icon(
//               Icons.read_more,
//             ),
//             label: 'About',
//           ),
//           BottomNavigationBarItem(
//             //I want to navigate to a new page Profile();
//             icon: Icon(
//               Icons.account_circle,
//             ),
//             label: 'Account',
//           ),
//         ],
//       ),
//     );
//   }
// }