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
      });
    }
  }

  Future<List<AllNotiData>> getUsers() async {
    if (userList.isEmpty) await _initialize();
    userList.forEach((element) {});
    return userList;
  }
}
