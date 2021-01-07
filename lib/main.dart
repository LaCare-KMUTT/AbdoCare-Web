import 'package:AbdoCare_Web/page/mockDataPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'page/patientList.dart';
import 'page/addPatient.dart';
import 'page/login.dart';
import 'page/postHome.dart';
import 'page/postHos.dart';
import 'page/pre.dart';
import 'page/dashboard.dart';
import 'services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServiceLocator(isMock: false);

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
        '/patientList_page': (context) => PatientListPage(),
        '/addPatient_page': (context) => AddPatientPage(),
        '/pre_page': (context) => PrePage(),
        '/postHos_page': (context) => PostHosPage(),
        '/postHome_page': (context) => PostHomePage(),
        '/login_page': (context) => LoginPage(),
        '/dashboard_page': (context) => DashboardPage(),
        '/mock': (context) => MockDataPage(),
      },
    );
  }
}
