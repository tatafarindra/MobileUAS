import 'package:flutter/material.dart';
import 'package:uas/model/music.dart';


import '../service/music_service.dart';
import 'detailAlbum.dart';

class DetailSong extends StatefulWidget {
  const DetailSong({Key? key}) : super(key: key);

  @override
  State<DetailSong> createState() => _DetailSongState();
}

class _DetailSongState extends State<DetailSong> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.fromLTRB(110, 0, 110, 0),
          child: Text(
            "Playing",
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
              'Sedang di putar',
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

          IconButton(
            icon: const Icon(Icons.play_arrow, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => DetailSong(),
              ));
            },
          )
          // Row(
          //     children: <Widget>[
          //       Container(
          //         margin: const EdgeInsets.fromLTRB(70, 50, 20, 0),
          //         child: Text(
          //           '5 Following',
          //           style: TextStyle(
          //             fontSize: 15,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //       Container(
          //         margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          //         child: Text(
          //           '5 Followers',
          //           style: TextStyle(
          //             fontSize: 15,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //       Container(
          //         margin: const EdgeInsets.fromLTRB(20, 50, 40, 0),
          //         child: Text(
          //           '5 Playlist',
          //           style: TextStyle(
          //             fontSize: 15,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //
          //     ]
          // ),
        ],
      ),

    );

  }
}