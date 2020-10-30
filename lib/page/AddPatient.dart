import 'package:flutter/material.dart';

class AddPatientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPatientPageState();
  }
}

class _AddPatientPageState extends State<AddPatientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AbdoCare'),
        backgroundColor: Color(0xFFC37447),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'เพิ่มผู้ป่วย',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
      drawer: Drawer(
        // child: Container(
        //   color: Color(0xFFC37447),
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
                        title: Text('เพิ่มผู้ป่วยใหม่'),
                        onTap: () {
                          Navigator.pushNamed(context, '/addPatient_page');
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.pending_actions),
                        title: Text('Pre-op'),
                        onTap: () {
                          Navigator.pushNamed(context, '/Pre_page');
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.local_hospital),
                        title: Text("Post-op@Hospital"),
                        onTap: () {
                          Navigator.pushNamed(context, '/PostHos_page');
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.house),
                        title: Text("Post-op@Community"),
                        onTap: () {
                          Navigator.pushNamed(context, '/PostCom_page');
                        },
                      ),
                      const Expanded(child: SizedBox()),
                      const Divider(height: 1.0, color: Colors.grey),
                      ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text("ออกจากระบบ"),
                        // onTap: () {
                        //   Navigator.pushReplacementNamed(
                        //       context, '/Login_page');
                        // },
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, '/'),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          //),
        ),
      ),
    );
  }
}
