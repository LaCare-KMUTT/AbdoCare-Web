import 'package:AbdoCare_Web/models/notification_list/formName_Notification_model.dart';
import 'package:AbdoCare_Web/services/cloud_function_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final CloudFunctionService _cloudFunctionService =
      locator<CloudFunctionService>();

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
    var addedUserId = await _cloudFunctionService.createUser(
        email: data['username'], password: data['uniqueKey']);
    if (addedUserId != '0') {
      await _firestore
          .collection('Users')
          .doc(addedUserId)
          .set(data)
          .then((value) => print(
              'Success setting $data for $addedUserId in Users collection'))
          .catchError((onError) {
        print(
            '$onError having error in setting $data for $addedUserId in Users collection');
      });

      var setRoleStatus = await _setRoleToUser(
          uid: addedUserId, username: data['username'], role: 'patient');
      setRoleStatus
          ? print('success creating patient')
          : print('failed creating patient');
    }

    return addedUserId;
  }

  Future<void> createMedicalTeam({@required Map<String, dynamic> data}) async {
    var addedUserId = await _cloudFunctionService.createUser(
        email: data['username'], password: data['password']);
    if (addedUserId != '0') {
      await _firestore
          .collection('MedicalTeams')
          .doc(addedUserId)
          .set(data)
          .then((value) {
        print(
            'Success setting $data for $addedUserId in Medical Team collection');
      }).catchError((onError) {
        print(
            '$onError having error in setting $data for $addedUserId in Medical Team collection');
      });
      var setRoleStatus = await _setRoleToUser(
          uid: addedUserId, username: data['username'], role: data['role']);
      setRoleStatus
          ? print('Success set role to ${data['username']} as medical team')
          : print('failed setting role to ${data['username']} as medical team');
    }
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

  Future<String> getMedicalTeamRole() async {
    var medicalTeamUserId = getUserId();
    var role = await _firestore
        .collection('MedicalTeams')
        .doc(medicalTeamUserId)
        .get()
        .then((value) {
      var role = value.get('role');
      return "$role";
    }).catchError((onError) {
      print('$onError : Cannot find medical role');
    });
    return role;
  }

  Future<String> addDataToFormsCollection(
      {@required Map<String, dynamic> data,
      @required String formName,
      @required String hn,
      String formTime}) async {
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

    var forms = await this
        .addDocumentToCollection(collection: 'Forms', docData: dataToAdd);

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
        } else {}
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
            .doc(formSurgicalIncision.last['formId'])
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
    var email = '$username@abdocare.com';
    var loginResult = await _auth
        .signInWithEmailAndPassword(email: email, password: password)
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
      'patientSeen': false
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
    var userId = await _firestore
        .collection('Users')
        .where('hn', isEqualTo: hn)
        .get()
        .then((value) => value.docs.first.id)
        .catchError((onError) {
      print('$onError Cannot find user');
    });
    var anSubCollection = await getLatestAnSubCollection(docId: userId);
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

  Future<Map<String, dynamic>> getPatientDetail({@required String hn}) async {
    var usersCollection = await _firestore
        .collection('Users')
        .where('hn', isEqualTo: hn)
        .get()
        .then((value) {
      var map = value.docs.first.data();
      map['id'] = value.docs.first.id;
      return map;
    });
    var anlength = usersCollection['an'].length - 1;
    String an = usersCollection['an'][anlength]['an'];
    var anSubCollection = await _firestore
        .collection('Users')
        .doc(usersCollection['id'])
        .collection('an')
        .doc(an)
        .get()
        .then((value) => value.data())
        .catchError((onError) {
      print('$onError');
    });

    var generalForm = await getFormListInAnBasedOnState(
        userId: usersCollection['id'],
        patientState: anSubCollection['state'],
        formName: 'General');
    var generalFormData = Map();
    if (generalForm.isNotEmpty) {
      await _firestore
          .collection('Forms')
          .doc(generalForm.last['formId'])
          .get()
          .then((value) {
        generalFormData.addAll(value.data());
      }).catchError((onError) {
        print('$onError Cann\'t find General Form on ${usersCollection['hn']}');
      });
    }
    DateFormat dateFormatter = DateFormat('dd-MM-yyyy');
    var age = _calculationService
        .calculateAge(birthDate: usersCollection['dob'].toDate())
        .toString();
    var dob = dateFormatter.format(usersCollection['dob'].toDate());
    var bwl = _calculationService.calculateBML(
        oldWeight: anSubCollection['oldWeight'],
        weight: anSubCollection['weight']);
    var operationDate =
        dateFormatter.format(anSubCollection['operationDate'].toDate());

    var map = {
      'fullName': '${usersCollection['name']} ${usersCollection['surname']}',
      'gender': usersCollection['gender'] ??= '-',
      'age': age,
      'dob': dob,
      'patientTel': usersCollection['patientTel'] ??= '-',
      'address': usersCollection['address'] ??= '-',
      'height': anSubCollection['height'] != null
          ? anSubCollection['height'].toString()
          : '-',
      'weight': anSubCollection['oldWeight'] != null
          ? anSubCollection['oldWeight'].toString()
          : '-',
      'bwl': bwl,
      'careTakerName':
          '${anSubCollection['careTakerName'] ?? '-'} ${anSubCollection['careTakerSurname'] ?? '-'}',
      'careTakerTel': anSubCollection['careTakerTel'] ??= '-',
      'patientState': anSubCollection['state'] ??= '-',
      'HN': usersCollection['hn'] ??= '-',
      'AN': anSubCollection['an'] ??= '-',
      'operationDate': operationDate ??= '-',
      'operationName': anSubCollection['operationName'] ??= '-',
      'operationMethod': anSubCollection['operationMethod'] ??= '-',
      'bedNumber': anSubCollection['bedNumber'] ??= '-',
      'roomNumber': anSubCollection['roomNumber'] ??= '-',
      'asaClass': generalFormData.length != 0
          ? generalFormData['formData']['asaClass']
          : '-',
      'previousIllness': generalFormData.length != 0
          ? generalFormData['formData']['previousIllness']
          : '-',
      'recoveryReadiness': anSubCollection['recoveryReadiness'] ??= '-',
    };
    return map;
  }

  Future<List<Map<String, dynamic>>> getNotification(
      {@required String patientState}) async {
    var notiList = await this.getNotificationList(patientState);
    var returnList = notiList.map((user) async {
      var notiCollection = await this
          .searchDocumentByDocId(collection: 'Notifications', docId: user.id);
      var docId = notiCollection['userId'];
      var patientStateToMap = notiCollection['patientState'];
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
        'seen': seen ?? 'ยังไม่ได้ดำเนินการ',
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

  Future<int> getNoticounter() async {
    int count = 0;
    var notiList = await this.getNotificationList("AllState");
    if (notiList.isNotEmpty) {
      var returnList = notiList.map((user) async {
        var notiCollection = await this
            .searchDocumentByDocId(collection: 'Notifications', docId: user.id);
        var seen = notiCollection['seen'];
        if (seen == false) {
          seen = "ยังไม่ได้ดำเนินการ";
          count = count + 1;
        }
        return count;
      });
      var futureList = Future.wait(returnList);
      var returnValue = await futureList;
      count = returnValue.last;
    } else {
      count = 0;
    }
    return count;
  }

  Future<String> getEvaluationStatus(
      {@required String hn,
      @required String formName,
      @required String patientState,
      String vitalSignFormTime}) async {
    var formCreation;
    var evaluationStatus = "notCompleted";
    var formDateToShow;
    var dateCompare;
    var formTime;
    var dateToCompare;
    var userId = await _firestore
        .collection('Users')
        .where('hn', isEqualTo: hn)
        .get()
        .then((value) => value.docs.first.id)
        .catchError((onError) {
      print('$onError Cannot find user');
    });
    if (vitalSignFormTime == null) {
      var formStatus = await getFormListInAnBasedOnState(
          userId: userId, patientState: patientState, formName: formName);
      if (formStatus.isNotEmpty) {
        var formsCollection = await _firestore
            .collection('Forms')
            .doc(formStatus.last['formId'])
            .get()
            .then((value) => value.data())
            .catchError((onError) {
          print('$onError no formsCollection');
        });
        formCreation = formsCollection['creation'] ?? '-';
        formTime = DateTime.fromMicrosecondsSinceEpoch(
            formCreation.microsecondsSinceEpoch);
        formDateToShow = DateFormat('yyyy-MM-dd').format(formTime);
        dateToCompare = _calculationService.formatDate(date: DateTime.now());
        dateCompare = DateFormat('yyyy-MM-dd').format(dateToCompare);
        if (formDateToShow == dateCompare) {
          evaluationStatus = "completed";
        }
      } else {
        evaluationStatus = "notCompleted";
      }
    } else if (vitalSignFormTime != null) {
      var formsCollection = await _firestore
          .collection('Forms')
          .where('formTime', isEqualTo: vitalSignFormTime)
          .where('hn', isEqualTo: hn)
          .where('formName', isEqualTo: formName)
          .get()
          .then((value) => value.docs.first.id)
          .catchError((onError) {});
      if (formsCollection != null) {
        var formsCollection2 = await _firestore
            .collection('Forms')
            .doc(formsCollection)
            .get()
            .then((value) => value.data())
            .catchError((onError) {
          print('$onError no formsCollection');
        });
        formCreation = formsCollection2['creation'] ?? '-';
        formTime = DateTime.fromMicrosecondsSinceEpoch(
            formCreation.microsecondsSinceEpoch);
        formDateToShow = DateFormat('yyyy-MM-dd').format(formTime);
        dateToCompare = _calculationService.formatDate(date: DateTime.now());
        dateCompare = DateFormat('yyyy-MM-dd').format(dateToCompare);
        if (formDateToShow == dateCompare) {
          evaluationStatus = "completed";
        }
      } else {
        evaluationStatus = "notCompleted";
      }
    }
    return evaluationStatus;
  }

  Future<void> addToDashboardCollection(Map<String, dynamic> data) async {
    await _firestore.collection('Dashboards').add(data).then((value) {
      print("Add $data to Dashboard Collection");
    });
  }

  Future<int> getDayInHospital(
      {@required String hn, DateTime dateToCompare}) async {
    if (dateToCompare == null) {
      dateToCompare = _calculationService.formatDate(date: DateTime.now());
    }
    var userCollection =
        await _firestore.collection('Users').where('hn', isEqualTo: hn).get();
    var anSubCollection = await this
        .getLatestAnSubCollection(docId: userCollection.docs.first.id);

    var operationDate = anSubCollection['operationDate'].toDate();
    var dayInHospital = _calculationService.calculateDayDifference(
        day: operationDate, compareTo: dateToCompare);
    print('day in Hospital $dayInHospital');
    return dayInHospital;
  }

  Future<List<Map<String, dynamic>>> getVitalSignTable({
    @required String hn,
  }) async {
    var dashboardsCollection = await _firestore
        .collection('Dashboards')
        .orderBy('date')
        .where('hn', isEqualTo: hn)
        .where('name', isEqualTo: 'dashboardTable')
        .get()
        .then((value) => value.docs)
        .catchError((onError) {
      print('Error in getVitalSignTable = $onError');
    });
    List<Map<String, dynamic>> list = [];
    dashboardsCollection.forEach((element) {
      Map<String, dynamic> data = element.data();
      list.add(data);
    });
    print('list = $list');
    return list;
  }

  Future<Map<dynamic, dynamic>> getFormDataByLastFormId(
      String formName, String patientState, String hn) async {
    var mapData = {};
    var formId = await _firestore
        .collection('Forms')
        .where('hn', isEqualTo: hn)
        .where('formName', isEqualTo: formName)
        .where('patientState', isEqualTo: patientState)
        .get()
        .then((value) => value.docs.first.id)
        .catchError((onError) {});

    if (formId != null) {
      await _firestore.collection('Forms').doc(formId).get().then((value) {
        mapData.addAll(value.data());
      }).catchError((onError) {
        print('$onError Cann\'t find $formName form');
      });
    }
    return mapData;
  }

  Future<Map<String, dynamic>> getAdlTable({@required String hn}) async {
    var preOpAdlData =
        await getFormDataByLastFormId('ADL', 'Pre-Operation', hn);
    var postHosData =
        await getFormDataByLastFormId('ADL', 'Post-Operation@Hospital', hn);
    var postHomeData =
        await getFormDataByLastFormId('ADL', 'Post-Operation@Home', hn);
    var map = {
      'PreOpGrooming':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Grooming'] : 2,
      'PreOpBathing':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Bathing'] : 2,
      'PreOpFeeding':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Feeding'] : 3,
      'PreOpToilet':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Toilet'] : 3,
      'PreOpDressing':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Dressing'] : 3,
      'PreOpStairs':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Stairs'] : 3,
      'PreOpBowels':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Bowels'] : 3,
      'PreOpBladder':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Bladder'] : 3,
      'PreOpTransfer':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Transfer'] : 4,
      'PreOpMobility':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Mobility'] : 4,
      'PreOpTotal': preOpAdlData.length != 0
          ? preOpAdlData['formData']['TotalScoreADL']
          : 0,
      'PostHosGrooming':
          postHosData.length != 0 ? postHosData['formData']['Grooming'] : 2,
      'PostHosBathing':
          postHosData.length != 0 ? postHosData['formData']['Bathing'] : 2,
      'PostHosFeeding':
          postHosData.length != 0 ? postHosData['formData']['Feeding'] : 3,
      'PostHosToilet':
          postHosData.length != 0 ? postHosData['formData']['Toilet'] : 3,
      'PostHosDressing':
          postHosData.length != 0 ? postHosData['formData']['Dressing'] : 3,
      'PostHosStairs':
          postHosData.length != 0 ? postHosData['formData']['Stairs'] : 3,
      'PostHosBowels':
          postHosData.length != 0 ? postHosData['formData']['Bowels'] : 3,
      'PostHosBladder':
          postHosData.length != 0 ? postHosData['formData']['Bladder'] : 3,
      'PostHosTransfer':
          postHosData.length != 0 ? postHosData['formData']['Transfer'] : 4,
      'PostHosMobility':
          postHosData.length != 0 ? postHosData['formData']['Mobility'] : 4,
      'PostHosTotal': postHosData.length != 0
          ? postHosData['formData']['TotalScoreADL']
          : 0,
      'PostHomeGrooming':
          postHomeData.length != 0 ? postHomeData['formData']['Grooming'] : 2,
      'PostHomeBathing':
          postHomeData.length != 0 ? postHomeData['formData']['Bathing'] : 2,
      'PostHomeFeeding':
          postHomeData.length != 0 ? postHomeData['formData']['Feeding'] : 3,
      'PostHomeToilet':
          postHomeData.length != 0 ? postHomeData['formData']['Toilet'] : 3,
      'PostHomeDressing':
          postHomeData.length != 0 ? postHomeData['formData']['Dressing'] : 3,
      'PostHomeStairs':
          postHomeData.length != 0 ? postHomeData['formData']['Stairs'] : 3,
      'PostHomeBowels':
          postHomeData.length != 0 ? postHomeData['formData']['Bowels'] : 3,
      'PostHomeBladder':
          postHomeData.length != 0 ? postHomeData['formData']['Bladder'] : 3,
      'PostHomeTransfer':
          postHomeData.length != 0 ? postHomeData['formData']['Transfer'] : 4,
      'PostHomeMobility':
          postHomeData.length != 0 ? postHomeData['formData']['Mobility'] : 4,
      'PostHomeTotal': postHomeData.length != 0
          ? postHomeData['formData']['TotalScoreADL']
          : 0,
    };
    return map;
  }

  Future<List<Map<String, dynamic>>> getPainChart({@required hn}) async {
    var a = await _firestore
        .collection('Forms')
        .where('hn', isEqualTo: hn)
        .where('formName', isEqualTo: 'pain')
        .orderBy('creation')
        .get();
    List<Map<String, dynamic>> list = [];
    a.docs.forEach((data) {
      var map = data.data();
      list.add(map);
    });
    print('list = $list');
    return list;
  }
}
