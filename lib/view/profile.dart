import 'package:flutter/material.dart';
import 'package:uas/view/register.dart';
import 'package:uas/view/shared_preferences.dart';


class Profile extends StatefulWidget {
  // const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkMode) {
    setState(() {
      themeData = (isDarkMode) ? ThemeData.dark() : ThemeData.light();
      SharedPref.pref?.setBool('isDarkMode', isDarkMode);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.fromLTRB(110, 0, 110, 0),
          child: Text(
            "Profile",
          ),
        ),


        backgroundColor: Color.fromARGB(225,192,106,1),
      ),
      body: Column(
          children: <Widget>[
            Container(
              // color: Colors.white,
              margin: const EdgeInsets.fromLTRB(10, 50, 0, 0),
              child: const Text(
                'PROFILE USER',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 10, 0),
            // alignment: Alignment.center,

            // color: Colors.white,
            child: Image.asset(
              'lib/images/profile.png',
              height: 250,
              width: 500,
            ),
        ),
            Container(
              // color: Colors.white,
              margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: const Text(
                'TATA FARINDRA',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
              Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(70, 50, 20, 0),
                  child: Text(
                    '5 Following',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                  child: Text(
                    '5 Followers',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 50, 40, 0),
                  child: Text(
                    '5 Playlist',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ]
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
                  "Edit Profile",
                  style: TextStyle(
                    color: Color(0xffffffff),
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