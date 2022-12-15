class Playlist {
  String nama;

  Playlist(
      {required this.nama
      });

  factory Playlist.fromJson(Map map) {
    return Playlist(
      nama: map['nama']
    );
    //   return Ramene(
    //       map['description'], map['img_url'], map['price'], map['product_name']);
    // }
  }
}