import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'page/PatientList.dart';
import 'page/Login.dart';
import 'page/PostCom.dart';
import 'page/PostHos.dart';
import 'page/Pre.dart';
import 'page/AddPatient.dart';

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
        '/PatientList_page': (context) => PatientListPage(),
        '/Pre_page': (context) => PrePage(),
        '/PostHos_page': (context) => PostHosPage(),
        '/PostCom_page': (context) => PostComPage(),
        '/Login_page': (context) => LoginPage(),
        '/addPatient_page': (context) => AddPatientPage()
      },
    );
  }
}
