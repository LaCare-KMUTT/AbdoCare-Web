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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(color: Color(0xFFC37447)),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/abdocare_logo.png',
                                      width: 80, height: 80)),
                            ),
                            FutureBuilder<String>(
                                future:
                                    _firebaseService.getMedicalTeamSignature(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Colors.white),
                                      strokeWidth: 4,
                                    );
                                  } else {
                                    return Text('${snapshot.data}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500));
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_circle_rounded,
                      ),
                      title: Text('รายชื่อผู้ป่วย',
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/patientList_page');
                        print('This is patientList button');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.pending_actions),
                      title: Text('Pre-Operation',
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/pre_page');
                        print('This is pre_page button');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.local_hospital),
                      title: Text("Post-Operation@Hospital",
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/postHos_page');
                        print('This is postHos_page button');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.house),
                      title: Text("Post-Operation@Home",
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/postHome_page');
                        print('This is postHome_page button');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.insert_invitation),
                      title: Text("ตารางนัด",
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () {
                        Navigator.pushNamed(context, '/appointment_page');
                        print('This is appointment_page button');
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
                        print('This is logout button');
                      },
                    ),
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
