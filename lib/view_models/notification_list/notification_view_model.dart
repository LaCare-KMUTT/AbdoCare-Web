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
        sortTableData();
      });
    }
  }

  Future<List<NotiData>> getUsers(String patientState) async {
    userList.clear();
    await _initialize(patientState);
    userList.forEach((element) {});
    return userList;
  }

  List<NotiData> sortTableData() {
    userList.sort((a, b) {
      var cmp = b.seen.compareTo(a.seen);
      if (cmp != 0) return cmp;
      return a.formDateTimeSort.compareTo(b.formDateTimeSort);
    });

    return userList;
  }
}
