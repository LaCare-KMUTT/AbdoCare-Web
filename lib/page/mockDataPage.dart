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
                  borderRadius: BorderRadius.circular(7.0)),
              textColor: Colors.white,
              color: Color(0xFF2ED47A),
              child:
                  Text('สร้าง Patient Account', style: TextStyle(fontSize: 18)),
              onPressed: () {
                var mockedData = _mockFirestore.mockUsersCollection();
                _firebaseService.createPatient(
                    collection: 'Users', data: mockedData);
                print('สร้าง Patient Account');
              },
            ),
          ],
        ),
      ),
    );
  }
}
