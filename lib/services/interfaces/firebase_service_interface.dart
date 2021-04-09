import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract class IFirebaseService {
  Future<void> setDataToCollectionWithSpecificDoc({
    @required String collection,
    @required String docId,
    @required Map<String, dynamic> data,
  });

  Future<void> updateDataToCollectionField(
      {String collection, String docId, Map<String, dynamic> data});

  Future<String> createPatient({
    @required String collection,
    String docId,
    @required Map<String, dynamic> data,
  });

  Future<void> createMedicalTeam({Map<String, dynamic> data});

  String getUserId();

  Future<DocumentReference> addDocumentToCollection({
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
  Future<List<QueryDocumentSnapshot>> getUserList();

  Future<Map<String, dynamic>> getLatestAnSubCollection({
    @required String docId,
  });

  Future<List<Map<String, dynamic>>> getPostHosList();

  Future<List<Map<String, dynamic>>> getPostHomeList();

  Future<List<Map<String, dynamic>>> getPreOpList();

  Future<bool> signIn({@required String username, @required String password});

  Future<void> signOut();

  Future<void> updateFieldToSubCollection({
    @required String collection,
    @required String docId,
    @required String subCollection,
    @required String subCollectionDoc,
    @required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>> getLatestSubCollectionMap({
    @required String collection,
    @required String docId,
    @required String subCollection,
    @required String subCollectionDocId,
  });

  Future<void> addDataToFormsCollection(
      {@required Map<String, dynamic> data,
      @required String formName,
      @required String hn});

  Future<List<QueryDocumentSnapshot>> getAppointmentList(
      {@required DateTime currentDate});

  Future<String> getMedicalTeamSignature();

  Future<Map<String, dynamic>> getCollectionMap(
      {@required String collection, @required String docId});

  Future<int> getDayInCurrentState({@required String hn});
}
