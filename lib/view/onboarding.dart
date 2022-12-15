// import 'package:figma/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:uas/view/login.dart';
import 'package:uas/view/register.dart';
import 'package:uas/view/shared_preferences.dart';
// import 'package:figma/main.dart';

// Future<void> main() async {
//   runApp(const MyApp());
//   await SharedPref.init();
// }

class onboarding extends StatefulWidget {


//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkMode) {
    setState(() {
      themeData = (isDarkMode) ? ThemeData.dark() : ThemeData.light();
      SharedPref.pref?.setBool('isDarkMode', isDarkMode);
    });
  }


// class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var onPressed;
    return Scaffold(

      body: Column(
        children: [
          Container(
            // color: Colors.white,
            margin: const EdgeInsets.fromLTRB(20, 150, 20, 0),
            child: const Text(
              'OUR MUSIC',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 100, 20, 0),
            alignment: Alignment.center,

            // color: Colors.white,
            child: Image.asset(
              'lib/images/43117.jpg',
              height: 250,
              width: 500,
            ),
          ),
          // Container(
          //   // color: Colors.white,
          //
          //   child: Image.asset(
          //     'images/gambar3.png',
          //     height: 250,
          //     width: 500,
          //   ),
          // ),
          Container(
            // color: Colors.white,
            // width: 300,
            margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Text(
              'Music is our life',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 70, 40, 0),
            width: 400,
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(225,192,106,1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Register(setTheme: setTheme)));
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
            width: 400,
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Login(setTheme: setTheme)));
              },
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Colors.black12,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
