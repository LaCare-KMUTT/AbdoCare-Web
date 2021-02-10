import 'package:flutter/material.dart';

import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class SideBar extends StatelessWidget {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.account_circle_rounded,
                      ),
                      title: Text('รายชื่อผู้ป่วย',
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/patientList_page');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.pending_actions),
                      title: Text('Pre-Operation',
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/pre_page');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.local_hospital),
                      title: Text("Post-Operation@Hospital",
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/postHos_page');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.house),
                      title: Text("Post-Operation@Home",
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/postHome_page');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.insert_invitation),
                      title: Text("ตารางนัด",
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/appointment_page');
                      },
                    ),
                    const Expanded(child: SizedBox()),
                    const Divider(height: 1.0, color: Colors.grey),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text("ออกจากระบบ",
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () async {
                        await _firebaseService.signOut();
                        Navigator.pushReplacementNamed(context, '/login_page');
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
