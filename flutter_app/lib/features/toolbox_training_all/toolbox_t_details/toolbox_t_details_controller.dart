import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolboxTDetailsController extends GetxController {
  var selectedActivity = ''.obs;
  var selectedWorkPermit = ''.obs;
  RxBool isChecked = false.obs;
  var searchQuery = ''.obs;
  var filteredDetails = [].obs;

  final TextEditingController tbtController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    filteredDetails.assignAll(checklist);
  }

  List<String> activities = ['Activity 1', 'Activity 2', 'Activity 3'];
  List<String> workPermits = ['Permit A', 'Permit B', 'Permit C'];

  var checklist = [
    {
      'title':
          'Issues Height work permits after adequately assessing the risks in the proposed work area',
      'isChecked': false
    },
    {
      'title':
          'Issues Height work permits after adequately assessing the risks in the proposed work area',
      'isChecked': false
    },
    {
      'title':
          'Issues Height work permits after adequately assessing the risks in the proposed work area',
      'isChecked': false
    },
    {
      'title':
          'Issues Height work permits after adequately assessing the risks in the proposed work area',
      'isChecked': false
    },
    {
      'title':
          'Issues Height work permits after adequately assessing the risks in the proposed work area',
      'isChecked': false
    },
    {
      'title':
          'Issues Height work permits after adequately assessing the risks in the proposed work area',
      'isChecked': false
    },
    {
      'title':
          'Issues Height work permits after adequately assessing the risks in the proposed work area',
      'isChecked': false
    },
    {
      'title':
          'Issues Height work permits after adequately assessing the risks in the proposed work area',
      'isChecked': false
    },
    {'title': 'Data', 'isChecked': false}
  ];

  void toggleCheckbox(int index) {
    filteredDetails[index]['isChecked'] = !filteredDetails[index]['isChecked'];
    filteredDetails.refresh();
  }

  void toggleSelectAll() {
    bool newValue = !isChecked.value;
    isChecked.value = newValue;

    for (var item in filteredDetails) {
      item['isChecked'] = newValue;
    }
    filteredDetails.refresh();
  }

  void updateSelectAllCheckbox() {
    bool allChecked =
        filteredDetails.every((item) => item['isChecked'] == true);
    isChecked.value = allChecked;
  }

  List<Map<String, dynamic>> getSelectedtoolbox() {
    return List<Map<String, dynamic>>.from(
      filteredDetails.where((item) => item['isChecked'] == true),
    );
  }

  void searchData(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredDetails.assignAll(checklist);
    } else {
      filteredDetails.assignAll(
        filteredDetails
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }
}
