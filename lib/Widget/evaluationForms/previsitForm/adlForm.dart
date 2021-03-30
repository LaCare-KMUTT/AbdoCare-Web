import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatus.dart';
import 'package:AbdoCare_Web/Widget/material.dart';
import 'package:flutter/material.dart';

import '../../../services/interfaces/calculation_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../appbar.dart';
import '../../sidebar.dart';

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
  ICalculationService _calculationService = locator<ICalculationService>();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();
  String _feeding = '';
  String _grooming = '';
  String _transfer = '';
  String _toiletUse = '';
  String _mobility = '';
  String _dressing = '';
  String _stairs = '';
  String _bathing = '';
  String _bowels = '';
  String _bladder = '';

  int bladderIsSelected;
  int totalscore = 0;
  int score1,
      score2,
      score3,
      score4,
      score5,
      score6,
      score7,
      score8,
      score9,
      score10 = 0;

  int feeding;
  int grooming;
  int transfer;
  int toiletUse;
  int mobility;
  int dressing;
  int stairs;
  int bathing;
  int bowels;
  int bladder;
  void adlData(int page) {
    totalscore = score1 +
        score2 +
        score3 +
        score4 +
        score5 +
        score6 +
        score7 +
        score8 +
        score9 +
        score10;

    Map<String, dynamic> formDataToDB2 = {
      'Feeding': score1,
      'Grooming': score2,
      'Tranfer': score3,
      'Toilet': score4,
      'Mobility': score5,
      'Dressing': score6,
      'Stairs': score7,
      'Bathing': score8,
      'Bowels': score9,
      'Bladder': score10,
      'TotalscoreADL': totalscore,
    };
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
                                  child: Column(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                screenSize.height / 70),
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
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 20,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
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
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '0 ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้'),
                                                      value: 0,
                                                      groupValue: feeding,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          feeding = newValue;
                                                          score1 = 0;
                                                          _feeding =
                                                              '0 ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้';
                                                          print(_feeding);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '1 ตักอาหารเองได้แต่ต้องมีคนช่วย เช่น ช่วยใช้ช้อนตักเตรียมไว้ให้หรือตัดเป็นเล็กๆไว้ล่วงหน้า  '),
                                                      value: 1,
                                                      groupValue: feeding,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          feeding = newValue;
                                                          score1 = 1;
                                                          _feeding =
                                                              '1ตักอาหารเองได้แต่ต้องมีคนช่วย เช่น ช่วยใช้ช้อนตักเตรียมไว้ให้หรือตัดเป็นเล็กๆไว้ล่วงหน้า  ';
                                                          print(_feeding);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '2 ตักอาหารและช่วยตัวเองได้เป็นปกติ'),
                                                      value: 2,
                                                      groupValue: feeding,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          feeding = newValue;
                                                          score1 = 2;
                                                          _feeding =
                                                              '2 ตักอาหารและช่วยตัวเองได้เป็นปกติ';
                                                          print(_feeding);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //question#2
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 20,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
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
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '0 ต้องการความช่วยเหลือ'),
                                                      value: 0,
                                                      groupValue: grooming,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          grooming = newValue;
                                                          score2 = 0;
                                                          _grooming =
                                                              '0 ต้องการความช่วยเหลือ';
                                                          print(_grooming);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '1 ทำเองได้ (รวมทั้งที่ทำได้เองถ้าเตรียมอุปกรณ์ไว้ให้)'),
                                                      value: 1,
                                                      groupValue: grooming,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          grooming = newValue;
                                                          score2 = 1;
                                                          _grooming =
                                                              '1 ทำเองได้ (รวมทั้งที่ทำได้เองถ้าเตรียมอุปกรณ์ไว้ให้)';
                                                          print(_grooming);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //question#3
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 20,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
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
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '0 ไม่สามารถนั่งได้ (นั่งแล้วจะล้มเสมอ) หรือต้องใช้คนสองคนช่วยกันยกขึ้น'),
                                                      value: 0,
                                                      groupValue: transfer,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          transfer = newValue;
                                                          score3 = 0;
                                                          _transfer =
                                                              '0 ต้องการความช่วยเหลือ';
                                                          print(_transfer);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '1 ต้องการความช่วยเหลืออย่างมากจึงจะนั่งได้ เช่น ต้องใช้คนที่แข็งแรงหรือมีทักษะ1 คน หรือใช้คนทั่วไป2 คนพยุงหรือดันขึ้นมาจึงจะนั่งอยู่ได้'),
                                                      value: 1,
                                                      groupValue: transfer,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          transfer = newValue;
                                                          score3 = 1;
                                                          _transfer =
                                                              '1 ต้องการความช่วยเหลืออย่างมากจึงจะนั่งได้ เช่น ต้องใช้คนที่แข็งแรงหรือมีทักษะ1 คน หรือใช้คนทั่วไป2 คนพยุงหรือดันขึ้นมาจึงจะนั่งอยู่ได้';
                                                          print(_transfer);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '2 ต้องการความช่วยเหลือบ้างเช่น บอกให้ทำตาม หรือช่วยพยุงเล็กน้อย หรือต้องมีคนดูแลเพื่อความปลอดภัย'),
                                                      value: 2,
                                                      groupValue: transfer,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          transfer = newValue;
                                                          score3 = 2;
                                                          _transfer =
                                                              '2 ต้องการความช่วยเหลือบ้างเช่น บอกให้ทำตาม หรือช่วยพยุงเล็กน้อย หรือต้องมีคนดูแลเพื่อความปลอดภัย';
                                                          print(_transfer);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text('3 ทำได้เอง'),
                                                      value: 3,
                                                      groupValue: transfer,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          transfer = newValue;
                                                          score3 = 3;
                                                          _transfer =
                                                              '3 ทำได้เอง';
                                                          print(_transfer);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //question#4
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 20,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
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
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '0 ช่วยตัวเองไม่ได้'),
                                                      value: 0,
                                                      groupValue: toiletUse,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          toiletUse = newValue;
                                                          score4 = 0;
                                                          _toiletUse =
                                                              '0 ช่วยตัวเองไม่ได้';
                                                          print(_toiletUse);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '1 ทำเองได้บ้าง (อย่างน้อยทำความสะอาดตัวเองได้หลังจากเสร็จธุระ) แต่ต้องการความช่วยเหลือในบางสิ่ง '),
                                                      value: 1,
                                                      groupValue: toiletUse,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          toiletUse = newValue;
                                                          score4 = 1;
                                                          _toiletUse =
                                                              '1 ทำเองได้บ้าง (อย่างน้อยทำความสะอาดตัวเองได้หลังจากเสร็จธุระ) แต่ต้องการความช่วยเหลือในบางสิ่ง ';
                                                          print(_toiletUse);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '2 ช่วยตัวเองได้ดี (ขึ้นนั่งและลงจากโถส้วมเองได้ ทำความสะอาดได้เรียบร้อยหลังจากเสร็จธุระ ถอดใส่เสื้อผ้าได้เรียบร้อย)'),
                                                      value: 2,
                                                      groupValue: toiletUse,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          toiletUse = newValue;
                                                          score4 = 2;
                                                          _toiletUse =
                                                              '2 ช่วยตัวเองได้ดี (ขึ้นนั่งและลงจากโถส้วมเองได้ ทำความสะอาดได้เรียบร้อยหลังจากเสร็จธุระ ถอดใส่เสื้อผ้าได้เรียบร้อย)';
                                                          print(_toiletUse);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //question#5
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 20,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
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
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '0 เคลื่อนที่ไปไหนไม่ได้'),
                                                      value: 0,
                                                      groupValue: mobility,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          mobility = newValue;
                                                          score5 = 0;
                                                          _mobility =
                                                              '0 เคลื่อนที่ไปไหนไม่ได้';
                                                          print(_mobility);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '1 ต้องใช้รถเข็นช่วยตัวเองให้เคลื่อนที่ได้เอง (ไม่ต้องมีคนเข็นให้) และจะต้องเข้าออกมุมห้องหรือประตูได้'),
                                                      value: 1,
                                                      groupValue: mobility,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          mobility = newValue;
                                                          score5 = 1;
                                                          _mobility =
                                                              '1 ต้องใช้รถเข็นช่วยตัวเองให้เคลื่อนที่ได้เอง (ไม่ต้องมีคนเข็นให้) และจะต้องเข้าออกมุมห้องหรือประตูได้';
                                                          print(_mobility);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '2 เดินหรือเคลื่อนที่โดยมีคนช่วย เช่น พยุง หรือบอกให้ทำตาม หรือต้องให้ความสนใจดูแลเพื่อความปลอดภัย '),
                                                      value: 2,
                                                      groupValue: mobility,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          mobility = newValue;
                                                          score5 = 2;
                                                          _mobility =
                                                              '2 เดินหรือเคลื่อนที่โดยมีคนช่วย เช่น พยุง หรือบอกให้ทำตาม หรือต้องให้ความสนใจดูแลเพื่อความปลอดภัย ';
                                                          print(_mobility);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '3 เดินหรือเคลื่อนที่ได้เอง'),
                                                      value: 3,
                                                      groupValue: mobility,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          mobility = newValue;
                                                          score5 = 3;
                                                          _mobility =
                                                              '3 เดินหรือเคลื่อนที่ได้เอง';
                                                          print(_mobility);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //question#6
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 20,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
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
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '0 ต้องมีคนสวมใส่ให้ ช่วยตัวเองแทบไม่ได้หรือได้น้อย '),
                                                      value: 0,
                                                      groupValue: dressing,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          dressing = newValue;
                                                          score6 = 0;
                                                          _dressing =
                                                              '0 ต้องการความช่วยเหลือ';
                                                          print(_dressing);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '1 ช่วยตัวเองได้ประมาณร้อยละ50ที่เหลือต้องมีคนช่วย'),
                                                      value: 1,
                                                      groupValue: dressing,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          dressing = newValue;
                                                          score6 = 1;
                                                          _dressing =
                                                              '1 ทำเองได้ (รวมทั้งที่ทำได้เองถ้าเตรียมอุปกรณ์ไว้ให้)';
                                                          print(_dressing);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '2 ช่วยตัวเองได้ดี (รวมทั้งการติดกระดุม รูดซิบ หรือใช้เสื้อผ้าที่ดัดแปลงให้เหมาะสมก็ได้)'),
                                                      value: 2,
                                                      groupValue: dressing,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          dressing = newValue;
                                                          score6 = 2;
                                                          _dressing =
                                                              '2 ช่วยตัวเองได้ดี (รวมทั้งการติดกระดุม รูดซิบ หรือใช้เสื้อผ้าที่ดัดแปลงให้เหมาะสมก็ได้)';
                                                          print(_dressing);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //question#7
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 20,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
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
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '0 ไม่สามารถทำได้'),
                                                      value: 0,
                                                      groupValue: stairs,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          stairs = newValue;
                                                          score7 = 0;
                                                          _stairs =
                                                              '0 ไม่สามารถทำได้';
                                                          print(_stairs);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '1 ต้องการคนช่วย'),
                                                      value: 1,
                                                      groupValue: stairs,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          stairs = newValue;
                                                          score7 = 1;
                                                          _stairs =
                                                              '1 ต้องการคนช่วย';
                                                          print(_stairs);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '2  ขึ้นลงได้เอง (ถ้าต้องใช้เครื่องช่วยเดิน เช่น walkerจะต้องเอาขึ้นลงได้ด้วย)'),
                                                      value: 2,
                                                      groupValue: stairs,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          stairs = newValue;
                                                          score7 = 2;
                                                          _stairs =
                                                              '2  ขึ้นลงได้เอง (ถ้าต้องใช้เครื่องช่วยเดิน เช่น walkerจะต้องเอาขึ้นลงได้ด้วย)';
                                                          print(_stairs);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //question#8
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 20,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
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
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '0 ต้องมีคนช่วยหรือทำให้'),
                                                      value: 0,
                                                      groupValue: bathing,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          bathing = newValue;
                                                          score8 = 0;
                                                          _bathing =
                                                              '0 ต้องมีคนช่วยหรือทำให้';
                                                          print(_bathing);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '1 อาบน้ำเองได้'),
                                                      value: 1,
                                                      groupValue: bathing,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          bathing = newValue;
                                                          score8 = 1;
                                                          _bathing =
                                                              '1 อาบน้ำเองได้';
                                                          print(_bathing);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //question#9
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 20,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
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
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '0 กลั้นไม่ได้ หรือต้องการการสวนอุจจาระอยู่เสมอ'),
                                                      value: 0,
                                                      groupValue: bowels,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          bowels = newValue;
                                                          score9 = 0;
                                                          _bowels =
                                                              '0 กลั้นไม่ได้ หรือต้องการการสวนอุจจาระอยู่เสมอ';
                                                          print(_bowels);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '1 กลั้นไม่ได้บางครั้ง (เป็นน้อยกว่า1ครั้งต่อสัปดาห์)'),
                                                      value: 1,
                                                      groupValue: bowels,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          bowels = newValue;
                                                          score9 = 1;
                                                          _bowels =
                                                              '1 กลั้นไม่ได้บางครั้ง (เป็นน้อยกว่า1ครั้งต่อสัปดาห์)';
                                                          print(_bowels);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '2 กลั้นได้เป็นปกติ'),
                                                      value: 2,
                                                      groupValue: bowels,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          bowels = newValue;
                                                          score9 = 2;
                                                          _bowels =
                                                              '2 กลั้นได้เป็นปกติ';
                                                          print(_bowels);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //question#10
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 20,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
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
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '0 กลั้นไม่ได้ หรือใส่สายสวนปัสสาวะแต่ไม่สามารถดูแลเองได้'),
                                                      value: 0,
                                                      groupValue: bladder,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          bladder = newValue;
                                                          score10 = 0;
                                                          _bladder =
                                                              '0 กลั้นไม่ได้ หรือใส่สายสวนปัสสาวะแต่ไม่สามารถดูแลเองได้';
                                                          print(_bladder);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '1 กลั้นไม่ได้บางครั้ง (เป็นน้อยกว่าวันละ1ครั้ง)'),
                                                      value: 1,
                                                      groupValue: bladder,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          bladder = newValue;
                                                          score10 = 1;
                                                          _bladder =
                                                              '1 กลั้นไม่ได้บางครั้ง (เป็นน้อยกว่าวันละ1ครั้ง)';
                                                          print(_bladder);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                screenSize.height / 10,
                                                screenSize.height / 70,
                                                screenSize.height / 70,
                                                0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      title: Text(
                                                          '2 กลั้นได้เป็นปกติ'),
                                                      value: 2,
                                                      groupValue: bladder,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          bladder = newValue;
                                                          score10 = 2;
                                                          _bladder =
                                                              '2 กลั้นได้เป็นปกติ';
                                                          print(_bladder);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //criteria
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
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
                              )),
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
                            adlData(0);
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
                            if (_feeding == "" ||
                                _grooming == "" ||
                                _transfer == "" ||
                                _toiletUse == "" ||
                                _mobility == "" ||
                                _dressing == "" ||
                                _stairs == "" ||
                                _bathing == "" ||
                                _bowels == "" ||
                                _bladder == "") {
                              alert(context);
                            } else {
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
