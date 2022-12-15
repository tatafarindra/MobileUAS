import 'package:flutter/material.dart';
import 'package:uas/view/home_view.dart';
import 'package:uas/view/register.dart';


class AddSong extends StatefulWidget {
  // const Profile({Key? key}) : super(key: key);

  @override
  State<AddSong> createState() => _AddSongState();
}

class _AddSongState extends State<AddSong> {
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkMode) {
    setState(() {
      themeData = (isDarkMode) ? ThemeData.dark() : ThemeData.light();
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.fromLTRB(110, 0, 110, 0),
          child: Text(
            "Playlist",
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
              'Tambahkan Lagu',
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
              'lib/images/playlist.jpeg',
              height: 250,
              width: 500,
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
                        builder: (context) => Home(str: '',setTheme: setTheme)));
              },
              child: Text(
                "Tambahkan Lagu",
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