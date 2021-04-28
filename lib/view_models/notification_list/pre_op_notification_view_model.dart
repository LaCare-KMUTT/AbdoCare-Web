import 'package:AbdoCare_Web/models/notification_list/pre_op_notification_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';

class PreOpNotiViewModel {
  PreOpNotiViewModel();
  final _firebaseService = locator<IFirebaseService>();
  List<PreOpNotiData> userList = [];

  Future<void> _initialize() async {
    var preOpNotiList = await _firebaseService.getPreOpNotificationList();
    print('initList');
    if (preOpNotiList != null) {
      preOpNotiList.forEach((mapData) {
        userList.add(PreOpNotiData(map: mapData));
        sortBy("formDateTimeSort", true);
        sortBy("seen", true);
      });
    }
  }

  Future<List<PreOpNotiData>> getUsers() async {
    userList.clear();
    await _initialize();
    userList.forEach((element) {});
    return userList;
  }

  List<PreOpNotiData> sortBy(String key, bool isAsc) {
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
