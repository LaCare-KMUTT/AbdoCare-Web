import 'package:flutter/material.dart';
import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';

class RecoveryReadinessFormViewModel {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  Future<void> saveRecoveryReadinessToDatabase(
      {@required String hn,
      @required Map<String, dynamic> recoveryReadinessData}) async {
    var userCollection = await _firebaseService
        .searchDocumentByField(collection: 'Users', field: 'hn', fieldValue: hn)
        .then((value) {
      return {
        ...value.docs.first.data(),
        'id': value.docs.first.id,
      };
    });
    var anSubCollection = await _firebaseService.getLatestAnSubCollection(
        docId: userCollection['id']);
    await _firebaseService.updateFieldToSubCollection(
        collection: 'Users',
        docId: userCollection['id'],
        subCollection: 'an',
        subCollectionDoc: anSubCollection['id'],
        data: recoveryReadinessData);
  }
}
