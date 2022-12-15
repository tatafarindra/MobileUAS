import 'package:uas/view/home_view.dart';
import 'package:uas/view/home_view.dart';
import 'package:uas/view/login.dart';
import 'package:flutter/material.dart';
// import 'package:dataramen/shared_pref.dart';
import 'package:uas/view/onboarding.dart';
import 'package:uas/view/profile.dart';
// import 'package:figma/login_page.dart';
import 'package:uas/view/search.dart';
import 'package:uas/view/register.dart';
import 'package:uas/view/shared_preferences.dart';

void main() {
  runApp(MyApp());
}
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized(); //
//   await SharedPref.init();
//   runApp(const MyApp());
// }

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  // const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData = ThemeData.light();

  /* fungsi mengubah tema sesuai inputan parameter */
  void setTheme(bool isDarkMode) {
    setState(() {
      /* jika isDarkmode true maka ThemeData adalah dark dan sebaliknya */
      themeData = (isDarkMode) ? ThemeData.dark() : ThemeData.light();

      /* simpan nilai boolean pada shared preferences */
      SharedPref.pref?.setBool('isDarkMode', isDarkMode);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    bool isDarkMode = SharedPref.pref?.getBool('isDarkMode') ?? false;
    setTheme(isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      // home: search(),
      home: onboarding(),
      // home: Register(),
      // home: Home(str: '',),
      // home: Profile(),
    );
  }
}
