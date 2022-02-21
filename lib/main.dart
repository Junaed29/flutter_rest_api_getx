import 'package:flutter/material.dart';
import 'package:flutter_rest_api_getx/binding/main_binding.dart';
import 'package:get/get.dart';

import 'screen/user_screen/user_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBinding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserScreenComponent(),
    );
  }
}
