import 'package:AbdoCare_Web/page/evaluationForm.dart';
import 'package:AbdoCare_Web/page/mockDataPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Widget/customMaterial.dart';
import 'page/addPatient.dart';
import 'page/appointment.dart';
import 'page/dashboard_postHome.dart';
import 'page/dashboard_postHos.dart';
import 'page/dashboard_pre.dart';
import 'page/editPatient.dart';
import 'page/login.dart';
import 'page/patientList.dart';
import 'page/postHome.dart';
import 'page/postHos.dart';
import 'page/pre.dart';
import 'services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Firebase.initializeApp(
    name: 'Abdocare-Register-Service',
    options: const FirebaseOptions(
        projectId: 'abdocare-bdab0',
        apiKey: 'AIzaSyDu8_HYCIsMBc8PkNs5oddKhjcJLFoNaVk',
        authDomain: 'abdocare-bdab0.firebaseapp.com',
        appId: '1:611491873650:web:7c3d372d1cdf8f314393eb',
        messagingSenderId: '611491873650'),
  );
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
        primarySwatch: CustomMaterial().createMaterialColor(Color(0xFFC37447)),
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
        '/forms': (context) => EvaluationFormPage(),
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
