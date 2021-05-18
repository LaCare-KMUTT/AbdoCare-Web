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

  Future<String> addDataToFormsCollection(
      {@required Map<String, dynamic> data,
      @required String formName,
      @required String hn,
      String formTime});

  Future<List<QueryDocumentSnapshot>> getAppointmentList(
      {@required DateTime currentDate});

  Future<String> getMedicalTeamSignature();

  Future<String> getMedicalTeamWard();

  Future<String> getMedicalTeamRole();

  Future<Map<String, dynamic>> getCollectionMap(
      {@required String collection, @required String docId});

  Future<int> getDayInCurrentState({@required String hn});

  Future<void> addNotification(
      {@required String hn,
      @required String formId,
      @required String formName});
  Future<String> getPatientState({@required String hn});

  Future<List<Map<String, dynamic>>> getNotification(
      {@required String patientState});

  Future<Map<String, dynamic>> getPatientDetail({@required String hn});

  Future<int> getNoticounter();

  Future<String> getEvaluationStatus(
      {@required String hn,
      @required String formName,
      @required String patientState,
      String vitalSignFormTime});

  Future<void> addToDashboardCollection(Map<String, dynamic> data);

  Future<int> getDayInHospital({@required String hn, DateTime dateToCompare});

  Future<List<Map<String, dynamic>>> getVitalSignTable(
      {@required String hn, @required String dashboardState});

  Future<Map<String, dynamic>> getAdlTable({@required String hn});

  Future<Map<String, dynamic>> getDischargedPatient({@required hn});
}
