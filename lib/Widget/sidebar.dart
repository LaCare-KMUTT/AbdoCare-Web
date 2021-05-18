import 'package:AbdoCare_Web/Widget/shared/progress_bar.dart';
import 'package:AbdoCare_Web/services/interfaces/calculation_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';
import 'material.dart';

class SideBar extends StatelessWidget {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();
  final ICalculationService _calculationService =
      locator<ICalculationService>();

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
                    Container(
                      height: 240,
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          color: _customMaterial
                              .createMaterialColor(Color(0xFFC37447)),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Material(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        'assets/abdocare_logo.png',
                                        width: 80,
                                        height: 80)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: FutureBuilder<String>(
                                    future: _firebaseService
                                        .getMedicalTeamSignature(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Container(
                                            height: 10,
                                            width: 10,
                                            child: ProgressBar
                                                .circularProgressIndicator(
                                                    context));
                                      } else {
                                        return Text('${snapshot.data}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400));
                                      }
                                    }),
                              ),
                              FutureBuilder<String>(
                                  future: _firebaseService.getMedicalTeamRole(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Container(
                                          height: 10,
                                          width: 10,
                                          child: ProgressBar
                                              .circularProgressIndicator(
                                                  context));
                                    } else if (snapshot.data ==
                                        'Medical Admin') {
                                      return Column(
                                        children: [
                                          Text('${snapshot.data}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400)),
                                          Material(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.assignment_ind,
                                              ),
                                              title: Text('ลงทะเบียนผู้ใช้งาน',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2),
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    '/addMedicalTeam_page');
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Column(
                                        children: [
                                          Text('${snapshot.data}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400)),
                                          FutureBuilder<String>(
                                              future: _firebaseService
                                                  .getMedicalTeamWard(),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return Container(
                                                      height: 10,
                                                      width: 10,
                                                      child: ProgressBar
                                                          .circularProgressIndicator(
                                                              context));
                                                } else {
                                                  return Text(
                                                      '${snapshot.data}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400));
                                                }
                                              }),
                                        ],
                                      );
                                    }
                                  }),
                            ],
                          ),
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
                      leading: Icon(Icons.autorenew_rounded),
                      title: Text("Re-Admit",
                          style: Theme.of(context).textTheme.bodyText2),
                      onTap: () async {
                        reAdmitCard(context);
                        print('This is Re-Admit button');
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

  Future<void> reAdmitCard(BuildContext context) async {
    var hn;
    bool isSearch = false;
    return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Re-Admit",
                  style: TextStyle(fontSize: 24, color: Color(0xFFC37447))),
              content: Builder(builder: (context) {
                return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'ค้นหาผู้ป่วย:',
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    child: TextField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[a-zA-Z0-9]"))
                                      ],
                                      decoration: InputDecoration(
                                          isDense: true,
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.black26,
                                                      width: 0.0)),
                                          contentPadding: EdgeInsets.all(10.0),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7.0))),
                                          prefixIcon: Icon(Icons.search),
                                          hintText: 'HN'),
                                      onChanged: (val) {
                                        setState(() {
                                          hn = val.toUpperCase();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: RaisedButton(
                              child:
                                  Text("ค้นหา", style: TextStyle(fontSize: 18)),
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              onPressed: () {
                                setState(() {
                                  isSearch = true;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      if (isSearch) reAdmitList(context, hn),
                    ],
                  ),
                );
              }),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("ยกเลิก", style: TextStyle(fontSize: 18)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget reAdmitList(BuildContext context, var hn) {
    return FutureBuilder<Map<String, dynamic>>(
        future: _firebaseService.getDischargedPatient(hn: hn),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              // Access the fields as defined in FireStore
                              title: Text(
                                snapshot.data['hn'],
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              // Access the fields as defined in FireStore
                              title: Text(
                                '${snapshot.data['name']} ${snapshot.data['surname']} ',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              // Access the fields as defined in FireStore
                              title: Text(
                                '${_calculationService.calculateAge(birthDate: snapshot.data['dob'].toDate())} ',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        textColor: Colors.white,
                        color: Color(0xFFF69E51),
                        child: Text('Re-Admit', style: TextStyle(fontSize: 18)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/reAdmit_page',
                              arguments: snapshot.data['hn']);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                " ไม่มีข้อมูล ",
                style: TextStyle(color: Colors.black45),
              ),
            );
          } else {
            return ProgressBar.circularProgressIndicator(context);
          }
        });
  }
}
