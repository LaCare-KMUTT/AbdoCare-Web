import 'package:flutter/material.dart';

import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _validateUsername = false;
  bool _validatePassword = false;
  bool _signInResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC37447),
        title: Text('AbdoCare'),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 200, 50, 0),
              child: TextField(
                controller: _usernameController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  errorText: _validateUsername ? 'กรุณากรอก username' : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  errorText: _validatePassword ? 'กรุณากรอก password' : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 150),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    textColor: Colors.white,
                    color: Color(0xFF2ED47A),
                    child: Text('เข้าสู่ระบบ', style: TextStyle(fontSize: 18)),
                    onPressed: () async {
                      setState(() {
                        _usernameController.text.isEmpty
                            ? _validateUsername = true
                            : _validateUsername = false;

                        _passwordController.text.isEmpty
                            ? _validatePassword = true
                            : _validatePassword = false;
                      });
                      print('This is login button');

                      var signInResult = false;
                      if (_validatePassword && _validateUsername == true) {
                        signInResult = await _firebaseService.signIn(
                            username: _usernameController.text.trim(),
                            password: _passwordController.text.trim());
                      }
                      setState(() {
                        _signInResult = signInResult;
                      });

                      if (_signInResult == true) {
                        Navigator.pushNamed(context, '/postHos_page');
                      } else {
                        _showErrorSignInDialog();
                      }
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/Hospital_logo.png',
                      height: 100,
                      width: 80,
                    ),
                    Image.asset(
                      'assets/STIN_logo.png',
                      height: 100,
                      width: 80,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorSignInDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content:
                Text('Sth went wrong please provide some UI for me please.'),
            actions: <Widget>[
              FlatButton(
                child: Text('close'),
                onPressed: () {
                  print('close button');
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
