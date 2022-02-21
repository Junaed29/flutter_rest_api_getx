import 'dart:convert';

import 'package:get/get.dart';

import '../model/User.dart';

class NetworkControl extends GetConnect {
  Future<List<User>?> getUserList() async {
    var response = await get("https://jsonplaceholder.typicode.com/users");
    var userList = <User>[];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.bodyString!);
      for (Map i in data) {
        userList.add(User.fromJson(i));
      }
      return userList;
    } else {
      return null;
    }
  }
}
