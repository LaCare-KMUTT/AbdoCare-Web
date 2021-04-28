import 'package:AbdoCare_Web/models/notification_list/post_home_notification_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';

class PostHomeNotiViewModel {
  PostHomeNotiViewModel();
  final _firebaseService = locator<IFirebaseService>();
  List<PostHomeNotiData> userList = [];

  Future<void> _initialize() async {
    var postHomeNotiList = await _firebaseService.getPostHomeNotificationList();
    print('initList');
    if (postHomeNotiList != null) {
      postHomeNotiList.forEach((mapData) {
        userList.add(PostHomeNotiData(map: mapData));
        sortBy("formDateTimeSort", true);
        sortBy("seen", true);
      });
    }
  }

  Future<List<PostHomeNotiData>> getUsers() async {
    userList.clear();
    await _initialize();
    userList.forEach((element) {});
    return userList;
  }

  List<PostHomeNotiData> sortBy(String key, bool isAsc) {
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
