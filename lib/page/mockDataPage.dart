import 'package:AbdoCare_Web/services/interfaces/storage_service_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/interfaces/firebase_service_interface.dart';
import '../services/mock/mock_data.dart';
import '../services/service_locator.dart';
import 'package:flutter_web_image_picker/flutter_web_image_picker.dart';

class MockDataPage extends StatefulWidget {
  @override
  _MockDataPageState createState() => _MockDataPageState();
}

class _MockDataPageState extends State<MockDataPage> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final IStorageService _storageService = locator<IStorageService>();

  var _file;

  final _mockFirestore = new MockFirestore();

  var _anController = TextEditingController();

  var _hnController = TextEditingController();

  var _buttonEnabled = false;
  void _checkField() {
    (_anController.text.trim().isEmpty || _hnController.text.trim().isEmpty)
        ? setState(() {
            _buttonEnabled = false;
          })
        : setState(() {
            _buttonEnabled = true;
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC37447),
        title: Text('AbdoCare'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 150),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              textColor: Colors.white,
              color: Color(0xFF2ED47A),
              child:
                  Text('สร้าง Patient Account', style: TextStyle(fontSize: 18)),
              onPressed: () async {
                var mockedUserCollection = _mockFirestore.mockUsersCollection();
                var patientId = await _firebaseService.createPatient(
                    collection: 'Users', data: mockedUserCollection);
                print('สร้าง Patient Account');
                var mockedAnSubCollection =
                    _mockFirestore.mockAnSubCollectionOnCreatePatient();
                await _firebaseService.addSubCollection(
                    collection: 'Users',
                    docId: patientId,
                    subCollection: 'an',
                    data: mockedAnSubCollection);
                await _firebaseService.addSubCollection(
                    collection: 'Users',
                    docId: patientId,
                    subCollection: 'an',
                    data: mockedAnSubCollection);
              },
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              textColor: Colors.white,
              color: Color(0xFF2ED47A),
              child: Text(
                'สร้าง Medical Team Account',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () async {
                var mockedMedicalTeamCollection =
                    _mockFirestore.mockMedicalTeamCollection();
                await _firebaseService.createMedicalTeam(
                    data: mockedMedicalTeamCollection);
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 20, 150),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _anController,
                      decoration: InputDecoration(hintText: 'an'),
                      onChanged: (text) {
                        _checkField();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _hnController,
                      decoration: InputDecoration(hintText: 'hn'),
                      onChanged: (text) {
                        _checkField();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    textColor: Colors.white,
                    color: Color(0xFF2ED47A),
                    onPressed: _buttonEnabled
                        ? () async {
                            var mockFormCollection =
                                _mockFirestore.mockFormCollection(
                                    an: _anController.text.trim(),
                                    hn: _hnController.text.trim());
                            var form =
                                await _firebaseService.addDocumentToCollection(
                                    collection: 'Forms',
                                    docData: mockFormCollection);
                            var user =
                                await _firebaseService.searchDocumentByField(
                                    collection: 'Users',
                                    field: 'hn',
                                    fieldValue: _hnController.text.trim());
                            var userId = user.docs.first.id;
                            var anSubCollection = await _firebaseService
                                .getLatestAnSubCollection(docId: userId);
                            var data = {
                              'forms': FieldValue.arrayUnion([
                                {
                                  'formId': form.id,
                                  'formName': mockFormCollection['formName'],
                                  'formCreation':
                                      mockFormCollection['creation'],
                                }
                              ])
                            };
                            await _firebaseService
                                .updateFieldToSubCollection(
                                    collection: 'Users',
                                    docId: user.docs.first.id,
                                    subCollection: 'an',
                                    subCollectionDoc: anSubCollection['id'],
                                    data: data)
                                .then((value) => print(
                                    'success adding forms things to an subCollection'))
                                .catchError((onError) {
                              print(
                                  '$onError on adding forms things to an subCollection');
                            });
                          }
                        : null,
                    child: Text('Create form by provided HN AN '),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
            ),
            RaisedButton(
              onPressed: () async {
                // _storageService.startWebFilePicker();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Text('Upload Training'),
            ),
            Divider(
              color: Colors.teal,
            ),
            RaisedButton(
              color: Colors.purple,
              elevation: 8.0,
              textColor: Colors.white,
              onPressed: () {
                // _storageService.makeRequest();
              },
              child: Text('Send file to storage'),
            ),
          ],
        ),
      ),
    );
  }
}
