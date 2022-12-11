import 'package:flutter/material.dart';

import 'data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
    );
  }
}

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {

  //untuk mengontroll textfield saat ada perubahan
  TextEditingController _controllerSearch = TextEditingController();

  //data bertipe widget ini mulanya kita buat text.
  //tapi saat ada perubahan data ini akan berubah menjadi form dan sebalikanya menjadi text
  Widget? searchTextField = Text("Search");

  //jika false maka tampilkan icon pencarian
  //jika true maka tampilkan icon panah dan close
  bool search = false;
  Color _bgColor = Colors.green;
  List list = [];

  @override
  void initState() {
    super.initState();
    //saat file ini dijalankan pertama kali
    //maka data list akan diisi dengan data dari data.dart
    list.addAll(items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(225,192,106,1),
        //title mulanya adalah text
        title: searchTextField,
        actions: <Widget>[
          //jika search bernilai false maka tampilkan icon search
          //jika search bernilai true maka tampilkan icon close
          (search == false)
              ? IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  searchTextField = appSearch(context);
                  _bgColor = Colors.white;
                  search = true;
                });
              })
              : IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  list.clear();
                  list.addAll(items);
                  _controllerSearch.clear();
                });
              })
        ],
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, int index) {
          return ListTile(
            title: Text(
              list[index],
              style: TextStyle(fontSize: 18),
            ),
          );
        },
      ),
    );
  }

  //saat icon search dijalankan maka widget ini akan dijalankan
  //widget ini berupa form.
  Widget appSearch(BuildContext context) {
    return TextField(
      controller: _controllerSearch,
      style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
          icon: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  searchTextField = Text("Search Genre");
                  search = false;
                  _bgColor = Color.fromARGB(225,192,106,1);
                  _controllerSearch.clear();
                  list.clear();
                  list.addAll(items);
                });
              }),
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey)),
      // setiap ada perubahan, jalankan fungsi _searchName
      onChanged: (name) {
        _searchName(name);
      },
    );
  }

  //fungsi ini akan dijalankan setiap kalian typing/mengetik
  //fungsi ini akan mencari nama sesuai yang diketikkan
  _searchName(String name) {
    if (name.isNotEmpty) {
      setState(() {
        list.clear();
        //melakukan perulangan/looping
        items.forEach((item) {
          //jika list data ada yang mengandung susunan huruf yang dicari
          //maka masukan ke dalam data list
          if (item.toLowerCase().contains(name.toLowerCase())) {
            list.add(item);
          }
        });
      });
    } else {
      setState(() {
        list.clear();
        list.addAll(items);
      });
    }
  }
}