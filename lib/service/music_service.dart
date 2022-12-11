// 1. install package dio terlebih dahulu, dan import ke sini
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ramene/model/music.dart';

// 2. menggunakan asyncronous untuk ambil data api
class MusicService {
  static Future<List<Music>> getDataMusic() async {
    Dio dio = Dio();

    var response = await dio.get(
        'http://localhost:3000/album');

    List<Music> music=
    (response.data as List).map((v) => Music.fromJson(v)).toList();

    return music;
  }
}