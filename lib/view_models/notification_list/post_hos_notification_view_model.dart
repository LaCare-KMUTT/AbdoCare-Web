import 'package:AbdoCare_Web/models/notification_list/post_hos_notification_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';

class PostHosNotiViewModel {
  PostHosNotiViewModel();
  final _firebaseService = locator<IFirebaseService>();
  List<PostHosNotiData> userList = [];

  Future<void> _initialize() async {
    var postHosNotiList = await _firebaseService.getPostHosNotificationList();
    print('initList');
    if (postHosNotiList != null) {
      postHosNotiList.forEach((mapData) {
        userList.add(PostHosNotiData(map: mapData));
        sortBy("formDateTimeSort", true);
        sortBy("seen", true);
      });
    }
  }

  Future<List<PostHosNotiData>> getUsers() async {
    userList.clear();
    await _initialize();
    userList.forEach((element) {});
    return userList;
  }

  List<PostHosNotiData> sortBy(String key, bool isAsc) {
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
