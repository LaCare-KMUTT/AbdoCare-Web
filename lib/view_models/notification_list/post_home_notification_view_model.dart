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
      });
    }
  }

  Future<List<PostHomeNotiData>> getUsers() async {
    if (userList.isEmpty) await _initialize();
    userList.forEach((element) {});
    return userList;
  }
}
