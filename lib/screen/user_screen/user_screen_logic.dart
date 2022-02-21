import 'package:flutter_rest_api_getx/network/NetworkControl.dart';
import 'package:get/get.dart';

import '../../model/User.dart';

class UserScreenLogic extends GetxController {
  var userList = <User>[].obs;
  var isLoading = true.obs;

  final NetworkControl _networkControl = NetworkControl();

  @override
  void onReady() {
    fetchData();
    super.onReady();
  }

  void fetchData() async {
    isLoading.value = true;
    List<User>? fetchUserList = await _networkControl.getUserList();
    if (fetchUserList != null) {
      print(fetchUserList.length);
      userList.value = fetchUserList;
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
