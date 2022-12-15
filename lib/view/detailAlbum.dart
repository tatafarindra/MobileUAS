import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:uas/model/music.dart';
import 'package:uas/service/music_service.dart';
import 'package:uas/view/detailSong.dart';
import 'package:uas/view/home_view.dart';

class DetailAlbum extends StatelessWidget {
  final Music music;
  const DetailAlbum({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bagianJudul = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(music.judul,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  Text(
                    music.tahun,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Widget album = new Card(
      child: new Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              music.images,
              width: 100,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Text(
                    music.lagu1,
                    style: Theme.of(context).textTheme.headline6,
                  ),
          ),
                IconButton(
                  icon: const Icon(Icons.play_arrow, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => DetailSong(),
                    ));
                  },
                ),
                // Text('${kucing[index].tanggal}'),
              ],
            ),
          ),
        ],
      ),
    );
    Widget album2 = new Card(
      child: new Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              music.images,
              width: 100,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Text(
                    music.lagu2,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.play_arrow, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => DetailSong(),
                    ));
                  },
                ),
                // Text('${kucing[index].tanggal}'),
              ],
            ),
          ),
        ],
      ),
    );
    Widget album3 = new Card(
      child: new Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              music.images,
              width: 100,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Text(
                    music.lagu3,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.play_arrow, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => DetailSong(),
                    ));
                  },
                ),
                // Text('${kucing[index].tanggal}'),
              ],
            ),
          ),
        ],
      ),
    );
    Widget album4 = new Card(
      child: new Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              music.images,
              width: 100,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Text(
                    music.lagu4,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.play_arrow, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => DetailSong(),
                    ));
                  },
                ),
                // Text('${kucing[index].tanggal}'),
              ],
            ),
          ),
        ],
      ),
    );



    // Container(
    //   alignment: Alignment.centerLeft,
    //   height: 60,
    //   width: 370,
    //   margin: EdgeInsets.only(top: 0),
    //   child: TextField(
    //     decoration: InputDecoration(
    //       prefixIcon: Icon(Icons.search),
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //       labelText: 'Search',
    //     ),
    //     onChanged: (value) {
    //       setState:
    //       (() {});
    //     },
    //   ),
    // );

    Widget bagianIcon = Row(
      // Widget buttonSection = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
              children: [
                Icon(Icons.thumb_up,
                    color: Theme.of(context).errorColor),

                Text('Like'),]),
          Column(
              children: [
                Icon(Icons.playlist_add,
                    color: Theme.of(context).indicatorColor),

                Text('Add'),]),
          Column(
              children: [
                Icon(Icons.share,
                    color: Theme.of(context).errorColor),

                Text('Share'),]),

        ]
    );


    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.fromLTRB(110, 0, 110, 0),
          child: Text(music.judul
          ),
        ),
        backgroundColor: Color.fromARGB(225,192,106,1),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(70, 10, 70, 0),
           child: Image.network(
              music.images,
              width: 400,
              height: 300,
              //fit: BoxFit.cover,
            ),
          ),

          bagianJudul,
          bagianIcon,
          album,
          album2,
          album3,
          album4

        ],
      ),
    );
  }
}