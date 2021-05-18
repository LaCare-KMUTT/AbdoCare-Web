import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class CloudFunctionService {
  HttpsCallable _createUserCallable = FirebaseFunctions.instance.httpsCallable(
      'createUser',
      options: HttpsCallableOptions(timeout: Duration(seconds: 5)));

  HttpsCallable _dischargeUserCallable = FirebaseFunctions.instance
      .httpsCallable('moveDocument',
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
      await _createUserCallable(data)
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
      print('Error in createUser: $e');
      uid = '0';
    }
    return uid;
  }

  Future<void> dischargeUser({@required String userId}) async {
    print('Discharge user $userId');
    Map<String, dynamic> data = {
      'userId': userId,
    };
    try {
      await _dischargeUserCallable(data).then((response) => {
            if (response.data['status'] == 'success')
              {
                print('GOOD GOOD'),
              }
            else
              {
                print(response.data['message']),
              }
          });
    } on FirebaseFunctionsException catch (e) {
      print('Error in dischargeUser: $e');
    }
  }
}
