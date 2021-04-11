import 'package:flutter/material.dart';

import '../../../../models/evalutate_form/pre_visit/adlForm_model.dart';
import '../../../../view_models/evaluate_form/adlForm_view_model.dart';
import '../../../appbar.dart';
import '../../../sidebar.dart';
import '../healthStatus.dart';
import '@enum.dart';
import 'adlQuestions.dart';

class ADLForm extends StatefulWidget {
  ADLForm(
      {Key key, this.generalForm, this.adlForm, this.healthStatusForm, this.hn})
      : super(key: key);
  final Map<String, dynamic> generalForm;
  final Map<String, dynamic> adlForm;
  final Map<String, dynamic> healthStatusForm;
  final String hn;

  @override
  _ADLFormState createState() => _ADLFormState();
}

class _ADLFormState extends State<ADLForm> {
  int bladderIsSelected;
  int totalscore = 0;
  int feedingScore,
      groomingScore,
      transferScore,
      toiletUseScore,
      mobilityScore,
      dressingScore,
      stairsScore,
      bathingScore,
      bowelsScore,
      bladderScore;

  void adlData(int page) {
    totalscore = feedingScore +
        groomingScore +
        transferScore +
        toiletUseScore +
        mobilityScore +
        dressingScore +
        stairsScore +
        bathingScore +
        bowelsScore +
        bladderScore;

    Map<String, dynamic> formDataToDB2 = {
      'Feeding': feedingScore,
      'Grooming': groomingScore,
      'Transfer': transferScore,
      'Toilet': toiletUseScore,
      'Mobility': mobilityScore,
      'Dressing': dressingScore,
      'Stairs': stairsScore,
      'Bathing': bathingScore,
      'Bowels': bowelsScore,
      'Bladder': bladderScore,
      'TotalScoreADL': totalscore,
    };
    var model = ADLFormViewModel.getADLFormModel();
    model.fromMap(formDataToDB2);
    var map = model.toMap();
    print(map);
    if (page == 0) {
      //back to previous page
    } else {
      //navigate to the next page
      print('hn in ADLForm = ${widget.hn}');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HealthStatusForm(
                hn: widget.hn,
                generalForm: widget.generalForm,
                adlForm: formDataToDB2),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('แบบประเมิน'),
        appBar: AppBar(),
      ),
      drawer: SideBar(),
      body: Container(
        child: LayoutBuilder(builder: (context, constraints) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(screenSize.height / 70),
                child: Container(
                  child: Center(
                    child: Text(
                      'บันทึกการเยี่ยมผู้รับบริการสูงอายุก่อนผ่าตัด(Pre-visit)',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFC37447),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: SafeArea(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: constraints.minWidth,
                            minHeight: constraints.minHeight),
                        child: IntrinsicWidth(
                          child: Column(
                            children: [
                              Card(
                                  child: FutureBuilder<ADLFormModel>(
                                      future: ADLFormViewModel.getModel(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: CircularProgressIndicator(
                                                strokeWidth: 4),
                                          );
                                        }
                                        return Column(
                                          children: [
                                            Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          screenSize.height /
                                                              70),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                                  'แบบประเมิน ADL',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600))),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  //question#1
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              screenSize
                                                                      .height /
                                                                  20,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                                  '1.  Feeding (รับประทานอาหารเมื่อเตรียมสำรับไว้ให้เรียบร้อยต่อหน้า)')),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  ADLQuestions(
                                                    onSaved: (newValue) =>
                                                        feedingScore = newValue,
                                                    topic: ADLTopic.feeding,
                                                  ),
                                                  //question#2
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              screenSize
                                                                      .height /
                                                                  20,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                                  '2. Grooming (ล้างหน้า หวีผม แปรงฟัน โกนหนวด ในระยะเวลา24- 28 ชั่วโมงที่ผ่านมา)')),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  ADLQuestions(
                                                      onSaved: (newValue) =>
                                                          groomingScore =
                                                              newValue,
                                                      topic: ADLTopic.grooming),

                                                  //question#3
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              screenSize
                                                                      .height /
                                                                  20,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                                  '3. Transfer (ลุกนั่งจากที่นอน หรือจากเตียงไปยังเก้าอี้)')),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  ADLQuestions(
                                                    onSaved: (newValue) =>
                                                        transferScore =
                                                            newValue,
                                                    topic: ADLTopic.transfer,
                                                  ),
                                                  //question#4
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              screenSize
                                                                      .height /
                                                                  20,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                                  '4. Toilet use (การใช้ห้องน้ำ)')),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  ADLQuestions(
                                                      onSaved: (newValue) =>
                                                          toiletUseScore =
                                                              newValue,
                                                      topic:
                                                          ADLTopic.toiletUse),
                                                  //question#5
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              screenSize
                                                                      .height /
                                                                  20,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                                  '5. Mobility (การเคลื่อนที่ภายในห้องหรือบ้าน)')),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  ADLQuestions(
                                                    onSaved: (newValue) =>
                                                        mobilityScore =
                                                            newValue,
                                                    topic: ADLTopic.mobility,
                                                  ),
                                                  //question#6
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              screenSize
                                                                      .height /
                                                                  20,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                                  '6. Dressing (การสวมใส่เสื้อผ้า)')),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  ADLQuestions(
                                                    onSaved: (newValue) =>
                                                        dressingScore =
                                                            newValue,
                                                    topic: ADLTopic.dressing,
                                                  ),
                                                  //question#7
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              screenSize
                                                                      .height /
                                                                  20,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                                  '7. Stairs (การขึ้นลงบันได1ชั้น)')),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  ADLQuestions(
                                                    onSaved: (newValue) =>
                                                        stairsScore = newValue,
                                                    topic: ADLTopic.stairs,
                                                  ),
                                                  //question#8
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              screenSize
                                                                      .height /
                                                                  20,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                                  '8. Bathing (การอาบน้ำ)')),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  ADLQuestions(
                                                    onSaved: (newValue) =>
                                                        bathingScore = newValue,
                                                    topic: ADLTopic.bathing,
                                                  ),
                                                  //question#9
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              screenSize
                                                                      .height /
                                                                  20,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                                  '9. Bowels (การกลั้นการถ่ายอุจจาระในระยะ1สัปดาห์ที่ผ่านมา)')),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  ADLQuestions(
                                                    onSaved: (newValue) =>
                                                        bowelsScore = newValue,
                                                    topic: ADLTopic.bowels,
                                                  ),
                                                  //question#10
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              screenSize
                                                                      .height /
                                                                  20,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              screenSize
                                                                      .height /
                                                                  70,
                                                              0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                                  '10. Bladder (การกลั้นปัสสาวะในระยะ1สัปดาห์ที่ผ่านมา)')),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  ADLQuestions(
                                                    onSaved: (newValue) =>
                                                        bladderScore = newValue,
                                                    topic: ADLTopic.bladder,
                                                  ),
                                                  //criteria
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                        screenSize.height / 20,
                                                        screenSize.height / 70,
                                                        screenSize.height / 70,
                                                        screenSize.height / 70,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'การแปลผล\n1. มีผลรวมคะแนน ตั้งแต่ 12 คะแนนขึ้นไป = Mild Independence\n2. มีผลรวมคะแนน 9 - 11 = Moderately Independence\n3. มีผลรวมคะแนน 5 - 8 = Severe Independence\n4. มีผลรวมคะแนน 0 - 4 = Total Independence',
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      })),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 15),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          padding: EdgeInsets.all(15),
                          textColor: Colors.black,
                          color: Color(0xFFEBEBEB),
                          child: Text(
                            'ย้อนกลับ',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.pop(context);

                            // adlData(0);
                          },
                        ),
                      ),
                      Container(
                        width: 100,
                        margin: EdgeInsets.all(20),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          padding: EdgeInsets.all(15),
                          textColor: Colors.white,
                          color: Color(0xFF2ED47A),
                          child: Text(
                            'ถัดไป',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            if (feedingScore == null ||
                                groomingScore == null ||
                                transferScore == null ||
                                toiletUseScore == null ||
                                mobilityScore == null ||
                                dressingScore == null ||
                                stairsScore == null ||
                                bathingScore == null ||
                                bowelsScore == null ||
                                bladderScore == null) {
                              alert(context);
                            } else {
                              // ADLFormViewModel().
                              adlData(1);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  void alert(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("กรุณาทำแบบประเมินให้ครบถ้วน",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center),
          );
        });
  }
}
