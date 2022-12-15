import 'package:flutter/material.dart';
import 'package:uas/model/music.dart';
import 'package:uas/model/playlist.dart';
import 'package:uas/service/playlist_service.dart';
import 'package:uas/view/addPlaylist.dart';
import 'package:uas/view/addSong.dart';


import '../service/music_service.dart';
import 'package:uas/view/detailAlbum.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
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
        actions:[
          new IconButton(
            icon: new Icon(Icons.add, color: Colors.white),
            onPressed: () {
              print('object');
              // Navigator.of(context).pushReplacement();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddLib(),
                ),
              );
            },
          ),
        ],

        backgroundColor: Color.fromARGB(225,192,106,1),
      ),

      body: FutureBuilder<List<Playlist>>(


          future: PlaylistService.getDataPlay(),


          builder: (context, snapshot) {


            //loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Memuat...');
            } else {
              //error
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {

                //berhasil
                // return Text(snapshot.data.toString());
                return
                  Container(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddSong(
                                        )));
                          },

                          child: Stack(
                            children: [
                              // Container(
                              //   width: double.infinity,
                              //   height: double.infinity,
                              //   child: Image.network(
                              //     "${snapshot.data![index].images}",
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),

                              new Card(
                                child: new Row(
                                  children: <Widget>[
                                    // Padding(
                                    //   padding: const EdgeInsets.all(10.0),
                                    //   child: Image.network(
                                    //     '${kucing[index].gambar}',
                                    //     width: 100,
                                    //   ),
                                    // ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 10.0),
                                            child: Text(
                                            "${snapshot.data![index].nama}",
                                              style: Theme.of(context).textTheme.headline6,
                                            ),
                                          ),
                                          // Text('${kucing[index].tanggal}'),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );



              }

            }

          }


      ),
    );

  }
}