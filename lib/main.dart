import 'package:flutter/material.dart';
import 'package:AbdoCare_Web/page/AddPatient.dart';
import 'package:AbdoCare_Web/page/Pre.dart';
import 'package:AbdoCare_Web/page/PostHos.dart';
import 'package:AbdoCare_Web/page/PostCom.dart';
import 'package:AbdoCare_Web/page/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(fontFamily: "Prompt"),
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
