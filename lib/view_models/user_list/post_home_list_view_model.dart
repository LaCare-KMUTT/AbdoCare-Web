import 'package:AbdoCare_Web/models/user_list/post_home_list_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';

class PostHomeViewModel {
  PostHomeViewModel();
  final _firebaseService = locator<IFirebaseService>();
  List<PostHomeData> userList = [];
  List<PostHomeData> storedList = [];

  Future<void> _initialize() async {
    var postHomeList = await _firebaseService.getPostHomeList();
    postHomeList.forEach((mapData) {
      userList.add(PostHomeData(map: mapData));
      storedList.add(PostHomeData(map: mapData));
    });
    sortBy('woundImg', true);
  }

  Future<List<PostHomeData>> getUsers() async {
    if (userList.isEmpty && storedList.isEmpty) await _initialize();
    return userList;
  }

  void sortBy(String key, bool isAsc) {
    userList.sort((a, b) => b.woundImg.compareTo(a.woundImg));
    switch (key) {
      case 'painScore':
        userList.sort(
            (a, b) => a.painScore.toString().compareTo(b.painScore.toString()));
        break;
      case 'woundImg':
        userList.sort(
            (a, b) => a.woundImg.toString().compareTo(b.woundImg.toString()));
        break;
    }
    if (isAsc) {
      userList = userList.reversed.toList();
    }
  }

  void search(String value) {
    userList = storedList;
    userList = userList.where((element) => element.hn.contains(value)).toList();
  }
}
