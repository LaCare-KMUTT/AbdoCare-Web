import 'package:AbdoCare_Web/Widget/patient_list/reAdmitForm.dart';
import 'package:AbdoCare_Web/services/cloud_function_service.dart';
import 'package:flutter/material.dart';

import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class ReAdmitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReAdmitPageState();
  }
}

class _ReAdmitPageState extends State<ReAdmitPage> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final CloudFunctionService _cloudFunctionService =
      locator<CloudFunctionService>();

  var _currentHn = '';
  void _submitReAdmitForm({
    @required String hn,
    @required String an,
    @required String patientName,
    @required String patientSurname,
    @required String address,
    @required String gender,
    @required DateTime dob,
    @required String patientTel,
    @required String careTakerName,
    @required String careTakerSurname,
    @required String careTakerTel,
    @required String careTakerRelationship,
    @required DateTime operationDate,
    @required String operationName,
    @required String operationMethod,
    @required String previousIllness,
    @required String state,
    @required String doctorName,
    @required String bedNumber,
    @required String roomNumber,
    @required DateTime latestStateChange,
  }) async {
    var document = await _firebaseService.searchDocumentByField(
        collection: 'DischargedPatient', field: 'hn', fieldValue: _currentHn);
    var userCollectionId = document.docs.first.id;

    await _firebaseService.addSubCollection(
      collection: 'DischargedPatient',
      docId: userCollectionId,
      subCollection: 'an',
      data: {
        'an': an,
        'careTakerName': careTakerName,
        'careTakerSurname': careTakerSurname,
        'careTakerTel': careTakerTel,
        'careTakerRelationship': careTakerRelationship,
        'operationName': operationName,
        'operationMethod': operationMethod,
        'operationDate': operationDate,
        'doctorName': doctorName,
        'previousIllness': previousIllness,
        'bedNumber': bedNumber,
        'roomNumber': roomNumber,
        'state': state,
        'latestStateChange': latestStateChange,
      },
    );
    await _cloudFunctionService.restoreUser(userId: userCollectionId);
  }

  @override
  Widget build(BuildContext context) {
    final String currentHn =
        ModalRoute.of(context).settings.arguments as String;
    setState(() {
      _currentHn = currentHn;
      print(currentHn);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Re-Admit',
          style: TextStyle(fontSize: 24),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.pushNamed(context, '/patientList_page'),
        ),
      ),
      body: ReAdmitForm(
        _submitReAdmitForm,
      ),
    );
  }
}
