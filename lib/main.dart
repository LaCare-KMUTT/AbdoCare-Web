import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'page/AddPatient.dart';
import 'page/Login.dart';
import 'page/PostCom.dart';
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
