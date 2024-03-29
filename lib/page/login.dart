import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'AbdoCare',
          style: TextStyle(fontSize: 24),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/abdocare_logo2.png',
                        height: 200,
                        width: 200,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(300, 30, 300, 0),
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
              padding: const EdgeInsets.fromLTRB(300, 20, 300, 0),
              child: TextField(
                controller: _passwordController,
                obscureText: _obscureText,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: _toggle,
                  ),
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
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        onPrimary: Colors.white,
                        primary: Color(0xFF2ED47A),
                        padding: EdgeInsets.all(15),
                      ),
                      child:
                          Text('เข้าสู่ระบบ', style: TextStyle(fontSize: 18)),
                      onPressed: () async {
                        setState(() {
                          _usernameController.text.isEmpty
                              ? _validateUsername = true
                              : _validateUsername = false;

                          _passwordController.text.isEmpty
                              ? _validatePassword = true
                              : _validatePassword = false;
                        });

                        var signInResult = false;
                        if (_validatePassword == false &&
                            _validateUsername == false) {
                          signInResult = await _firebaseService.signIn(
                              username: _usernameController.text.trim(),
                              password: _passwordController.text.trim());
                        }
                        setState(() {
                          _signInResult = signInResult;
                        });

                        if (_signInResult) {
                          Navigator.pushNamed(context, '/postHos_page');
                        } else {
                          _showErrorSignInDialog();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Column(
            //   children: <Widget>[
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         Image.asset(
            //           'assets/Hospital_logo.png',
            //           height: 100,
            //           width: 80,
            //         ),
            //         Image.asset(
            //           'assets/STIN_logo.png',
            //           height: 100,
            //           width: 80,
            //         )
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  void _showErrorSignInDialog() {
    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      descTextAlign: TextAlign.center,
      animationDuration: Duration(milliseconds: 0),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          color: Colors.grey[50],
        ),
      ),
      titleStyle: TextStyle(
        color: Color(0xFFC37447),
      ),
      alertAlignment: Alignment.center,
    );
    Alert(
      context: context,
      type: AlertType.warning,
      style: alertStyle,
      title: "ขออภัยค่ะ",
      content: Text(
        'ไม่สามารถเข้าสู่ระบบได้เนื่องจากท่านกรอกข้อมูลไม่ถูกต้องค่ะ',
        textAlign: TextAlign.center,
      ),
      buttons: [
        DialogButton(
          child: Text(
            "ตกลง",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color(0xFFC37447),
        ),
      ],
    ).show();
  }
}
