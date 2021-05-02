import 'package:AbdoCare_Web/page/mockDataPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Widget/material.dart';
import 'page/addPatient.dart';
import 'page/appointment.dart';
import 'page/editPatient.dart';
import 'page/login.dart';
import 'page/patientList.dart';
import 'page/postHome.dart';
import 'page/postHos.dart';
import 'page/pre.dart';
import 'services/service_locator.dart';
import 'page/notification.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotENV;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotENV.load(fileName: 'config.env');
  await Firebase.initializeApp();
  await Firebase.initializeApp(
    name: DotENV.env['REGISTER_FIREBASE_NAME'],
    options: FirebaseOptions(
        projectId: DotENV.env['PROJECT_ID'],
        apiKey: DotENV.env['API_KEY'],
        authDomain: DotENV.env['AUTH_DOMAIN'],
        appId: DotENV.env['APP_ID'],
        messagingSenderId: DotENV.env['MESSAGING_SENDER_ID']),
  );
  //ignore: await_only_futures
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
        '/mock': (context) => MockDataPage(),
        '/appointment_page': (context) => AppointmentPage(),
        '/notification_page': (context) => NotificationPage(),
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
