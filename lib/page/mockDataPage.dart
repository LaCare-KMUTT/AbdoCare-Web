import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/mock/mock_data.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';

class MockDataPage extends StatelessWidget {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final _mockFirestore = new MockFirestore();

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
                var paitentId = await _firebaseService.createPatient(
                    collection: 'Users', data: mockedUserCollection);
                print('สร้าง Patient Account');
                var mockedAnSubCollection =
                    _mockFirestore.mockAnSubCollectionOnCreatePatient();
                await _firebaseService.addSubCollection(
                    collection: 'Users',
                    docId: paitentId,
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
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              textColor: Colors.white,
              color: Color(0xFF2ED47A),
              child: Text(
                'Logout med team',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () async {
                await _firebaseService.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
