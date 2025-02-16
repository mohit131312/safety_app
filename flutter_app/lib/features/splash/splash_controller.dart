import 'dart:developer';

import 'package:flutter_app/features/login/login_screen.dart';
import 'package:flutter_app/features/select_role/select_role.dart';
import 'package:flutter_app/utils/api_client.dart';
import 'package:flutter_app/utils/logout_user.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () {
      _checkLoginStatus();
    });
  }

  _checkLoginStatus() async {
    try {
      log("token is ${ApiClient.gs.read('token')}");
      log("login is ${ApiClient.gs.read('login')}");

      if (ApiClient.gs.read('login') == true) {
        if (logStatus == true) {
          Get.offAll(SelectRole());
          log("select Role ");
        }
      } else {
        Get.offAll(LoginScreen());
        log("login  ");
      }
    } catch (e) {
      Get.offAll(LoginScreen());
      log("login  ");
    }
  }
}
