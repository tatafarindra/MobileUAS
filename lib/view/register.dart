import 'package:uas/view/login.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Register extends StatefulWidget {
  Function setTheme;
  Register({Key? key, required this.setTheme}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkMode) {
    setState(() {
      themeData = (isDarkMode) ? ThemeData.dark() : ThemeData.light();
    });
  }
  // Untuk inisialisasi controller, yang akan diletakkan di text field
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  // method register
  void register(String email, password) async {
    try {
      // ME-POST atau MENAMBAH data json dari link
      var response = await Dio().post('http://192.168.1.69:3000/user',
          data: {"email": email, "password": password});
      if (response.statusCode == 201) {
        // status code 201 karena berhasil membuat data baru
        print("Account created successfully");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Login(setTheme: setTheme),
        ));
      } else {
        print("Registration Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(

        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: Column(

          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(20, 70, 20, 0),
          alignment: Alignment.topCenter,
          child: Text(
            "Listen your favourite song now",
            style: TextStyle(
              color: Color.fromARGB(225,192,106,1),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        SizedBox(height: 3),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 100, 20, 0),
              alignment: Alignment.center,

              // color: Colors.white,
              child: Image.asset(
                'lib/images/43117.jpg',
                height: 250,
                width: 500,
              ),
            ),

        Container(
          margin: const EdgeInsets.fromLTRB(20, 40, 20, 40),
            alignment: Alignment.topCenter,
            child: Text(
              "Create your new account",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 17,
                  fontWeight: FontWeight.normal),
            ),
          ),
        SizedBox(height: 25),

        Container(

        ),
        TextField(
          // memanggil controller
          controller: controllerEmail,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: "Email Address",
            hintText: "Email Address",
            contentPadding:
            EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            hintStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 18),
        TextField(
          // memanggil controller
          controller: controllerPass,
          style: TextStyle(
            fontSize: 16,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: "Password",
            hintText: "Password",
            contentPadding:
            EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            hintStyle: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            // memanggil method register, dengan parameter yg sudah diinputkan melalui text field
            register(controllerEmail.text, controllerPass.text);
          },
          child: Text("SIGN UP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(225,192,106,1),
              minimumSize: const Size.fromHeight(55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                )),
            SizedBox(width: 7),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Login(setTheme: setTheme),
                ));
              },
              child: Text("Sign in",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(225,192,106,1),
                  )),
            ),
          ],
        ),
        ],
      ),
    ),

    );
  }
}
