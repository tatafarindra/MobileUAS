import 'package:flutter/material.dart';
import 'package:uas/view/register.dart';


class AddLib extends StatefulWidget {
  // const Profile({Key? key}) : super(key: key);

  @override
  State<AddLib> createState() => _AddLibState();
}

class _AddLibState extends State<AddLib> {
  @override
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkMode) {
    setState(() {
      themeData = (isDarkMode) ? ThemeData.dark() : ThemeData.light();
    });
  }

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
            margin: const EdgeInsets.fromLTRB(10, 50, 0, 30),
            child: const Text(
              'Buat Playlist Baru',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextField(
            style: TextStyle(

              fontSize: 16,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: "Nama Playlist",
              hintText: "Nama Playlist",
              contentPadding:
              EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              hintStyle: TextStyle(

                fontSize: 16,
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
                "Simpan",
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