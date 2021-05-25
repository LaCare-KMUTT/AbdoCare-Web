// import 'dart:async';

// import 'package:AbdoCare_Web/models/user_list/patient_list_model.dart';
// import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
// import 'package:AbdoCare_Web/services/service_locator.dart';

// class PatientListViewModel {
//   PatientListViewModel();
//   final _firebaseService = locator<IFirebaseService>();
//   // StreamController _streamController = StreamController();

//   Stream<PatientListModel> list;
//   Future<List<PatientListModel>> initialize() async {
//     print('patientList View model here');
//     var patientList = _firebaseService.getUserStream();

//     patientList.map((element) async {
//       List<PatientListModel> userList = [];
//       element.docs.forEach((doc) async {
//         var userCollectionData = await doc.data();
//         var anId = userCollectionData['an'];
//         var an = await _firebaseService.getAnSubCollectionSnapshot(
//             userId: doc.id, anId: anId.last['an']);
//         var state = '';

//         an.forEach((anElem) async {
//           state = await anElem.get('state');
//         });

//         Future.delayed(const Duration(milliseconds: 10), () {
//           print(
//               'userCollection Name = ${userCollectionData['name']} ${userCollectionData['surname']} | State = $state');
//           var map = {
//             'hn': userCollectionData['hn'],
//             'an': anId.last['an'],
//             'name': userCollectionData['name'],
//             'surname': userCollectionData['surname'],
//             'state': state,
//           };
//           list.
//         });
//       });
//       return userList;
//     });
//     if (userList.isEmpty) {
//       print('UserList is still empty');
//     }
//     return userList;
//   }

//   Stream<List<PatientListModel>> getUsers()  {
//     print('UserList is empty now');
//     List<PatientListModel> returnList = [];
//     var list =  initialize();
//     // returnList.addAll(list);
//     print('legnth = == ${returnList.length}');
//     return list;
//   }
// }
