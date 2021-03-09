import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'interfaces/calculation_service_interface.dart';
import 'interfaces/firebase_service_interface.dart';
import 'service_locator.dart';

class FirebaseService extends IFirebaseService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final ICalculationService _calculationService =
      locator<ICalculationService>();

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

  Future<String> createPatient({
    @required String collection,
    String docId,
    @required Map<String, dynamic> data,
  }) async {
    print('createUser using CreatePatient FirebaseInterface');
    var tempApp = await _createTempApp();
    var tempAuthResult = await _createTempAuthWithProvidedTempApp(
        tempApp, data['username'], data['uniqueKey']);
    var addedUserId = tempAuthResult.user.uid;
    _firestore
        .collection('Users')
        .doc(addedUserId)
        .set(data)
        .then((value) =>
            print('Success setting $data for $addedUserId in Users collection'))
        .catchError((onError) {
      print(
          '$onError having error in setting $data for $addedUserId in Users collection');
    });
    _deleteTempApp(tempApp);
    var setRoleStatus = await _setRoleToUser(
        uid: addedUserId, username: data['username'], role: 'patient');
    setRoleStatus
        ? print('success creating patient')
        : print('failed creating patient');
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

  Future<DocumentReference> addDocumentToCollection({
    @required String collection,
    @required Map<String, dynamic> docData,
  }) async {
    var doc = await _firestore.collection(collection).add(docData).then((doc) {
      print('Success add $docData to $collection collection');
      return doc;
    }).catchError((onError) {
      print('$onError Failed to add $docData to $collection collection');
      return null;
    });
    return doc;
  }

  String getUserId() => _auth.currentUser.uid;

  Future<QuerySnapshot> searchDocumentByField({
    @required String collection,
    @required String field,
    @required dynamic fieldValue,
  }) async {
    var doc = await _firestore
        .collection(collection)
        .where(field, isEqualTo: fieldValue)
        .get();
    return doc;
  }

  Future<DocumentSnapshot> searchDocumentByDocId(
      {@required String collection, @required docId}) async {
    return await _firestore.collection(collection).doc(docId).get();
  }

  Future<Map<String, dynamic>> getLatestSubCollectionSnapshot({
    @required String collection,
    @required String docId,
    @required String subCollection,
    @required String subCollectionDocId,
  }) {
    var snapshot = _firestore
        .collection(collection)
        .doc(docId)
        .collection(subCollection)
        .orderBy('operationDate', descending: true)
        .limit(1)
        .snapshots()
        .first
        .then((value) => value.docs.first.data());
    return snapshot;
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
            subCollection: FieldValue.arrayUnion([
              {
                'an': subCollectionDocument.id,
                'creation':
                    _calculationService.formatDate(date: DateTime.now()),
              }
            ])
          });
    }).catchError((onError) {
      print(
          'Error $onError adding $data to $subCollection subcollection of $collection which id = $docId');
    });
  }

  Future<List<QueryDocumentSnapshot>> getUserList() async {
    var data = await _firestore.collection('Users').get();
    return data.docs;
  }

  Future<Map<String, dynamic>> getLatestAnSubCollection({
    @required String docId,
  }) async {
    var anSubCollection = await _firestore
        .collection('Users')
        .doc(docId)
        .collection('an')
        .orderBy('operationDate', descending: true)
        .limit(1)
        .get()
        .then((querySnapshot) {
      var data = querySnapshot.docs.first.data();
      var id = querySnapshot.docs.first.id;
      data['id'] = id;
      return data;
    });
    return anSubCollection;
  }

  Future<List> getFormListInAnBasedOnState(
      {@required String userId,
      @required String patientState,
      @required String formName}) async {
    List filteredUserList = await _firestore
        .collection('Users')
        .doc(userId)
        .collection('an')
        .orderBy('operationDate', descending: true)
        .where('state', isEqualTo: patientState)
        .get()
        .then((value) {
      var user = value.docs.first.data();
      var userForm = user['forms'];
      var formData = userForm.map((elem) {
        if (elem['formName'] == formName) {
          return elem;
        }
      }).toList();
      return formData;
    }).catchError((onError) {
      print('$onError $userId does not have $formName ');
      return null;
    });

    if (filteredUserList != null) {
      filteredUserList.removeWhere((elem) => elem == null);
    }
    return filteredUserList;
  }

  Future<List<Map<String, dynamic>>> getPostHosList() async {
    var userList = await this.getUserList();
    var mapResult = userList.map((user) async {
      var formVitalSign = await getFormListInAnBasedOnState(
          userId: user.id,
          patientState: 'Post-Operation@Hospital',
          formName: 'Vital Sign');
      bool isAbleToMap = formVitalSign != null && formVitalSign.isNotEmpty;
      if (isAbleToMap) {
        var formsCollection = await _firestore
            .collection('Forms')
            .doc(formVitalSign.first['formId'])
            .get()
            .then((value) => value.data());
        var anSubCollection = await _firestore
            .collection('Users')
            .doc(user.id)
            .collection('an')
            .orderBy('operationDate', descending: true)
            .limit(1)
            .get()
            .then((value) => value.docs.first.data());
        var userCollection = await this
            .searchDocumentByDocId(collection: 'Users', docId: user.id);

        var hnToMap = userCollection.data()['hn'];
        var nameToMap =
            '${userCollection.data()['name']} ${userCollection.data()['surname']}';
        var genderToMap = userCollection.data()['gender'];
        var ageToMap = _calculationService.calculateAge(
            birthDate: userCollection.data()['dob'].toDate());
        var roomNumberToMap = anSubCollection['roomNumber'];
        var bedNumberToMap = anSubCollection['bedNumber'];
        var temperatureToMap = formsCollection['formData']['temperature'];
        var respirationRateToMap =
            formsCollection['formData']['respirationRate'];
        var heartRateToMap = formsCollection['formData']['heartRate'];
        var bloodPressureToMap = formsCollection['formData']['bloodPressure'];
        var oxygenRateToMap = formsCollection['formData']['oxygen'];
        var status = formsCollection['formData']['status'];
        var map = {
          'hn': hnToMap,
          'name': nameToMap,
          'gender': genderToMap,
          'age': ageToMap,
          'room_number': roomNumberToMap,
          'bed_number': bedNumberToMap,
          'temperature': temperatureToMap,
          'respiration_rate': respirationRateToMap,
          'heart_rate': heartRateToMap,
          'blood_pressure': bloodPressureToMap,
          'oxygen_rate': oxygenRateToMap,
          'status': status,
        };
        return map;
      } else {
        return null;
      }
    });
    var futureList = Future.wait(mapResult);
    var returnValue = await futureList;
    if (returnValue != null) {
      returnValue.removeWhere((element) => element == null);
    }
    return returnValue;
  }

  Future<List<Map<String, dynamic>>> getPostHomeList() async {
    var userList = await this.getUserList();
    var mapResult = userList.map((user) async {
      var formPain = await getFormListInAnBasedOnState(
          userId: user.id,
          patientState: 'Post-Operation@Home',
          formName: 'pain');
      var formSurgicalIncision = await getFormListInAnBasedOnState(
          userId: user.id,
          patientState: 'Post-Operation@Home',
          formName: 'Surgical Incision');
      bool isAbleToMap = (formPain != null && formPain.isNotEmpty) &&
          (formSurgicalIncision != null && formSurgicalIncision.isNotEmpty);
      // bool isAbleToMap = (formPain != null && formPain.isNotEmpty);
      if (isAbleToMap) {
        //TODO Change formsId => formId after clearing DB
        var formPainData = await _firestore
            .collection('Forms')
            .doc(formPain.first['formId'])
            .get()
            .then((value) => value.data());
        //TODO Use this After has woundImg
        var formSurgicalIncisionData = await _firestore
            .collection('Forms')
            .doc(formSurgicalIncision.first['formId'])
            .get()
            .then((value) => value.data());
        var anSubCollection = await _firestore
            .collection('Users')
            .doc(user.id)
            .collection('an')
            .orderBy('operationDate', descending: true)
            .limit(1)
            .get()
            .then((value) => value.docs.first.data());
        var userCollection = await this
            .searchDocumentByDocId(collection: 'Users', docId: user.id);
        var countAnSubCollection =
            await getCountANSubCollection(userId: user.id);

        var hnToMap = userCollection.data()['hn'];
        var nameToMap =
            '${userCollection.data()['name']} ${userCollection.data()['surname']}';
        var admissionCountToMap = countAnSubCollection;
        var genderToMap = userCollection.data()['gender'];
        var ageToMap = _calculationService.calculateAge(
            birthDate: userCollection.data()['dob'].toDate());
        var painScoreToMap = formPainData['formData']['Answer'];
        var operationTypeToMap = anSubCollection['operationMethod'];
        var woundImgToMap = formSurgicalIncisionData['imgURL'] ?? '-';
        var map = {
          'hn': hnToMap,
          'name': nameToMap,
          'admissionCount': admissionCountToMap,
          'gender': genderToMap,
          'age': ageToMap,
          'painScore': painScoreToMap,
          'operationType': operationTypeToMap,
          'woundImg': woundImgToMap,
        };
        return map;
      } else {
        return null;
      }
    });
    var futureList = Future.wait(mapResult);
    var returnValue = await futureList;
    if (returnValue != null) {
      returnValue.removeWhere((element) => element == null);
    }
    return returnValue;
  }

  Future<List<Map<String, dynamic>>> getPreOpList() async {
    var userList = await getUserList();
    var mapResult = userList.map((user) async {
      var formVitalSign = await getFormListInAnBasedOnState(
          userId: user.id,
          patientState: 'Pre-Operation',
          formName: 'Vital Sign');
      // print('fromVitalsign of ${user.id}, $formVitalSign');
      if (formVitalSign != null) {
        var anSubCollection = await _firestore
            .collection('Users')
            .doc(user.id)
            .collection('an')
            .orderBy('operationDate', descending: true)
            .limit(1)
            .get()
            .then((value) => value.docs.first.data())
            .catchError((onError) {
          print('$onError help me please');
        });
        //TODO Change formsId => formId after clearing DB
        var formsCollection = await _firestore
            .collection('Forms')
            .doc(formVitalSign.first['formId'])
            .get()
            .then((value) => value.data())
            .catchError((onError) {
          print('formCollection $onError');
        });
        var userCollection = await this
            .searchDocumentByDocId(collection: 'Users', docId: user.id);

        bool isAbleToMap = formVitalSign != null && formVitalSign.isNotEmpty;
        if (isAbleToMap) {
          var hnToMap = userCollection.data()['hn'];
          var nameToMap =
              '${userCollection.data()['name']} ${userCollection.data()['surname']}';
          var genderToMap = userCollection.data()['gender'];
          var ageToMap = _calculationService.calculateAge(
              birthDate: userCollection.data()['dob'].toDate());
          var roomNumberToMap = anSubCollection['roomNumber'];
          var bedNumberToMap = anSubCollection['bedNumber'];
          var temperatureToMap = formsCollection['formData']['temperature'];
          var respirationRateToMap =
              formsCollection['formData']['respirationRate'];
          var heartRateToMap = formsCollection['formData']['heartRate'];
          var bloodPressureToMap = formsCollection['formData']['bloodPressure'];
          var oxygenRateToMap = formsCollection['formData']['oxygen'];
          var status = formsCollection['formData']['status'];
          var map = {
            'hn': hnToMap,
            'name': nameToMap,
            'gender': genderToMap,
            'age': ageToMap,
            'roomNumber': roomNumberToMap,
            'bedNumber': bedNumberToMap,
            'temperature': temperatureToMap,
            'respirationRate': respirationRateToMap,
            'heartRate': heartRateToMap,
            'bloodPressure': bloodPressureToMap,
            'oxygenRate': oxygenRateToMap,
            'status': status,
          };
          return map;
        } else {
          return null;
        }
      } else {
        return null;
      }
    });
    var futureList = Future.wait(mapResult);
    var returnValue = await futureList;
    if (returnValue != null) {
      returnValue.removeWhere((element) => element == null);
    }
    return returnValue;
  }

  Future<int> getCountANSubCollection({@required String userId}) async {
    var countAnSubCollection = await _firestore
        .collection('Users')
        .doc(userId)
        .collection('an')
        .orderBy('operationDate', descending: true)
        .limit(1)
        .get()
        .then((value) => value.size);
    return countAnSubCollection;
  }

  Future<bool> signIn(
      {@required String username, @required String password}) async {
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

  Future<void> updateFieldToSubCollection({
    @required String collection,
    @required String docId,
    @required String subCollection,
    @required String subCollectionDoc,
    @required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(collection)
        .doc(docId)
        .collection(subCollection)
        .doc(subCollectionDoc)
        .update(data)
        .then((value) {
      print('success update data $data to collection $collection ');
      print('docId = $docId, $subCollection $subCollectionDoc');
    }).catchError((onError) {
      print(
          '$onError Failed on update $data to $collection $docId $subCollection $subCollectionDoc');
    });
  }

  Future<List<QueryDocumentSnapshot>> getAppointmentList(
      {@required DateTime currentDate}) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedStart = formatter.format(currentDate);
    var startWithOutTime = DateTime.parse(formattedStart);
    var start = _calculationService.formatDate(date: startWithOutTime);
    DateTime end = start.add(Duration(days: 1));
    var data = await _firestore
        .collection('Appointments')
        .where('date', isGreaterThanOrEqualTo: start)
        .where('date', isLessThan: end)
        .get()
        .then((value) {
      return value.docs;
    }).catchError((onError) {
      print('$onError getAppointmentList cannot query on something');
      return null;
    });
    return data;
  }
}
