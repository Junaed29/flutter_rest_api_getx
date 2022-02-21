import 'package:get/get.dart';

import '../screen/user_screen/user_screen_logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserScreenLogic());
  }
}
