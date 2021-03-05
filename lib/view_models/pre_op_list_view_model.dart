import 'package:AbdoCare_Web/models/pre_op_list_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';

class PreOpViewModel {
  PreOpViewModel();
  Future<List<PreOpData>> getUsers() async {
    final _firebaseService = locator<IFirebaseService>();

    List<PreOpData> userList = [];
    // print('HELLO WOI');
    var preOpList = await _firebaseService.getPreOpList();
    // print('waowwwwwwww => $preOpList');
    preOpList.forEach((mapData) {
      print('finally !   $mapData');
      userList.add(PreOpData(map: mapData));
    });
    return userList;
    // return <User>[
    //   User(
    //       hn: "HN10001",
    //       name: "วริศรา จิ๋วประดิษฐ์กุล",
    //       gender: "หญิง",
    //       age: "46",
    //       roomNumber: "13",
    //       bedNumber: "1",
    //       temperature: 37,
    //       respirationRate: 16,
    //       heartRate: 100,
    //       bloodPressure: 140,
    //       oxygenRate: 97,
    //       status: "ปกติ"),
    //   User(
    //       hn: "HN10002",
    //       name: "พรพิมล แก้วใส",
    //       gender: "หญิง",
    //       age: "37",
    //       roomNumber: "10",
    //       bedNumber: "3",
    //       temperature: 38,
    //       respirationRate: 20,
    //       heartRate: 59,
    //       bloodPressure: 120,
    //       oxygenRate: 95,
    //       status: "ผิดปกติ"),
    //   User(
    //       hn: "HN10003",
    //       name: "ทวีศักดิ์ สายวงศ์",
    //       gender: "ชาย",
    //       age: "38",
    //       roomNumber: "9",
    //       bedNumber: "2",
    //       temperature: 36,
    //       respirationRate: 24,
    //       heartRate: 91,
    //       bloodPressure: 130,
    //       oxygenRate: 99,
    //       status: "ผิดปกติ"),
    // ];
  }
}
