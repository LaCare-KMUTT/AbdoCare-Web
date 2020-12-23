import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'interfaces/firebase_service_interface.dart';

class FirebaseService extends IFirebaseService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  Future<void> writeDataToFirestoreWithProvidedDoc({
    @required String collection,
    @required String docId,
    @required Map<String, dynamic> data,
  }) {}
  Future<void> createPatient({
    @required String collection,
    @required String docId,
    @required Map<String, dynamic> data,
  }) {}
  String getUserId() => _auth.currentUser.uid;
}
