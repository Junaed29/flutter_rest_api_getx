import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_screen/login_screen_view.dart';
import 'user_screen/user_screen_logic.dart';
import 'user_screen/user_screen_view.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Button"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.find<UserScreenLogic>().fetchData();
                Get.to(UserScreenComponent());
              },
              child: Text("User Details"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.find<UserScreenLogic>().fetchData();
                Get.to(LoginScreen());
              },
              child: const Text("User Login"),
            ),
          ],
        ),
      ),
    );
  }
}
