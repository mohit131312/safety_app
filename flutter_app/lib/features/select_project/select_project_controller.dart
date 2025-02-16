import 'dart:developer';

import 'package:flutter_app/utils/global_api_call.dart';
import 'package:get/get.dart';

import 'select_project_model.dart';

class SelectProjectController extends GetxController {
  RxBool isCircleBlack = false.obs;
  RxBool isLoading = false.obs;
  void toggleCircleColor() {
    isCircleBlack.value = !isCircleBlack.value;
  }

  // Future globApiCall(map) async {
  //   var response = await RemoteServices.postMethodWithToken(
  //       'get_assign_safety_project', map);

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> responseData = jsonDecode(response.body);
  //     if (responseData['status'] == false) {
  //       if (responseData['message'] == "User not found") {
  //         //redirect to login
  //       } else {
  //         // data not found or emty response
  //       }
  //     } else {
  //       return responseData;
  //     }
  //   } else {
  //     // server error
  //   }
  // }

  List<ProjectData> selectProject = [];
  Future getProjectDetails(userId, roleId) async {
    try {
      Map<String, dynamic> map = {"role_id": roleId, "user_id": userId};

      print("Request body: $map");

      var responseData = await globApiCall('get_assign_safety_project', map);

      // var response = await RemoteServices.postMethodWithToken(
      //     'get_assign_safety_project', map);

      // if (response.statusCode == 200) {
      //   Map<String, dynamic> responseData = jsonDecode(response.body);
      //   print('----------responseData$responseData');

      // logStatus = responseData['status'] ?? false;
      // print('---------------- Status: $logStatus');

      selectProject = (responseData['data'] as List<dynamic>)
          .map((e) => ProjectData.fromJson(e as Map<String, dynamic>))
          .toList();

      print('----------data$selectProject');
      log('----------data${selectProject.length}');
      // } else {
      //   print("Login Failed: ${response.body}");
      // }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false; // Hide loader
    }
  }
}
