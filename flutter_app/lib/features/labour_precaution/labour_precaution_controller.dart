import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabourPrecautionController extends GetxController {
  RxBool isCheckedEquipment = false.obs;
  var searchQueryEquiment = ''.obs;
  var filteredDetailsEquipment = [].obs;
  final TextEditingController searchController = TextEditingController();
  final TextEditingController searchControllerInstruction =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();
    filteredDetailsEquipment.assignAll(checklist);
    filteredDetailsInstruction.assignAll(checklistInstruction);
  }

  List<Map<String, dynamic>> getSelectedEquipment() {
    return List<Map<String, dynamic>>.from(
      filteredDetailsEquipment.where((item) => item['isChecked'] == true),
    );
  }

  List<Map<String, dynamic>> getSelectedInstruction() {
    return List<Map<String, dynamic>>.from(
      filteredDetailsInstruction.where((item) => item['isChecked'] == true),
    );
  }

  var checklist = [
    {'title': 'Safety Googles', 'isChecked': false},
    {'title': 'Ear Plug', 'isChecked': false},
    {'title': 'Face Shield', 'isChecked': false},
    {'title': 'Safety Shoes', 'isChecked': false},
    {'title': 'Safety Helmet', 'isChecked': false},
    {'title': 'Safety Jacket', 'isChecked': false},
  ];

  void toggleCheckbox(int index) {
    filteredDetailsEquipment[index]['isChecked'] =
        !filteredDetailsEquipment[index]['isChecked'];
    filteredDetailsEquipment.refresh();
  }

  void toggleSelectAll() {
    bool newValue = !isCheckedEquipment.value;
    isCheckedEquipment.value = newValue;

    for (var item in filteredDetailsEquipment) {
      item['isChecked'] = newValue;
    }
    filteredDetailsEquipment.refresh();
  }

  // void updateSelectAllCheckbox() {
  //   bool allChecked =
  //       filteredDetailsEquipment.every((item) => item['isChecked'] == true);
  //   isCheckedEquipment.value = allChecked;
  // }

  void searchData(String query) {
    searchQueryEquiment.value = query;
    if (query.isEmpty) {
      filteredDetailsEquipment.assignAll(checklist);
    } else {
      filteredDetailsEquipment.assignAll(
        filteredDetailsEquipment
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  //---------------------------Instruction Given

  RxBool isCheckedInstruction = false.obs;
  var searchQueryInstruction = ''.obs;
  var filteredDetailsInstruction = [].obs;

  var checklistInstruction = [
    {'title': 'Site Introduction', 'isChecked': false},
    {'title': 'General Safety', 'isChecked': false},
    {'title': 'Proper Use of PPEs', 'isChecked': false},
    {'title': 'Height Work', 'isChecked': false},
    {'title': 'Hot Work', 'isChecked': false},
    {'title': 'Incident/Accident Reporting', 'isChecked': false},
  ];

  void toggleCheckboxInstruction(int index) {
    filteredDetailsInstruction[index]['isChecked'] =
        !filteredDetailsInstruction[index]['isChecked'];
    filteredDetailsInstruction.refresh();
  }

  void toggleSelectInstructionAll() {
    bool newValue = !isCheckedInstruction.value;
    isCheckedInstruction.value = newValue;

    for (var item in filteredDetailsInstruction) {
      item['isChecked'] = newValue;
    }
    filteredDetailsInstruction.refresh();
  }

  // void updateSelectInstructionAllCheckbox() {
  //   bool allChecked =
  //       filteredDetailsInstruction.every((item) => item['isChecked'] == true);
  //   isCheckedInstruction.value = allChecked;
  // }

  void searchDataInstruction(String query) {
    searchQueryInstruction.value = query;
    if (query.isEmpty) {
      filteredDetailsInstruction.assignAll(checklistInstruction);
    } else {
      filteredDetailsInstruction.assignAll(
        checklistInstruction
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }
}
