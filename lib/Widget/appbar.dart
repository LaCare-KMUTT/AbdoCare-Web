import 'package:flutter/material.dart';
import 'notification_appbar.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;
  const BaseAppBar({Key key, this.title, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xFFC37447),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontFamily: 'Prompt',
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: 'เมนู',
          );
        },
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
          child: NotiIcon(
            iconData: Icons.notifications,
            notificationCount: 0,
            onTap: () {
              Navigator.pushNamed(context, '/notification_page');
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
