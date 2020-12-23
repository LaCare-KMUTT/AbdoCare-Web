import 'package:AbdoCare_Web/Widget/sidebar.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:flutter/material.dart';

import '../Widget/patientRegisterForm.dart';
import '../Widget/sidebar.dart';
import '../services/service_locator.dart';
import '../Widget/appbar.dart';

class AddPatientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPatientPageState();
  }
}

class _AddPatientPageState extends State<AddPatientPage> {
  // final _auth = FirebaseAuth.instance;
  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  void _submitPatientRegisterForm({
    @required String patientName,
    @required String address,
    @required String gender,
    @required String dob,
    @required double weight,
    @required double height,
    @required String patientTel,
    @required String careTakerName,
    @required String careTakerTel,
    @required String careTakerRelationship,
    @required String username,
    @required String uniqueKey,
    @required String password,
  }) async {
    // FirebaseApp tempApp = await Firebase.initializeApp(
    //     name: 'Temporary Register', options: Firebase.app().options);

    // UserCredential authResult = await FirebaseAuth.instanceFor(app: tempApp)
    //     .createUserWithEmailAndPassword(email: username, password: uniqueKey);
    // FirebaseFirestore.instance
    //     .collection('Users')
    //     .doc(authResult.user.uid)
    //     .set({
    //   'name': patientName,
    //   'address': address,
    //   'gender': gender,
    //   'dob': dob,
    //   'weight': weight,
    //   'height': height,
    //   'patientTel': patientTel,
    //   'careTakerName': careTakerName,
    //   'careTakerTel': careTakerTel,
    //   'careTakerRelationship': careTakerRelationship,
    //   'username': username,
    //   'uniqueKey': uniqueKey,
    //   'password': password,
    //   'role': 'patient',
    // });

    // tempApp.delete();
    _firebaseService.createPatient(collection: 'Users', data: {
      'name': patientName,
      'address': address,
      'gender': gender,
      'dob': dob,
      'weight': weight,
      'height': height,
      'patientTel': patientTel,
      'careTakerName': careTakerName,
      'careTakerTel': careTakerTel,
      'careTakerRelationship': careTakerRelationship,
      'username': username,
      'uniqueKey': uniqueKey,
      'password': password,
      'role': 'patient',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('AbdoCare'),
        title: const Text('เพิ่มผู้ป่วย'),
        backgroundColor: Color(0xFFC37447),
      ),
      body: PatientRegisterForm(
        _submitPatientRegisterForm,
      ),
      drawer: SideBar(),
    );
  }
}
