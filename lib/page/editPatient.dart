import 'package:flutter/material.dart';

import '../Widget/patient_list/editPatientForm.dart';
import '../Widget/appbar.dart';
import '../Widget/sidebar.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class EditPatientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EditPatientPageState();
  }
}

class _EditPatientPageState extends State<EditPatientPage> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  void _submitEditPatientForm({
    @required String hn,
    @required String an,
    @required String patientName,
    @required String patientSurname,
    @required String address,
    @required String gender,
    @required String dob,
    @required String patientTel,
    @required String careTakerName,
    @required String careTakerSurname,
    @required String careTakerTel,
    @required String careTakerRelationship,
    @required String operationDate,
    @required String operationName,
    @required String operationMethod,
    @required String previousIllness,
    @required String state,
    @required String doctorName,
    @required String bedNumber,
    @required String roomNumber,
    // @required String username,
    // @required String uniqueKey,
    //@required String password,
  }) async {
    // var document = await _firebaseService.searchDocumentByField(
    //     collection: 'User', field: 'hn', fieldValue: hn);
    // var docid = document.docs;
    // print('docid: $docid');

    var subCollectionDocument = await _firebaseService.searchDocumentByDocId(
        collection: 'User', docId: 'R52s1d4MCSU7ldYfpY6sqAMe1qv2');
    print(subCollectionDocument.id);

    await _firebaseService.updateDataToCollectionField(
        collection: 'Users',
        docId: 'R52s1d4MCSU7ldYfpY6sqAMe1qv2',
        data: {
          'hn': hn,
          'name': patientName,
          'surname': patientSurname,
          'address': address,
          'gender': gender,
          'dob': dob,
          'patientTel': patientTel,
        });

    await _firebaseService.updateFieldToSubCollection(
      collection: 'Users',
      docId: 'R52s1d4MCSU7ldYfpY6sqAMe1qv2',
      subCollection: 'an',
      subCollectionDoc: 'U2hCfDabehXhzm4voQeF',
      data: {
        'an': 'testAnNumber',
        'careTakerName': careTakerName,
        'careTakerSurname': careTakerSurname,
        'careTakerTel': careTakerTel,
        'careTakerRelationship': careTakerRelationship,
        'operationDate': DateTime.now()
            .toString(), //TODO Change operationDate to be input not DateTime.now()
        'doctorName': doctorName,
        'previousIllness': previousIllness,
        'bedNumber': bedNumber,
        'roomNumber': roomNumber,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String hn = ModalRoute.of(context).settings.arguments as String;
    print('Print argument editPatient = $hn');
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('แก้ไขข้อมูลผู้ป่วย'),
        appBar: AppBar(),
      ),
      body: EditPatientForm(
        _submitEditPatientForm,
      ),
      drawer: SideBar(),
    );
  }
}
