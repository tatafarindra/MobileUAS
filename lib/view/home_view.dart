import 'package:flutter/material.dart';
import 'package:uas/model/music.dart';
import 'package:uas/view/shared_preferences.dart';


import '../service/music_service.dart';
import 'package:uas/view/detailAlbum.dart';


Future<void> main() async {
  /* WidgetFlutterBinding digunakan untuk berinteraksi dengan mesin Flutter.
  SharedPref.init() perlu memanggil kode asli untuk menginisialisasi, oleh karena itu
  perlu memanggil ensureInitialized() untuk memastikan terdapat instance yang bisa dijalankan */

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();

  // runApp(const MyApp());
}
class Home extends StatefulWidget {
  Function setTheme;
  Home({Key? key, required this.setTheme, required String str}) : super(key: key);
  // const Home({Key? key, required String str}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  // ThemeData themeData = ThemeData.light();
  bool isDarkMode = SharedPref.pref?.getBool('isDarkMode') ?? false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.fromLTRB(110, 0, 110, 0),
          child: Text(
            "Home",
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {
              isDarkMode = !isDarkMode;
              widget.setTheme(isDarkMode);
            },

          ),
        ],

        backgroundColor: Color.fromARGB(225,192,106,1),
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
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailAlbum(
                                          music:
                                          snapshot.data![index],
                                        )));
                          },
                        child: Stack(
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
                        ),
                        );

                      }),
                );
              }

            }

          }

      ),
      //       itemBuilder: (context, index) {
      // return GestureDetector(
      // onTap: () {
      // Navigator.push(
      // context,
      // MaterialPageRoute(
      // builder: (context) =>
      // DetailAlbum(
      // music:
      // snapshot.data![index],
      // )));
      // },
    );

  }
}