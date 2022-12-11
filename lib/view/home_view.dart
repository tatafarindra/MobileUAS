import 'package:flutter/material.dart';
import 'package:uas/model/music.dart';


import '../service/music_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),

        backgroundColor: Color.fromARGB(225,192,106,1),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(225,192,106,1),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: _changeSelectedNavBar,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
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
      body: FutureBuilder<List<Music>>(
          future: MusicService.getDataMusic(),
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
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Image.network(
                                "${snapshot.data![index].images}",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  color: Color.fromARGB(225,192,106,1),
                                  child: Text(
                                    "${snapshot.data![index].judul}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  color: Color.fromARGB(225,192,106,1),
                                  child: Text(
                                    "${snapshot.data![index].penyanyi}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 10
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  color: Color.fromARGB(225,192,106,1),
                                  child: Text(
                                    "${snapshot.data![index].tahun}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10
                                    ),
                                  ),
                                ),
                              ],
                            ),
                              ],
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