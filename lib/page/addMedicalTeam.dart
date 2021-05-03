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
      appBar: AppBar(
        title: Text(
          'ลงทะเบียนผู้ใช้งาน',
          style: TextStyle(fontSize: 24),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.pushNamed(context, '/postHos_page'),
        ),
      ),
      body: MedicalTeamRegisterForm(),
      drawer: SideBar(),
    );
  }
}
