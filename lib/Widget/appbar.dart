import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;

  const BaseAppBar({Key key, this.title, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      backgroundColor: Color(0xFFC37447),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontFamily: 'Prompt',
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.pushNamed(context, '/notification_page');
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                Navigator.pushNamed(context, '/notification_page');
              }),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
