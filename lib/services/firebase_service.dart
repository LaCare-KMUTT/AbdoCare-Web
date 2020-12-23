import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'interfaces/firebase_service_interface.dart';

class FirebaseService extends IFirebaseService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  Future<void> writeDataToFirestoreWithProvidedDoc({
    @required String collection,
    @required String docId,
    @required Map<String, dynamic> data,
  }) {}
  Future<void> createPatient({
    @required String collection,
    @required String docId,
    @required Map<String, dynamic> data,
  }) async {
    FirebaseApp tempApp = await Firebase.initializeApp(
        name: 'Temporary Register', options: Firebase.app().options);
    UserCredential tempAuthResult = await FirebaseAuth.instanceFor(app: tempApp)
        .createUserWithEmailAndPassword(
            email: data['username'], password: data['uniqueKey']);
    var writeData = data.keys.toList();
    print(writeData);
    _firestore.collection('Users').doc(tempAuthResult.user.uid).set({});
  }

  String getUserId() => _auth.currentUser.uid;
}
