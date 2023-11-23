import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/user_prefrence/user_prefrence_controller.dart';

import '../../../models/login/user_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  UserPrefrence userPrefrence = UserPrefrence();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };

    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utils.snackBar("Login", value['error']);
      } else {
        UserModel userModel = UserModel(
          token: value['token'],
          isLogin: true,
        );

        userPrefrence.saveUser(userModel).then((value) {
          Get.toNamed(RoutesName.homeView);
        }).onError((error, stackTrace) {});
        Utils.snackBar("Login", "Login Successfully");
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
