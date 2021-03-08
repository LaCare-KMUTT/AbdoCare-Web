import 'package:AbdoCare_Web/models/post_home_list_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';

class PostHomeViewModel {
  PostHomeViewModel() {
    // _initialize();
  }
  final _firebaseService = locator<IFirebaseService>();
  List<PostHomeData> userList = [];

  Future<void> _initialize() async {
    var postHomeList = await _firebaseService.getPostHomeList();
    postHomeList.forEach((mapData) {
      userList.add(PostHomeData(map: mapData));
    });
  }

  Future<List<PostHomeData>> getUsers() async {
    if (userList.length == 0) {
      await _initialize();
    }
    return userList;
  }

  List<PostHomeData> sortBy(String key, bool isAsc) {
    switch (key) {
      case 'painScore':
        userList.sort((a, b) => a.painScore.compareTo(b.painScore));
        break;
      case 'woundImg':
        userList.sort((a, b) => a.woundImg.compareTo(b.woundImg));
        break;
    }
    if (isAsc) {
      userList = userList.reversed.toList();
    }

    return userList;
  }
}
