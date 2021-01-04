import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/mock/mock_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseServiceMock extends IFirebaseService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _mockFireStore = new MockFirestore();

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

  @override
  Future<String> createPatient(
      {String collection, String docId, Map<String, dynamic> data}) async {
    print('create Temp User Throught Firebase Service Mock');
    print(data);
    print(data['username']);
    print(data['dob']);
    var tempApp = await _createTempApp();
    var tempAuthResult = await _createTempAuthWithProvidedTempApp(
        tempApp, data['username'], data['uniqueKey']);
    var addedUserId = tempAuthResult.user.uid;
    _firestore.collection('Users').doc(addedUserId).set(data);
    _deleteTempApp(tempApp);
    var setRoleStatus = await _setRoleToUser(
        uid: addedUserId, username: data['username'], role: 'patient');
    setRoleStatus
        ? print('success creating patient Mock')
        : print('failed creating patient Mock');
    print('Success writing mock data');
    return addedUserId;
  }

  @override
  String getUserId() {
    // TODO: implement getUserId
    throw UnimplementedError();
  }

  @override
  Future<void> setDataToCollectionWithSpecificDoc(
      {String collection, String docId, Map<String, dynamic> data}) async {
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

  Future<QuerySnapshot> searchDocumentByField({
    @required String collection,
    @required String field,
    @required dynamic fieldValue,
  }) async {
    var doc = await _firestore
        .collection(collection)
        .where(field, isEqualTo: fieldValue)
        .get();
    print(doc.docs);
    return doc;
  }

  Future<bool> _setRoleToUser({
    @required String uid,
    @required String username,
    @required String role,
  }) async {
    bool isSuccess = await _firestore.collection('Roles').add({
      'uid': uid,
      'username': username,
      'role': role,
    }).then((value) {
      print(
          'successfully added role to $uid username: $username with role $role');
      return true;
    }).catchError((onError) {
      print(
          'ERROR! $onError on added role to $uid username: $username with role $role');
      return false;
    });
    return isSuccess;
  }

  Future<DocumentSnapshot> searchDocumentByDocId(
      {@required String collection, @required docId}) async {
    return await _firestore.collection(collection).doc(docId).get();
  }

  Future<void> addSubCollection({
    @required String collection,
    @required String docId,
    @required String subCollection,
    @required Map<String, dynamic> data,
  }) async {
    return await _firestore
        .collection(collection)
        .doc(docId)
        .collection(subCollection)
        .add(data)
        .then((value) => print(
            ' success adding Mock Data $data to $subCollection subcollection of $collection which id = $docId'))
        .catchError((onError) {
      print(
          'Error $onError adding Mock Data $data to $subCollection subcollection of $collection which id = $docId');
    });
  }

  @override
  Future<List<QueryDocumentSnapshot>> getUserList() {
    throw UnimplementedError();
  }
}
