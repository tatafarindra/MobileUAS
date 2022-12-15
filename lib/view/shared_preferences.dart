import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  // variable pref yang bisa diakses dimana saaja ketika fungsi init telah dijalankan
  static SharedPreferences? pref;

  // fungsi init yang nantinya dijalankan sekali saja ketika aplikasi pertama kali dibuka
  static init() async {
    return pref = await SharedPreferences.getInstance();
  }
}
