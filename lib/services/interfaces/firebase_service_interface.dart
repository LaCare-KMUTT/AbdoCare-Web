import 'package:flutter/material.dart';

abstract class IFirebaseService {
  Future<void> setDataToCollectionWithSpecificDoc({
    @required String collection,
    @required String docId,
    @required Map<String, dynamic> data,
  });

  Future<void> createPatient({
    @required String collection,
    String docId,
    @required Map<String, dynamic> data,
  });

  String getUserId();

  Future<bool> addDocumentToCollection({
    @required String collection,
    @required Map<String, dynamic> docData,
  });
}
