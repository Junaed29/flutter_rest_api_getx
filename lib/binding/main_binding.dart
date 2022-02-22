import 'package:get/get.dart';

import '../screen/login_screen/login_screen_logic.dart';
import '../screen/user_screen/user_screen_logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserScreenLogic());
    Get.lazyPut(() => LoginScreenLogic());
  }
}
