import 'package:flutter/material.dart';

import '../Widget/appbar.dart';
import '../Widget/evaluationForms/previsit_form.dart';
import '../Widget/sidebar.dart';

class EvaluationFormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EvaluationFormPageState();
  }
}

class _EvaluationFormPageState extends State<EvaluationFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('แบบประเมิน'),
        appBar: AppBar(),
      ),
      body: PrevisitForm(),
      drawer: SideBar(),
    );
  }
}
