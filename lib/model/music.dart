class Music {
  String judul;
  String images;
  String penyanyi;
  String tahun;
  String lagu1;
  String lagu2;
  String lagu3;
  String lagu4;

  Music(
      {required this.judul,
        required this.images,
        required this.penyanyi,
        required this.tahun,
        required this.lagu1,
        required this.lagu2,
        required this.lagu3,
        required this.lagu4
      });

  factory Music.fromJson(Map map) {
    return Music(
        judul: map['judul'],
        images: map['images'],
        penyanyi: map['penyanyi'],
        tahun: map['tahun'],
        lagu1: map['lagu1'],
        lagu2: map["lagu2"],
        lagu3: map["lagu3"],
        lagu4: map["lagu4"]
    );
    //   return Ramene(
    //       map['description'], map['img_url'], map['price'], map['product_name']);
    // }
  }
}