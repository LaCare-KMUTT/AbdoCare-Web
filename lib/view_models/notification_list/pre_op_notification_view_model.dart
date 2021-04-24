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
      });
    }
  }

  Future<List<PreOpNotiData>> getUsers() async {
    if (userList.isEmpty) await _initialize();
    userList.forEach((element) {});
    return userList;
  }
}
