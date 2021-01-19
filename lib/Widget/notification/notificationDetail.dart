import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationDetail extends StatefulWidget {
  NotificationDetail({Key key}) : super(key: key);
  @override
  _NotificationDetailState createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _requestPermission();
    _registerOnFirebase();
    _getMessage();
  }

  void _registerOnFirebase() {
    messaging
        .getToken(
            vapidKey:
                "BJ1Ff5Ha6wK1lf3C-gY_r3V-3o_Cwre7Iv7t0BdTPxylXl9Qmk6mGUQrY2_mhx0oKJncARPCrUuc6OPZvI8ovYk")
        .then((String token) => print('Token : $token'));
  }

  void _requestPermission() async {
    final NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void _getMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage messaging) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${messaging.data}');
      print("onResume: $messaging");
      if (messaging.notification != null) {
        print(
            'Message also contained a notification: ${messaging.notification}');
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
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(child: Text("ยังไม่อ่าน")),
                              ],
                            ),
                            Row(
                              children: [
                                Container(child: Text("อ่านแล้ว")),
                              ],
                            ),
                          ],
                        ),
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
