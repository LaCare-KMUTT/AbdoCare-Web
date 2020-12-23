import 'package:flutter/material.dart';

abstract class IFirebaseService {
  Future<void> writeDataToFirestoreWithProvidedDoc({
    @required String collection,
    @required String docId,
    @required Map<String, dynamic> data,
  });
  Future<void> createPatient({
    @required String collection,
    @required String docId,
    @required Map<String, dynamic> data,
  });
  String getUserId();
}
