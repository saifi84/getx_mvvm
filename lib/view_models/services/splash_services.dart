import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_prefrence/user_prefrence_controller.dart';

class SplashServices {
  UserPrefrence userPreference = UserPrefrence();

  void isLogin() {
    userPreference.getUser().then((value) {
      print(value.token);
      print(value.isLogin);

      if (value.isLogin != null && value.isLogin! != false) {
        Timer(
            const Duration(seconds: 2), () => Get.toNamed(RoutesName.homeView));
      } else {
        Timer(const Duration(seconds: 2),
            () => Get.toNamed(RoutesName.loginView));
      }
    }).catchError((error) {
      print("Error in isLogin: $error");
      Timer(
          const Duration(seconds: 2), () => Get.toNamed(RoutesName.loginView));
    });
  }
}
