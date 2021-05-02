import 'package:AbdoCare_Web/models/notification_list/notification_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';

class NotiViewModel {
  NotiViewModel();
  final _firebaseService = locator<IFirebaseService>();
  List<NotiData> userList = [];

  Future<void> _initialize(String patientState) async {
    var allNotiList =
        await _firebaseService.getNotification(patientState: patientState);
    print('initList');
    if (allNotiList != null) {
      allNotiList.forEach((mapData) {
        userList.add(NotiData(map: mapData));
        sortBy("formDateTimeSort", true);
        sortBy("seen", true);
      });
    }
  }

  Future<List<NotiData>> getUsers(String patientState) async {
    userList.clear();
    await _initialize(patientState);
    userList.forEach((element) {});
    return userList;
  }

  List<NotiData> sortBy(String key, bool isAsc) {
    switch (key) {
      case 'seen':
        userList.sort((a, b) => a.seen.compareTo(b.seen));
        break;
      case 'formDateTimeSort':
        userList
            .sort((a, b) => a.formDateTimeSort.compareTo(b.formDateTimeSort));
        break;
    }
    if (isAsc) {
      userList = userList.reversed.toList();
    }

    return userList;
  }
}
