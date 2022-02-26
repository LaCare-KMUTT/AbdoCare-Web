import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';

import 'shared/progress_bar.dart';

class NotiIcon extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final int notificationCount;
  const NotiIcon({
    Key key,
    this.onTap,
    @required this.iconData,
    this.notificationCount,
  }) : super(key: key);

  @override
  _NotiIconState createState() => _NotiIconState();
}

class _NotiIconState extends State<NotiIcon> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  var _notiCounter;
  var notiCounter;
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    notiCounter = await _firebaseService.getNotiCounter();
    setState(() {
      _notiCounter = notiCounter;
    });
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              widget.iconData,
              size: 30,
            ),
            Positioned(
                top: 0,
                right: 5,
                child: (() {
                  if (_notiCounter == null) {
                    return ProgressBar.circularProgressIndicator(context);
                  } else {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      alignment: Alignment.center,
                      child: Text(_notiCounter.toString()),
                    );
                  }
                }()))
          ],
        ),
      ),
    );
  }
}
