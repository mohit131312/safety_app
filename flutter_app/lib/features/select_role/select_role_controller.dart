import 'dart:developer';

import 'package:flutter_app/utils/api_client.dart';
import 'package:get/get.dart';

import 'select_role_model.dart';

class SelectRoleController extends GetxController {
  var selectedIndex = (-1).obs;

  void selectItem(int index) {
    selectedIndex.value = index;
  }

  List<RolesArray> roleArray = [];
  Map<String, dynamic> selectRoleMap = {};
  @override
  void onInit() {
    super.onInit();

    selectRoleMap = ApiClient.gs.read('SelectRoleMap') ?? {};

    if (selectRoleMap.isNotEmpty) {
      log('SelectRoleMap: ${selectRoleMap.toString()}');
      log('selectRoleMap lenght ${selectRoleMap.length}');
      roleArray = (selectRoleMap['roles_array'] as List<dynamic>)
          .map((e) => RolesArray.fromJson(e as Map<String, dynamic>))
          .toList();
      log('selectRolearray lenght ${roleArray.length}');
    }
  }
}
