import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract class IFirebaseService {
  Future<void> setDataToCollectionWithSpecificDoc({
    @required String collection,
    @required String docId,
    @required Map<String, dynamic> data,
  });

  Future<String> createPatient({
    @required String collection,
    String docId,
    @required Map<String, dynamic> data,
  });

  String getUserId();

  Future<bool> addDocumentToCollection({
    @required String collection,
    @required Map<String, dynamic> docData,
  });

  Future<QuerySnapshot> searchDocumentByField({
    @required String collection,
    @required String field,
    @required dynamic fieldValue,
  });

  Future<DocumentSnapshot> searchDocumentByDocId(
      {@required String collection, @required docId});

  Future<void> addSubCollection({
    @required String collection,
    @required String docId,
    @required String subCollection,
    @required Map<String, dynamic> data,
  });
}
