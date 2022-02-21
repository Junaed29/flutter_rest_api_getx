import 'package:flutter/material.dart';
import 'package:flutter_rest_api_getx/screen/user_screen/user_screen_logic.dart';
import 'package:get/get.dart';

import '../../widgets/staggered_grid_view.dart';

class UserScreenComponent extends StatelessWidget {
  const UserScreenComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userController = Get.find<UserScreenLogic>();
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX REST Api'),
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return CustomStaggeredGridView(
          list: userController.userList.value,
        );
      }),
    );
  }
}
