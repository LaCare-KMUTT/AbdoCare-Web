import 'package:AbdoCare_Web/page/mockDataPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Widget/material.dart';
import 'page/addPatient.dart';
import 'page/editPatient.dart';
import 'page/appointment.dart';
import 'page/login.dart';
import 'page/patientList.dart';
import 'page/postHome.dart';
import 'page/postHos.dart';
import 'page/pre.dart';
import 'page/dashboard_pre.dart';
import 'page/dashboard_postHos.dart';
import 'page/dashboard_postHome.dart';
import 'services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: await_only_futures
  await setupServiceLocator(isMock: false);
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
        primarySwatch: createMaterialColor(Color(0xFFC37447)),
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
        '/patientList_page': (context) => PatientListPage(),
        '/addPatient_page': (context) => AddPatientPage(),
        '/editPatient_page': (context) => EditPatientPage(),
        '/pre_page': (context) => PrePage(),
        '/postHos_page': (context) => PostHosPage(),
        '/postHome_page': (context) => PostHomePage(),
        '/login_page': (context) => LoginPage(),
        '/dashboard_pre': (context) => PreDashboardPage(),
        '/dashboard_postHome': (context) => PostHomeDashboardPage(),
        '/dashboard_postHos': (context) => PostHosDashboardPage(),
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
