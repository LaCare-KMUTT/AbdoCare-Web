import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationDetail extends StatefulWidget {
  NotificationDetail({Key key}) : super(key: key);
  @override
  _NotificationDetailState createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  String _message = '';

  @override
  void initState() {
    _registerOnFirebase();
    getMessage();
    super.initState();
  }

  void _registerOnFirebase() {
    messaging.getToken().then((String token) => print('Token : $token'));
  }

  void getMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      setState(() {
        _message = message.notification.body;
      });
      print("onResume: $message");
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                      child: Card(
                          child: Center(
                        child: Text("Message: $_message"),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
