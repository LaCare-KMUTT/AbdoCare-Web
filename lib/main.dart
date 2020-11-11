import 'package:flutter/material.dart';

import 'page/AddPatient.dart';
import 'page/Login.dart';
import 'page/PostCom.dart';
import 'page/PostHos.dart';
import 'page/Pre.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        fontFamily: "Prompt",
        primaryColor: Color(0xFFC37447),
        primarySwatch: Colors.amber,
        textTheme: TextTheme(
          bodyText1: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
          bodyText2: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              color: Colors.black),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'AbdoCare',
      routes: {
        '/addPatient_page': (context) => AddPatientPage(),
        '/Pre_page': (context) => PrePage(),
        '/PostHos_page': (context) => PostHosPage(),
        '/PostCom_page': (context) => PostComPage(),
        '/Login_page': (context) => LoginPage()
      },
    );
  }
}
