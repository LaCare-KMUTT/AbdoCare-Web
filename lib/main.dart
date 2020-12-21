import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'page/AddPatient.dart';
import 'page/Login.dart';
import 'page/PostHome.dart';
import 'page/PostHos.dart';
import 'page/Pre.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
          bodyText2: TextStyle(
              fontSize: 16.0,
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
        '/PostHome_page': (context) => PostHomePage(),
        '/Login_page': (context) => LoginPage()
      },
    );
  }
}
