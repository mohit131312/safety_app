import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewWorkPermitController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    filteredDetailsPermit.assignAll(checklistPermit);
    filteredDetailsBuilding.assignAll(checklistBuilding);
    filteredDetailsFloor.assignAll(checklistFloor);
  }

  var selectedcategory = ''.obs; // Observable for Blood Group selection
  final List<String> category = [
    'A',
    'B',
    'AB',
    'O',
  ];
  var selectedtoolboxtrainig = ''.obs; // Observable for Blood Group selection
  final List<String> toolboxtrainig = [
    'A',
    'B',
    'AB',
    'O',
  ];
  var selectedBuilding = ''.obs;

  var selectedFloor = ''.obs;
  var buildings = RxList<String>([
    'A13 Wing',
    'A12 Wing',
    'A11 Wing',
    'A10 Wing',
    'A9 Wing',
    'A8 Wing',
    'A7 Wing',
    'A6 Wing',
    'A5 Wing',
    'A4 Wing',
    'A3 Wing',
    'A2 Wing',
    'A1 Wing',
  ]);

  final List<String> floors = [
    '11th Floor',
    '10th Floor',
    '9th Floor',
    '8th Floor',
    '7th Floor',
    '6th Floor',
    '5th Floor',
    '4th Floor',
    '3rd Floor',
    '2nd Floor',
    '1st Floor'
  ];

  TextEditingController descWorkrController = TextEditingController();
  TextEditingController nameworkpermitController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  //---------------
  RxBool isCheckedPermit = false.obs;
  var searchQueryPermit = ''.obs;
  var filteredDetailsPermit = [].obs;
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> getSelectedEquipment() {
    return List<Map<String, dynamic>>.from(
      filteredDetailsPermit.where((item) => item['isChecked'] == true),
    );
  }

  var checklistPermit = [
    {'title': 'Document Name', 'isChecked': false},
    {'title': 'Document Name', 'isChecked': false},
    {'title': 'Document Name', 'isChecked': false},
  ];

  void toggleCheckbox(int index) {
    filteredDetailsPermit[index]['isChecked'] =
        !filteredDetailsPermit[index]['isChecked'];
    filteredDetailsPermit.refresh();
  }

  void toggleSelectAll() {
    bool newValue = !isCheckedPermit.value;
    isCheckedPermit.value = newValue;

    for (var item in filteredDetailsPermit) {
      item['isChecked'] = newValue;
    }
    filteredDetailsPermit.refresh();
  }

  void searchData(String query) {
    searchQueryPermit.value = query;
    if (query.isEmpty) {
      filteredDetailsPermit.assignAll(checklistPermit);
    } else {
      filteredDetailsPermit.assignAll(
        filteredDetailsPermit
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  //-----------------------------select building

  var searchQueryBuilding = ''.obs;
  var filteredDetailsBuilding = [].obs;
  final TextEditingController searchControllerBuilding =
      TextEditingController();

  List<Map<String, dynamic>> getSelectedBuilding() {
    return List<Map<String, dynamic>>.from(
      filteredDetailsBuilding.where((item) => item['isChecked'] == true),
    );
  }

  var checklistBuilding = [
    {'title': 'A13 Wing', 'isChecked': false},
    {'title': 'A12 Wing', 'isChecked': false},
    {'title': 'A11 Wing', 'isChecked': false},
    {'title': 'A13 Wing', 'isChecked': false},
    {'title': 'A12 Wing', 'isChecked': false},
    {'title': 'A11 Wing', 'isChecked': false},
    {'title': 'A13 Wing', 'isChecked': false},
    {'title': 'A12 Wing', 'isChecked': false},
    {'title': 'A11 Wing', 'isChecked': false},
    {'title': 'A13 Wing', 'isChecked': false},
    {'title': 'A12 Wing', 'isChecked': false},
    {'title': 'A11 Wing', 'isChecked': false},
  ];

  void toggleCheckboxBuilding(int index) {
    filteredDetailsBuilding[index]['isChecked'] =
        !filteredDetailsBuilding[index]['isChecked'];
    filteredDetailsBuilding.refresh();
  }

  void searchDataBuilding(String query) {
    searchQueryBuilding.value = query;
    if (query.isEmpty) {
      filteredDetailsBuilding.assignAll(checklistBuilding);
    } else {
      filteredDetailsBuilding.assignAll(
        filteredDetailsBuilding
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  //---------------------------------------

  //select floor

  var searchQueryFloor = ''.obs;
  var filteredDetailsFloor = [].obs;
  final TextEditingController searchControllerFloor = TextEditingController();

  List<Map<String, dynamic>> getSelectedFloor() {
    return List<Map<String, dynamic>>.from(
      filteredDetailsFloor.where((item) => item['isChecked'] == true),
    );
  }

  var checklistFloor = [
    {'title': '11th Floor', 'isChecked': false},
    {'title': '13th Floor', 'isChecked': false},
    {'title': '13th Floor', 'isChecked': false},
    {'title': '11th Floor', 'isChecked': false},
    {'title': '13th Floor', 'isChecked': false},
    {'title': '13th Floor', 'isChecked': false},
    {'title': '11th Floor', 'isChecked': false},
    {'title': '13th Floor', 'isChecked': false},
    {'title': '13th Floor', 'isChecked': false},
    {'title': '11th Floor', 'isChecked': false},
    {'title': '13th Floor', 'isChecked': false},
    {'title': '13th Floor', 'isChecked': false},
  ];

  void toggleCheckboxFloor(int index) {
    filteredDetailsFloor[index]['isChecked'] =
        !filteredDetailsFloor[index]['isChecked'];
    filteredDetailsFloor.refresh();
  }

  void searchDataFloor(String query) {
    searchQueryFloor.value = query;
    if (query.isEmpty) {
      filteredDetailsFloor.assignAll(checklistFloor);
    } else {
      filteredDetailsFloor.assignAll(
        filteredDetailsFloor
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }
}//

