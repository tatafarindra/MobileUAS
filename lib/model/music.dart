class Music {
  String judul;
  String images;
  String penyanyi;
  String tahun;

  Music(
      {required this.judul,
        required this.images,
        required this.penyanyi,
        required this.tahun});

  factory Music.fromJson(Map map) {
    return Music(
        judul: map['judul'],
        images: map['images'],
        penyanyi: map['penyanyi'],
        tahun: map['tahun']);
    //   return Ramene(
    //       map['description'], map['img_url'], map['price'], map['product_name']);
    // }
  }
}