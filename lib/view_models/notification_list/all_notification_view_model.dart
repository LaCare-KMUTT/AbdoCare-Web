import 'package:AbdoCare_Web/models/notification_list/all_notification_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';

class AllNotiViewModel {
  AllNotiViewModel();
  final _firebaseService = locator<IFirebaseService>();
  List<AllNotiData> userList = [];

  Future<void> _initialize() async {
    var allNotiList = await _firebaseService.getAllNotificationList();
    print('initList');
    if (allNotiList != null) {
      allNotiList.forEach((mapData) {
        userList.add(AllNotiData(map: mapData));
        sortBy("formDateTimeSort", true);
        sortBy("seen", true);
      });
    }
  }

  Future<List<AllNotiData>> getUsers() async {
    userList.clear();
    await _initialize();
    userList.forEach((element) {});
    return userList;
  }

  List<AllNotiData> sortBy(String key, bool isAsc) {
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