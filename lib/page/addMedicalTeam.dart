import 'package:AbdoCare_Web/Widget/appbar.dart';
import 'package:AbdoCare_Web/Widget/medicalteam/medicalTeamRegisterForm.dart';
import 'package:flutter/material.dart';

import '../Widget/sidebar.dart';

class AddMedicalTeamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddMedicalTeamPageState();
  }
}

class _AddMedicalTeamPageState extends State<AddMedicalTeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('ลงทะเบียนผู้ใช้งาน'),
        appBar: AppBar(),
      ),
      body: MedicalTeamRegisterForm(),
      drawer: SideBar(),
    );
  }
}
