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
import 'page/appointment.dart';
import 'services/service_locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupServiceLocator(isMock: false);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        fontFamily: "Prompt",
        primaryColor: Color(0xFFC37447),
        primarySwatch: createMaterialColor(Color(0xFFC37447)),
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
        '/appointment_page': (context) => AppointmentPage(),
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('th', 'TH'), // Thai
      ],
    );
  }
}
