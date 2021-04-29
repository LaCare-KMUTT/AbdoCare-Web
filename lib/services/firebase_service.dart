import 'package:AbdoCare_Web/models/notification_list/formName_Notification_model.dart';
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
    var firebaseRegisterInstance = Firebase.app("Abdocare-Register-Service");
    var firebaseRegisterApp =
        FirebaseAuth.instanceFor(app: firebaseRegisterInstance);

    var addedUserId = await firebaseRegisterApp
        .createUserWithEmailAndPassword(
            email: data['username'], password: data['uniqueKey'])
        .then((value) => value.user.uid)
        .catchError((onError) {
      print(
          '$onError Failed to createAuthFor User ${data['username']} ${data['uniqueKey']}');
    });
    await firebaseRegisterApp.signOut();
    await _firestore
        .collection('Users')
        .doc(addedUserId)
        .set(data)
        .then((value) =>
            print('Success setting $data for $addedUserId in Users collection'))
        .catchError((onError) {
      print(
          '$onError having error in setting $data for $addedUserId in Users collection');
    });

    var setRoleStatus = await _setRoleToUser(
        uid: addedUserId, username: data['username'], role: 'patient');
    setRoleStatus
        ? print('success creating patient')
        : print('failed creating patient');
    return addedUserId;
  }

  Future<void> createMedicalTeam({Map<String, dynamic> data}) async {
    print('create temp user via Firebase Service Mock');

    var firebaseRegisterInstance = Firebase.app("Abdocare-Register-Service");
    var firebaseTempApp =
        FirebaseAuth.instanceFor(app: firebaseRegisterInstance);

    var addedUserId = await firebaseTempApp
        .createUserWithEmailAndPassword(
            email: data['username'], password: data['uniqueKey'])
        .then((value) => value.user.uid)
        .catchError((onError) {
      print(
          '$onError Failed to createAuthFor User ${data['username']} ${data['uniqueKey']}');
    });
    await firebaseTempApp.signOut();

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

  Future<Map<String, dynamic>> getLatestSubCollectionMap({
    @required String collection,
    @required String docId,
    @required String subCollection,
    @required String subCollectionDocId,
  }) {
    var map = _firestore
        .collection(collection)
        .doc(docId)
        .collection(subCollection)
        .orderBy('operationDate', descending: true)
        .limit(1)
        .snapshots()
        .first
        .then((value) => value.docs.first.data());
    return map;
  }

  Future<String> getMedicalTeamSignature() async {
    var medicalTeamUserId = getUserId();
    var signature = await _firestore
        .collection('MedicalTeams')
        .doc(medicalTeamUserId)
        .get()
        .then((value) {
      var name = value.get('name');
      var surname = value.get('surname');
      return "$name $surname";
    }).catchError((onError) {
      print('$onError : Cannot find medical Signature');
    });
    return signature;
  }

  Future<String> getMedicalTeamWard() async {
    var medicalTeamUserId = getUserId();
    var ward = await _firestore
        .collection('MedicalTeams')
        .doc(medicalTeamUserId)
        .get()
        .then((value) {
      var ward = value.get('ward');
      return "$ward";
    }).catchError((onError) {
      print('$onError : Cannot find medical ward');
    });
    return ward;
  }

  Future<String> addDataToFormsCollection(
      {@required Map<String, dynamic> data,
      @required String formName,
      @required String hn,
      String formTime}) async {
    print('hn = $hn');
    var userId = await _firestore
        .collection('Users')
        .where('hn', isEqualTo: hn)
        .get()
        .then((value) => value.docs.first.id)
        .catchError((onError) {
      print('$onError Cannot find user when add Data to forms Collection');
    });
    var anSubCollection = await getLatestAnSubCollection(docId: userId);

    var patientState = anSubCollection['state'];
    var an = anSubCollection['an'];
    var anSubCollectionDocId = anSubCollection['id'];
    var creator = await getMedicalTeamSignature();
    var creation = _calculationService.formatDate(date: DateTime.now());
    Map<String, dynamic> dataToAdd = {
      'an': an,
      'hn': hn,
      'creation': creation,
      'formName': formName,
      'creator': creator,
      'patientState': patientState,
      'formData': data,
    };
    if (formTime != null) {
      dataToAdd.addAll({'formTime': formTime});
    }

    print('Here is data to add $dataToAdd');
    var forms = await this
        .addDocumentToCollection(collection: 'Forms', docData: dataToAdd);

    print('\n\n When Adding userId =  $userId');
    var formId = forms.id;
    await _firestore
        .collection('Users')
        .doc(userId)
        .collection('an')
        .doc(anSubCollectionDocId)
        .set({
          'forms': FieldValue.arrayUnion([
            {
              'formId': formId,
              'formName': formName,
              'formCreation': creation,
            }
          ]),
        }, SetOptions(merge: true))
        .then(
            (value) => print('success adding forms things to an subCollection'))
        .catchError((onError) {
          print('$onError on adding forms things to an subCollection');
        });
    return formId;
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
    var anSubCollection = await _firestore
        .collection('Users')
        .doc(userId)
        .collection('an')
        .orderBy('operationDate', descending: true)
        .where('state', isEqualTo: patientState)
        .get()
        .catchError((onError) {
      print('$onError Error in getFOrmListInAnBasedOnState!');
    });
    List userForm;
    try {
      userForm = anSubCollection.docs.first.get('forms');
    } catch (error) {
      userForm = null;
    }

    List list = [];
    if (userForm != null) {
      userForm.forEach((form) {
        if (form['formName'] == formName) {
          list.add(form);
        } else {
          print('$userId does not have $formName');
        }
      });
    } else {
      print('userForm = null');
    }
    return list;
  }

  Future<List<Map<String, dynamic>>> getPostHosList() async {
    var userList = await this.getUserList();
    var returnList = userList.map((user) async {
      var userCollection =
          await this.searchDocumentByDocId(collection: 'Users', docId: user.id);
      var hnToMap = userCollection.data()['hn'] ?? '-';
      var nameToMap =
          '${userCollection.data()['name']} ${userCollection.data()['surname']}';
      var genderToMap = userCollection.data()['gender'] ?? '-';
      var ageToMap = _calculationService.calculateAge(
              birthDate: userCollection.data()['dob'].toDate()) ??
          '-';

      var anSubCollection = await _firestore
          .collection('Users')
          .doc(user.id)
          .collection('an')
          .orderBy('operationDate', descending: true)
          .limit(1)
          .get()
          .then((value) => value.docs.first.data())
          .catchError((onError) {
        print('$onError no anSubCollection on ${user.id}');
      });
      if (anSubCollection['state'] != 'Post-Operation@Hospital') {
        return null;
      }

      var roomNumberToMap = anSubCollection['roomNumber'] ?? '-';
      var bedNumberToMap = anSubCollection['bedNumber'] ?? '-';
      var temperatureToMap;
      var respirationRateToMap;
      var pulseRateToMap;
      var bloodPressure;
      var oxygenRateToMap;
      var status;
      var formVitalSign = await getFormListInAnBasedOnState(
          userId: user.id,
          patientState: 'Post-Operation@Hospital',
          formName: 'Vital Sign');
      if (formVitalSign.isNotEmpty) {
        print('should be here');
        var formsCollection = await _firestore
            .collection('Forms')
            .doc(formVitalSign.last['formId'])
            .get()
            .then((value) => value.data())
            .catchError((onError) {
          print('$onError no formsCollection on ${user.id}');
        });
        temperatureToMap = formsCollection['formData']['temperature'] ?? '-';
        respirationRateToMap =
            formsCollection['formData']['respirationRate'] ?? '-';
        pulseRateToMap = formsCollection['formData']['pulseRate'] ?? '-';
        bloodPressure = formsCollection['formData']['bloodPressure'] ?? '-';
        oxygenRateToMap = formsCollection['formData']['oxygen'] ?? '-';
        status = formsCollection['formData']['status'] ?? '-';
      }

      var map = {
        'hn': hnToMap,
        'name': nameToMap,
        'gender': genderToMap,
        'age': ageToMap,
        'roomNumber': roomNumberToMap ?? '-',
        'bedNumber': bedNumberToMap ?? '-',
        'temperature': temperatureToMap ?? '-',
        'respirationRate': respirationRateToMap ?? '-',
        'pulseRate': pulseRateToMap ?? '-',
        'bloodPressure': bloodPressure ?? '-',
        'oxygenRate': oxygenRateToMap ?? '-',
        'status': status ?? '-',
      };
      return map;
    });
    var futureList = Future.wait(returnList);
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
      var anSubCollection = await _firestore
          .collection('Users')
          .doc(user.id)
          .collection('an')
          .orderBy('operationDate', descending: true)
          .limit(1)
          .get()
          .then((value) => value.docs.first.data());
      if (anSubCollection['state'] != 'Post-Operation@Home') {
        return null;
      }
      var userCollection =
          await this.searchDocumentByDocId(collection: 'Users', docId: user.id);
      var countAnSubCollection = await getCountANSubCollection(userId: user.id);

      var hnToMap = userCollection.data()['hn'] ?? '-';
      var nameToMap =
          '${userCollection.data()['name']} ${userCollection.data()['surname']}';
      var admissionCountToMap = countAnSubCollection ?? '-';
      var genderToMap = userCollection.data()['gender'] ?? '-';
      var ageToMap = _calculationService.calculateAge(
          birthDate: userCollection.data()['dob'].toDate());
      var operationTypeToMap = anSubCollection['operationMethod'] ?? '-';
      var painScoreToMap;
      var woundImgToMap;
      if (formPain != null && formPain.isNotEmpty) {
        var formPainData = await _firestore
            .collection('Forms')
            .doc(formPain.last['formId'])
            .get()
            .then((value) => value.data());

        painScoreToMap = formPainData['formData']['pain'] ?? '-';
      }
      if (formSurgicalIncision != null && formSurgicalIncision.isNotEmpty) {
        var formSurgicalIncisionData = await _firestore
            .collection('Forms')
            .doc(formSurgicalIncision.first['formId'])
            .get()
            .then((value) => value.data());
        woundImgToMap = formSurgicalIncisionData['imgURL'] ?? '-';
      }
      var map = {
        'hn': hnToMap,
        'name': nameToMap,
        'admissionCount': admissionCountToMap,
        'gender': genderToMap,
        'age': ageToMap,
        'painScore': painScoreToMap ?? '-',
        'operationType': operationTypeToMap ?? '-',
        'woundImg': woundImgToMap ?? '-',
      };
      return map;
    });
    var futureList = Future.wait(mapResult);
    var returnValue = await futureList;
    if (returnValue != null) {
      returnValue.removeWhere((element) => element == null);
    }
    return returnValue;
  }

  Future<List<Map<String, dynamic>>> getPreOpList() async {
    var userList = await this.getUserList();
    var returnList = userList.map((user) async {
      var userCollection =
          await this.searchDocumentByDocId(collection: 'Users', docId: user.id);
      var hnToMap = userCollection.data()['hn'] ?? '-';
      var nameToMap =
          '${userCollection.data()['name']} ${userCollection.data()['surname']}';
      var genderToMap = userCollection.data()['gender'] ?? '-';
      var ageToMap = _calculationService.calculateAge(
              birthDate: userCollection.data()['dob'].toDate()) ??
          '-';

      var anSubCollection = await _firestore
          .collection('Users')
          .doc(user.id)
          .collection('an')
          .orderBy('operationDate', descending: true)
          .limit(1)
          .get()
          .then((value) => value.docs.first.data())
          .catchError((onError) {
        print('$onError no anSubCollection on ${user.id}');
      });
      if (anSubCollection['state'] != 'Pre-Operation') {
        return null;
      }
      var roomNumberToMap = anSubCollection['roomNumber'] ?? '-';
      var bedNumberToMap = anSubCollection['bedNumber'] ?? '-';
      var temperatureToMap;
      var respirationRateToMap;
      var pulseRateToMap;
      var bloodPressure;
      var oxygenRateToMap;
      var status;
      var formVitalSign = await getFormListInAnBasedOnState(
          userId: user.id,
          patientState: 'Pre-Operation',
          formName: 'Vital Sign');
      if (formVitalSign.isNotEmpty) {
        print('should be here');
        var formsCollection = await _firestore
            .collection('Forms')
            .doc(formVitalSign.last['formId'])
            .get()
            .then((value) => value.data())
            .catchError((onError) {
          print('$onError no formsCollection on ${user.id}');
        });
        print('formCollection = $formsCollection');
        temperatureToMap = formsCollection['formData']['temperature'] ?? '-';
        respirationRateToMap =
            formsCollection['formData']['respirationRate'] ?? '-';
        pulseRateToMap = formsCollection['formData']['pulseRate'] ?? '-';
        bloodPressure = formsCollection['formData']['bloodPressure'] ?? '-';
        oxygenRateToMap = formsCollection['formData']['oxygen'] ?? '-';
        status = formsCollection['formData']['status'] ?? '-';
      }
      var map = {
        'hn': hnToMap,
        'name': nameToMap,
        'gender': genderToMap,
        'age': ageToMap,
        'roomNumber': roomNumberToMap ?? '-',
        'bedNumber': bedNumberToMap ?? '-',
        'temperature': temperatureToMap ?? '-',
        'respirationRate': respirationRateToMap ?? '-',
        'pulseRate': pulseRateToMap ?? '-',
        'bloodPressure': bloodPressure ?? '-',
        'oxygenRate': oxygenRateToMap ?? '-',
        'status': status ?? '-',
      };
      print('MAP in pre-op list $map');
      return map;
    });
    var futureList = Future.wait(returnList);
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

  Future<Map<String, dynamic>> getCollectionMap(
      {@required String collection, @required String docId}) async {
    var result = await _firestore
        .collection('collection')
        .doc(docId)
        .get()
        .then((value) => value.data());
    return result;
  }

  Future<int> getDayInCurrentState({@required String hn}) async {
    print('hn = $hn');
    var userId = await _firestore
        .collection('Users')
        .where('hn', isEqualTo: hn)
        .get()
        .then((value) => value.docs.first.id)
        .catchError((onError) {
      print('$onError Cannot find user');
    });
    var anSubCollection = await getLatestAnSubCollection(docId: userId);
    var latestStateChange = anSubCollection['latestStateChange'];
    var _getlastestStateChange = latestStateChange.toDate();
    var dayInCurrentState = _calculationService.calculateDayDifference(
        day: _getlastestStateChange,
        compareTo: _calculationService.formatDate(date: DateTime.now()));
    return dayInCurrentState;
  }

  Future<void> addNotification(
      {@required String hn,
      @required String formId,
      @required String formName}) async {
    var creation = _calculationService.formatDate(date: DateTime.now());

    var userId = await _firestore
        .collection('Users')
        .where('hn', isEqualTo: hn)
        .get()
        .then((value) => value.docs.first.id)
        .catchError((onError) {
      print('$onError Cannot find user');
    });
    var anSubCollection = await getLatestAnSubCollection(docId: userId);
    var patientState = anSubCollection['state'];
    Map<String, dynamic> dataToAdd = {
      'formName': formName,
      'formId': formId,
      'userId': userId,
      'creation': creation,
      'patientState': patientState,
      'seen': false,
    };
    await _firestore
        .collection('Notifications')
        .add(dataToAdd)
        .then((value) =>
            print('Successfully added $value to Notificaitons Collection'))
        .catchError((e) {
      print('$e failed to add notification to Notifications Collection');
    });
  }

  Future<String> getPatientState({@required String hn}) async {
    print('hn = $hn');
    var userId = await _firestore
        .collection('Users')
        .where('hn', isEqualTo: hn)
        .get()
        .then((value) => value.docs.first.id)
        .catchError((onError) {
      print('$onError Cannot find user');
    });
    var anSubCollection = await getLatestAnSubCollection(docId: userId);
    var patientState = anSubCollection['state'];
    return anSubCollection['state'];
  }

  Future<List<QueryDocumentSnapshot>> getNotificationList(
      String patientState) async {
    var data;
    if (patientState == 'AllState') {
      data = await _firestore.collection('Notifications').get();
    } else {
      data = await _firestore
          .collection('Notifications')
          .where('patientState', isEqualTo: patientState)
          .get();
    }
    return data.docs;
  }

  Future<List<Map<String, dynamic>>> getPreOpNotificationList() async {
    var notiList = await this.getNotificationList("Pre-Operation");
    var returnList = notiList.map((user) async {
      var notiCollection = await this
          .searchDocumentByDocId(collection: 'Notifications', docId: user.id);
      var docId = notiCollection['userId'];
      var seen = notiCollection['seen'];
      if (seen == false) {
        seen = "ยังไม่ได้ดำเนินการ";
      } else {
        seen = "ดำเนินการแล้ว";
      }
      var formName = notiCollection['formName'];
      formName = "ไม่ผ่าน" + formNameModel[formName];
      var time = notiCollection['creation'];
      var formTime =
          DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
      var formDateToShow = DateFormat('dd/MM/yyyy').format(formTime);
      var formTimeToShow = DateFormat.Hm().format(formTime).toString() + " น.";
      var userCollection =
          await this.searchDocumentByDocId(collection: 'Users', docId: docId);
      var hnToMap = userCollection.data()['hn'] ?? '-';
      var nameToMap =
          '${userCollection.data()['name']} ${userCollection.data()['surname']}';
      var anSubCollection = await _firestore
          .collection('Users')
          .doc(docId)
          .collection('an')
          .orderBy('operationDate', descending: true)
          .limit(1)
          .get()
          .then((value) => value.docs.first.data())
          .catchError((onError) {
        print('$onError no anSubCollection on ${user.id}');
      });
      if (anSubCollection['state'] != 'Pre-Operation') {
        return null;
      }
      var roomNumberToMap = anSubCollection['roomNumber'] ?? '-';
      var bedNumberToMap = anSubCollection['bedNumber'] ?? '-';
      var map = {
        'hn': hnToMap ?? '-',
        'name': nameToMap ?? '-',
        'roomNumber': roomNumberToMap ?? '-',
        'bedNumber': bedNumberToMap ?? '-',
        'formName': formName ?? '-',
        'formTime': formTimeToShow ?? '-',
        'formDate': formDateToShow ?? '-',
        'formDateTimeSort': formTime ?? '-',
        'seen': seen ?? '-',
        'notiId': user.id ?? '-'
      };
      return map;
    });
    var futureList = Future.wait(returnList);
    var returnValue = await futureList;
    if (returnValue != null) {
      returnValue.removeWhere((element) => element == null);
    }
    return returnValue;
  }

  Future<List<Map<String, dynamic>>> getPostHosNotificationList() async {
    var notiList = await this.getNotificationList("Post-Operation@Hospital");
    var returnList = notiList.map((user) async {
      var notiCollection = await this
          .searchDocumentByDocId(collection: 'Notifications', docId: user.id);
      var docId = notiCollection['userId'];
      var seen = notiCollection['seen'];
      if (seen == false) {
        seen = "ยังไม่ได้ดำเนินการ";
      } else {
        seen = "ดำเนินการแล้ว";
      }
      var formName = notiCollection['formName'];
      formName = "ไม่ผ่าน" + formNameModel[formName];
      var time = notiCollection['creation'];
      var formTime =
          DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
      var formDateToShow = DateFormat('dd/MM/yyyy').format(formTime);
      var formTimeToShow = DateFormat.Hm().format(formTime).toString() + " น.";
      var userCollection =
          await this.searchDocumentByDocId(collection: 'Users', docId: docId);
      var hnToMap = userCollection.data()['hn'] ?? '-';
      var nameToMap =
          '${userCollection.data()['name']} ${userCollection.data()['surname']}';
      var anSubCollection = await _firestore
          .collection('Users')
          .doc(docId)
          .collection('an')
          .orderBy('operationDate', descending: true)
          .limit(1)
          .get()
          .then((value) => value.docs.first.data())
          .catchError((onError) {
        print('$onError no anSubCollection on ${user.id}');
      });
      if (anSubCollection['state'] != 'Post-Operation@Hospital') {
        return null;
      }
      var roomNumberToMap = anSubCollection['roomNumber'] ?? '-';
      var bedNumberToMap = anSubCollection['bedNumber'] ?? '-';
      var map = {
        'hn': hnToMap ?? '-',
        'name': nameToMap ?? '-',
        'roomNumber': roomNumberToMap ?? '-',
        'bedNumber': bedNumberToMap ?? '-',
        'formName': formName ?? '-',
        'formTime': formTimeToShow ?? '-',
        'formDate': formDateToShow ?? '-',
        'formDateTimeSort': formTime ?? '-',
        'seen': seen ?? '-',
        'notiId': user.id ?? '-'
      };
      return map;
    });
    var futureList = Future.wait(returnList);
    var returnValue = await futureList;
    if (returnValue != null) {
      returnValue.removeWhere((element) => element == null);
    }
    return returnValue;
  }

  Future<List<Map<String, dynamic>>> getPostHomeNotificationList() async {
    var notiList = await this.getNotificationList("Post-Operation@Home");
    var returnList = notiList.map((user) async {
      var notiCollection = await this
          .searchDocumentByDocId(collection: 'Notifications', docId: user.id);
      var docId = notiCollection['userId'];
      var imgURL = notiCollection['imgURL'];
      var seen = notiCollection['seen'];
      if (seen == false) {
        seen = "ยังไม่ได้ดำเนินการ";
      } else {
        seen = "ดำเนินการแล้ว";
      }
      var formName = notiCollection['formName'];
      formName = "ไม่ผ่าน" + formNameModel[formName];
      var time = notiCollection['creation'];
      var formTime =
          DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
      var formDateToShow = DateFormat('dd/MM/yyyy').format(formTime);
      var formTimeToShow = DateFormat.Hm().format(formTime).toString() + " น.";
      var userCollection =
          await this.searchDocumentByDocId(collection: 'Users', docId: docId);
      var hnToMap = userCollection.data()['hn'] ?? '-';
      var nameToMap =
          '${userCollection.data()['name']} ${userCollection.data()['surname']}';
      var anSubCollection = await _firestore
          .collection('Users')
          .doc(docId)
          .collection('an')
          .orderBy('operationDate', descending: true)
          .limit(1)
          .get()
          .then((value) => value.docs.first.data())
          .catchError((onError) {
        print('$onError no anSubCollection on ${user.id}');
      });
      if (anSubCollection['state'] != 'Post-Operation@Home') {
        return null;
      }
      var map = {
        'hn': hnToMap ?? '-',
        'name': nameToMap ?? '-',
        'formName': formName ?? '-',
        'formTime': formTimeToShow ?? '-',
        'formDate': formDateToShow ?? '-',
        'formDateTimeSort': formTime ?? '-',
        'seen': seen ?? '-',
        'notiId': user.id ?? '-',
        'imgURL': imgURL ?? '-'
      };
      return map;
    });
    var futureList = Future.wait(returnList);
    var returnValue = await futureList;
    if (returnValue != null) {
      returnValue.removeWhere((element) => element == null);
    }
    return returnValue;
  }

  Future<List<Map<String, dynamic>>> getAllNotificationList() async {
    var notiList = await this.getNotificationList("AllState");
    var returnList = notiList.map((user) async {
      var notiCollection = await this
          .searchDocumentByDocId(collection: 'Notifications', docId: user.id);
      var docId = notiCollection['userId'];
      var seen = notiCollection['seen'];
      if (seen == false) {
        seen = "ยังไม่ได้ดำเนินการ";
      } else {
        seen = "ดำเนินการแล้ว";
      }
      var formName = notiCollection['formName'];
      formName = "ไม่ผ่าน" + formNameModel[formName];
      var time = notiCollection['creation'];
      var formTime =
          DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
      var formDateToShow = DateFormat('dd/MM/yyyy').format(formTime);
      var formTimeToShow = DateFormat.Hm().format(formTime).toString() + " น.";
      var userCollection =
          await this.searchDocumentByDocId(collection: 'Users', docId: docId);
      var hnToMap = userCollection.data()['hn'] ?? '-';
      var nameToMap =
          '${userCollection.data()['name']} ${userCollection.data()['surname']}';
      var anSubCollection = await _firestore
          .collection('Users')
          .doc(docId)
          .collection('an')
          .orderBy('operationDate', descending: true)
          .limit(1)
          .get()
          .then((value) => value.docs.first.data())
          .catchError((onError) {
        print('$onError no anSubCollection on ${user.id}');
      });
      var roomNumberToMap = anSubCollection['roomNumber'] ?? '-';
      var bedNumberToMap = anSubCollection['bedNumber'] ?? '-';
      var patientStateToMap = anSubCollection['state'] ?? '-';
      var map = {
        'hn': hnToMap ?? '-',
        'name': nameToMap ?? '-',
        'roomNumber': roomNumberToMap ?? '-',
        'bedNumber': bedNumberToMap ?? '-',
        'patientState': patientStateToMap ?? '-',
        'formName': formName ?? '-',
        'formTime': formTimeToShow ?? '-',
        'formDateTimeSort': formTime ?? '-',
        'formDate': formDateToShow ?? '-',
        'seen': seen ?? '-',
        'notiId': user.id ?? '-',
        'imgURL': '-'
      };
      if (patientStateToMap == "Post-Operation@Home") {
        var imgURL = notiCollection['imgURL'] ?? '-';
        map.addAll({'imgURL': imgURL ?? '-'});
      }
      return map;
    });
    var futureList = Future.wait(returnList);
    var returnValue = await futureList;
    if (returnValue != null) {
      returnValue.removeWhere((element) => element == null);
    }
    return returnValue;
  }
}
