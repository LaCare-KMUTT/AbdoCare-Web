import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../interfaces/firebase_service_interface.dart';

class FirebaseServiceMock extends IFirebaseService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

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

    var tempApp = await _createTempApp();
    var tempAuthResult = await _createTempAuthWithProvidedTempApp(
        tempApp, data['username'], data['uniqueKey']);
    var addedUserId = tempAuthResult.user.uid;
    _firestore.collection('Users').doc(addedUserId).set(data).then((value) {
      print('successfully create Patient Mock');
    }).catchError((onError) {
      print('$onError failed on creating patient Mock');
    });
    _deleteTempApp(tempApp);
    var setRoleStatus = await _setRoleToUser(
        uid: addedUserId, username: data['username'], role: 'patient');
    setRoleStatus
        ? print('success creating patient Mock')
        : print('failed creating patient Mock');
    print('Success writing mock data');
    return addedUserId;
  }

  Future<void> createMedicalTeam({Map<String, dynamic> data}) async {
    print('create temp user via Firebase Service Mock');
    var tempApp = await _createTempApp();
    var tempAuthResult = await _createTempAuthWithProvidedTempApp(
        tempApp, data['username'], data['password']);
    var addedUserId = tempAuthResult.user.uid;
    _firestore
        .collection('MedicalTeams')
        .doc(addedUserId)
        .set(data)
        .then((value) {
      print('successfully create Medical Team Mock');
    }).catchError((onError) {
      print('$onError Failed Creating Medical Team Mock');
    });
    _deleteTempApp(tempApp);
    var setRoleStatus = await _setRoleToUser(
        uid: addedUserId, username: data['username'], role: 'Medical Team');
    setRoleStatus
        ? print('Success set role to ${data['username']} as medical team')
        : print('failed setting role to ${data['username']} as medical team');
  }

  @override
  String getUserId() {
    // : implement getUserId
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

  Future<DocumentReference> addDocumentToCollection({
    @required String collection,
    @required Map<String, dynamic> docData,
  }) async {
    var doc = await _firestore.collection(collection).add(docData).then((doc) {
      print('Success add $docData to $collection collection');
      return doc;
    }).catchError((onError) {
      print('Failed to add $docData to $collection collection');
      return null;
    });
    return doc;
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
        .then((subCollectionDocument) async {
      print(
          'success adding $data to $subCollection subcollection of $collection which id = $docId');
      await this.updateDataToCollectionField(
          collection: collection,
          docId: docId,
          data: {
            subCollection: FieldValue.arrayUnion([subCollectionDocument.id])
          });
    }).catchError((onError) {
      print(
          'Error $onError adding $data to $subCollection subcollection of $collection which id = $docId');
    });
  }

  @override
  Future<List<QueryDocumentSnapshot>> getUserList() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getLatestAnSubCollection({String docId}) {
    //  : implement getAnSubCollection
    throw UnimplementedError();
  }

  Future<bool> signIn(
      {String username = 'medtest1@abdocare.com',
      String password = 'abdc1234'}) async {
    username = 'medtest1@abdocare.com';
    password = 'abdc1234';

    var loginResult = await _auth
        .signInWithEmailAndPassword(email: username, password: password)
        .then((result) {
      print('${result.user.email} has logined!');
      return true;
    }).catchError((onError) {
      print('$onError : Failed login!');
      return false;
    });
    print('login finished!');
    return loginResult;
  }

  Future<void> signOut() async {
    if (_auth.currentUser != null) {
      var signingOutUserId = _auth.currentUser.uid;
      await _auth.signOut();
      print('Firebase User : $signingOutUserId has signed Out!');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getPostHosList() {
    //  : implement getPostHosList
    throw UnimplementedError();
  }

  Future<void> updateDataToCollectionField(
      {String collection, String docId, Map<String, dynamic> data}) async {
    await _firestore
        .collection(collection)
        .doc(docId)
        .update(data)
        .then((value) => print(
            'success updating field ${data.keys} with value : ${data.values}'))
        .catchError((onError) {
      print(
          '$onError cannot update field ${data.keys} with value : ${data.values}');
    });
  }

  @override
  Future<void> updateFieldToSubCollection(
      {String collection,
      String docId,
      String subCollection,
      String subCollectionDoc,
      Map<String, dynamic> data}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getPostHomeList() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getLatestSubCollectionMap(
      {String collection,
      String docId,
      String subCollection,
      String subCollectionDocId}) {
    throw UnimplementedError();
  }

  Future<List<QueryDocumentSnapshot>> getAppointmentList(
      {@required DateTime currentDate}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getPreOpList() {
    throw UnimplementedError();
  }

  @override
  Future<String> addDataToFormsCollection(
      {Map<String, dynamic> data,
      String formName,
      String hn,
      String formTime}) {
    throw UnimplementedError();
  }

  @override
  Future<String> getMedicalTeamSignature() {
    throw UnimplementedError();
  }

  @override
  Future<String> getMedicalTeamWard() {
    throw UnimplementedError();
  }

  @override
  Future<String> getMedicalTeamRole() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getCollectionMap(
      {String collection, String docId}) {
    throw UnimplementedError();
  }

  @override
  Future<int> getDayInCurrentState({String hn}) {
    throw UnimplementedError();
  }

  Future<void> addNotification(
      {@required String hn,
      @required String formId,
      @required String formName}) {
    throw UnimplementedError();
  }

  Future<String> getPatientState({@required String hn}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getNotification(
      {@required String patientState}) {
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> getPatientDetail({String hn}) {
    throw UnimplementedError();
  }

  Future<int> getNoticounter() {
    throw UnimplementedError();
  }

  Future<String> getEvaluationStatus(
      {@required String hn,
      @required String formName,
      @required String patientState,
      String vitalSignFormTime}) {
    throw UnimplementedError();
  }

  @override
  Future<void> addToDashboardCollection(Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  @override
  Future<int> getDayInHospital({String hn, DateTime dateToCompare}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getVitalSignTable(
      {String hn, String dashboardState}) {
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> getAdlTable({@required String hn}) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getDischargedPatient({hn}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAppointments({hn}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteNotifications({@required userId}) {
    throw UnimplementedError();
  }

  @override
  Stream<QuerySnapshot> getUserStream() {
    // TODO: implement getUserStream
    throw UnimplementedError();
  }

  @override
  Future<String> getStateForPatientList({userId, anId}) {
    // TODO: implement getAnSubCollectionSnapshot
    throw UnimplementedError();
  }
}
