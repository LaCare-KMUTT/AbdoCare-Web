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
    print('Create user via cloud function');

    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    String uid = '0';
    try {
      await createUserCallable(data)
          .then((response) => {
                if (response.data['status'] == 'success')
                  {
                    print('uid = ${response.data['uid']}'),
                    uid = response.data['uid']
                  }
                else
                  {print(response.data['message']), uid = '0'}
              })
          .catchError((onError) => {print('Error! :' + onError.toString())});
    } on FirebaseFunctionsException catch (e) {
      print('Error in catch $e');
      uid = '0';
    }
    return uid;
  }
}
