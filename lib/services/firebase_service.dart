import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'interfaces/firebase_service_interface.dart';

class FirebaseService extends IFirebaseService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  Future<void> setDataToCollectionWithSpecificDoc({
    @required String collection,
    @required String docId,
    @required Map<String, dynamic> data,
  }) async {
    bool isSuccess = await _firestore
        .collection(collection)
        .doc(docId)
        .set(data)
        .then((value) {
      print("Success on adding $data to $docId in collection $collection");
      return true;
    }).catchError((onError) {
      print("Failed on adding $data to $docId in collection $collection");
      print(onError);
      return false;
    });
    return isSuccess;
  }

  Future<FirebaseApp> _createTempApp() async {
    return await Firebase.initializeApp(
        name: 'Temporary Register', options: Firebase.app().options);
  }

  void _deleteTempApp(FirebaseApp tempApp) {
    tempApp.delete();
  }

  Future<UserCredential> _createTempAuthWithProvidedTempApp(
      FirebaseApp tempApp, String username, String password) async {
    return await FirebaseAuth.instanceFor(app: tempApp)
        .createUserWithEmailAndPassword(email: username, password: password);
  }

  Future<void> createPatient({
    @required String collection,
    String docId,
    @required Map<String, dynamic> data,
  }) async {
    print('createUser using CreatePatient FirebaseInterface');
    var tempApp = await _createTempApp();
    var tempAuthResult = await _createTempAuthWithProvidedTempApp(
        tempApp, data['username'], data['password']);
    _firestore.collection('Users').doc(tempAuthResult.user.uid).set(data);
    _deleteTempApp(tempApp);
  }

  Future<bool> addDocumentToCollection({
    @required String collection,
    @required Map<String, dynamic> docData,
  }) async {
    bool isSuccess =
        await _firestore.collection(collection).add(docData).then((value) {
      print('Success add $docData to $collection collection');
      return true;
    }).catchError((onError) {
      print('Failed to add $docData to $collection collection');
      return false;
    });
    return isSuccess;
  }

  String getUserId() => _auth.currentUser.uid;
}
