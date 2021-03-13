import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class CloudFunctionService {
  HttpsCallable createUserCallable = FirebaseFunctions.instance.httpsCallable(
      'createUser',
      options: HttpsCallableOptions(timeout: Duration(seconds: 5)));

  Future<String> createUser({
    @required String email,
    @required String password,
  }) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
  }
}
