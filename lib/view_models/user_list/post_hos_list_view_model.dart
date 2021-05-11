import 'package:AbdoCare_Web/models/user_list/post_hos_list_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';

class PostHosViewModel {
  PostHosViewModel();
  final _firebaseService = locator<IFirebaseService>();
  List<PostHosData> userList = [];

  Future<void> _initialize() async {
    var postHosList = await _firebaseService.getPostHosList();
    print('initList');
    if (postHosList != null) {
      postHosList.forEach((mapData) {
        userList.add(PostHosData(map: mapData));
      });
      sortBy('status', true);
    }
  }

  Future<List<PostHosData>> getUsers() async {
    // userList.clear();
    if (userList.isEmpty) await _initialize();
    print('getUsers is called');
    userList.forEach((element) {
      print('In view Model ${element.name}');
    });

    return userList;
  }

  List<PostHosData> sortBy(String key, bool isAsc) {
    print('Key = $key, Bool = $isAsc');
    switch (key) {
      case 'temperature':
        userList.sort((a, b) =>
            a.temperature.toString().compareTo(b.temperature.toString()));
        break;
      case 'respirationRate':
        userList.sort((a, b) => a.respirationRate
            .toString()
            .compareTo(b.respirationRate.toString()));
        break;
      case 'pulseRate':
        userList.sort(
            (a, b) => a.pulseRate.toString().compareTo(b.pulseRate.toString()));
        break;
      case 'bloodPressure':
        userList.sort((a, b) =>
            a.bloodPressure.toString().compareTo(b.bloodPressure.toString()));
        break;
      case 'oxygenRate':
        userList.sort((a, b) =>
            a.oxygenRate.toString().compareTo(b.oxygenRate.toString()));
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
