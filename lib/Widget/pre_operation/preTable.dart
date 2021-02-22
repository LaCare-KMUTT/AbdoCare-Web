import 'dart:ui';
import 'package:flutter/material.dart';
import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';

class PreTable extends StatefulWidget {
  PreTable({Key key}) : super(key: key);
  @override
  _PreTableState createState() => _PreTableState();
}

class _PreTableState extends State<PreTable> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  List<User> users;
  List<User> selectedUsers;
  bool sort;
  @override
  void initState() {
    sort = true;
    selectedUsers = [];
    users = User.getUsers();
    super.initState();
  }

  onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.hn.compareTo(b.hn));
      } else {
        users.sort((a, b) => b.hn.compareTo(a.hn));
      }
    }
  }

  DataTable dataBody() {
    var screenSize = MediaQuery.of(context).size;
    return DataTable(
      showCheckboxColumn: false,
      columnSpacing: screenSize.width / 19,
      headingRowHeight: 50,
      headingTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'Prompt',
          color: Colors.black54,
          fontStyle: FontStyle.italic),
      sortAscending: sort,
      sortColumnIndex: 0,
      columns: [
        DataColumn(
            label: Text('HN'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
          label: Text('ชื่อ-นามสกุล'),
        ),
        DataColumn(
          label: Text('เพศ'),
        ),
        DataColumn(
          label: Text('อายุ'),
        ),
        DataColumn(
          label: Text('ห้อง'),
        ),
        DataColumn(
          label: Text('เตียง'),
        ),
        DataColumn(
          label: Text('ออกซิเจน'),
        ),
        DataColumn(
          label: Text('ความดัน'),
        ),
        DataColumn(
          label: Text('อุณหภูมิ'),
        ),
        DataColumn(
          label: Text('สถานะ'),
        ),
      ],
      rows: users
          .map((user) => DataRow(
                  onSelectChanged: (newValue) {
                    print('Selected ${user.hn} ${user.name}');
                  },
                  cells: [
                    DataCell(
                      Text(user.hn),
                    ),
                    DataCell(
                      Text(user.name),
                    ),
                    DataCell(
                      Text(user.gender),
                    ),
                    DataCell(
                      Text(user.age),
                    ),
                    DataCell(
                      Text(user.room),
                    ),
                    DataCell(
                      Text(user.bed),
                    ),
                    DataCell(
                      Text(user.oxygen),
                    ),
                    DataCell(
                      Text(user.pressure),
                    ),
                    DataCell(
                      Text(user.temperature),
                    ),
                    DataCell(
                      Text(user.status),
                    ),
                  ]))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: ListView(
        children: [
          Row(children: <Widget>[
            Expanded(
              flex: 5,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenSize.height / 7,
                        screenSize.height / 20, screenSize.height / 70, 0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'ค้นหาผู้ป่วย:',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, screenSize.height / 20, screenSize.height / 70, 0),
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                            isDense: true,
                            enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black26, width: 0.0)),
                            contentPadding: EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0))),
                            prefixIcon: Icon(Icons.search),
                            hintText: 'HN'),
                        onChanged: (val) {
                          setState(() {
                            // hn = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0, screenSize.height / 20, screenSize.height / 9, 0),
              child: Container(
                child: RaisedButton(
                  child: Text("ค้นหา", style: TextStyle(fontSize: 18)),
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  onPressed: () {},
                ),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(screenSize.height / 20,
                screenSize.height / 70, screenSize.height / 20, 0),
            child: Card(
              child: Container(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: dataBody(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  String hn;
  String name;
  String gender;
  String age;
  String room;
  String bed;
  String oxygen;
  String pressure;
  String temperature;
  String status;

  User(
      {this.hn,
      this.name,
      this.gender,
      this.age,
      this.room,
      this.bed,
      this.oxygen,
      this.pressure,
      this.temperature,
      this.status});
  static List<User> getUsers() {
    return <User>[
      User(
          hn: "HN10001",
          name: "วริศรา จิ๋วประดิษฐ์กุล",
          gender: "หญิง",
          age: "46",
          room: "13",
          bed: "1",
          oxygen: "95",
          pressure: "99",
          temperature: "91",
          status: "ปกติ"),
      User(
          hn: "HN10002",
          name: "พรพิมล แก้วใส",
          gender: "หญิง",
          age: "37",
          room: "10",
          bed: "3",
          oxygen: "98",
          pressure: "94",
          temperature: "98",
          status: "ปกติ"),
      User(
          hn: "HN10003",
          name: "ทวีศักดิ์ สายวงศ์",
          gender: "ชาย",
          age: "38",
          room: "9",
          bed: "2",
          oxygen: "96",
          pressure: "97",
          temperature: "90",
          status: "ปกติ"),
    ];
  }
}
