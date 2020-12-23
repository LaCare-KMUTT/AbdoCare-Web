import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
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
                        Navigator.pushNamed(context, '/PatientList_page');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.pending_actions),
                      title: Text('Pre-op',
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/Pre_page');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.local_hospital),
                      title: Text("Post-op@Hospital",
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/PostHos_page');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.house),
                      title: Text("Post-op@Home",
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/PostHome_page');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.insert_invitation),
                      title: Text("ตารางนัด",
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/Appointment_page');
                      },
                    ),
                    const Expanded(child: SizedBox()),
                    const Divider(height: 1.0, color: Colors.grey),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text("ออกจากระบบ",
                          style: Theme.of(context).textTheme.bodyText2),
                      // onTap: () {
                      //   Navigator.pushReplacementNamed(
                      //       context, '/Login_page');
                      // },
                      onTap: () => Navigator.pushReplacementNamed(context, '/'),
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
