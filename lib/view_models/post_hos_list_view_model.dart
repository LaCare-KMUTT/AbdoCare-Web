import 'package:AbdoCare_Web/models/post_hos_list_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';

class PostHosViewModel {
  PostHosViewModel() {
    // _initialize();
  }
  final _firebaseService = locator<IFirebaseService>();
  List<PostHosData> userList = [];

  Future<void> _initialize() async {
    var postHosList = await _firebaseService.getPostHosList();
    if (postHosList != null) {
      postHosList.forEach((mapData) {
        userList.add(PostHosData(map: mapData));
      });
    }
  }

  Future<List<PostHosData>> getUsers() async {
    userList.clear();
    print(userList.length);
    await _initialize();
    return userList;
  }

  List<PostHosData> sortBy(String key, bool isAsc) {
    switch (key) {
      case 'temperature':
        userList.sort((a, b) => a.temperature.compareTo(b.temperature));
        break;
      case 'respirationRate':
        userList.sort((a, b) => a.respirationRate.compareTo(b.respirationRate));
        break;
      case 'heartRate':
        userList.sort((a, b) => a.heartRate.compareTo(b.heartRate));
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
