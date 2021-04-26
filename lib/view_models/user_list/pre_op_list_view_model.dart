import 'package:AbdoCare_Web/models/user_list/pre_op_list_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';

class PreOpViewModel {
  PreOpViewModel();
  final _firebaseService = locator<IFirebaseService>();
  List<PreOpData> userList = [];

  Future<void> _initialize() async {
    var preOpList = await _firebaseService.getPreOpList();
    print('initList');
    if (preOpList != null) {
      preOpList.forEach((mapData) {
        userList.add(PreOpData(map: mapData));
        sortBy('status', true);
      });
    }
  }

  Future<List<PreOpData>> getUsers() async {
    if (userList.isEmpty) await _initialize();
    userList.forEach((element) {
      print(element.name);
    });
    return userList;
  }

  List<PreOpData> sortBy(String key, bool isAsc) {
    switch (key) {
      case 'temperature':
        userList.sort((a, b) => a.temperature.compareTo(b.temperature));
        break;
      case 'respirationRate':
        userList.sort((a, b) => a.respirationRate.compareTo(b.respirationRate));
        break;
      case 'pulseRate':
        userList.sort((a, b) => a.pulseRate.compareTo(b.pulseRate));
        break;
      case 'bloodPressure':
        userList.sort((a, b) => a.bloodPressure.compareTo(b.bloodPressure));
        break;
      case 'oxygenRate':
        userList.sort((a, b) => a.oxygenRate.compareTo(b.oxygenRate));
        break;
      case 'status':
        userList.sort((a, b) => a.status.compareTo(b.status));
        break;
    }
    if (isAsc) {
      userList = userList.reversed.toList();
    }

    return userList;
  }
}
