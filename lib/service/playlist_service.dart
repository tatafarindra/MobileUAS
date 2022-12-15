// 1. install package dio terlebih dahulu, dan import ke sini
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:uas/model/playlist.dart';

// 2. menggunakan asyncronous untuk ambil data api
class PlaylistService {
  static Future<List<Playlist>> getDataPlay() async {
    Dio dio = Dio();

    var response = await dio.get(
        'http://192.168.1.69:3000/playlist');

    List<Playlist> playlist=
    (response.data as List).map((v) => Playlist.fromJson(v)).toList();

    return playlist;
  }
}