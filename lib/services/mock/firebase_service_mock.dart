import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/mock/mock_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
  Future<void> createPatient(
      {String collection, String docId, Map<String, dynamic> data}) async {
    print('create Temp User Throught Firebase Service Mock');
    print(data);
    print(data['username']);
    print(data['dob']);
    var tempApp = await _createTempApp();
    var tempAuthResult = await _createTempAuthWithProvidedTempApp(
        tempApp, data['username'], data['password']);
    _firestore.collection('Users').doc(tempAuthResult.user.uid).set(data);
    _deleteTempApp(tempApp);
    print('Success writing mock data');
  }

  @override
  String getUserId() {
    // TODO: implement getUserId
    throw UnimplementedError();
  }

  @override
  Future<void> writeDataToFirestoreWithProvidedDoc(
      {String collection, String docId, Map<String, dynamic> data}) {
    // TODO: implement writeDataToFirestoreWithProvidedDoc
    throw UnimplementedError();
  }
}
