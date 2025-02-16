import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkPermitPrecautionController extends GetxController {
  RxBool isCheckedHazards = false.obs;
  var searchQueryHazards = ''.obs;
  var filteredDetailsHazards = [].obs;
  final TextEditingController searchHazardsController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    filteredDetailsHazards.assignAll(checklistHazards);
    filteredDetailsPrecaution.assignAll(checklistPrecaution);
    filteredDetailsPPE.assignAll(checklistPPE);
    filteredDetailsTE.assignAll(checklistTE);
  }

  List<Map<String, dynamic>> getSelectedHazards() {
    return List<Map<String, dynamic>>.from(
      filteredDetailsHazards.where((item) => item['isChecked'] == true),
    );
  }

  var checklistHazards = [
    {'title': 'Engagement of untrained workers', 'isChecked': false},
    {'title': 'Improper Stacking', 'isChecked': false},
    {'title': 'Face Shield', 'isChecked': false},
    {'title': 'Awkward Posture', 'isChecked': false},
  ];

  void toggleCheckboxHazards(int index) {
    filteredDetailsHazards[index]['isChecked'] =
        !filteredDetailsHazards[index]['isChecked'];
    filteredDetailsHazards.refresh();
  }

  void toggleSelectAllHazards() {
    bool newValue = !isCheckedHazards.value;
    isCheckedHazards.value = newValue;

    for (var item in filteredDetailsHazards) {
      item['isChecked'] = newValue;
    }
    filteredDetailsHazards.refresh();
  }

  void searchDataHazards(String query) {
    searchQueryHazards.value = query;
    if (query.isEmpty) {
      filteredDetailsHazards.assignAll(checklistHazards);
    } else {
      filteredDetailsHazards.assignAll(
        filteredDetailsHazards
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  //Precautions in Place  *

  RxBool isCheckedPrecaution = false.obs;
  var searchQueryPrecaution = ''.obs;
  var filteredDetailsPrecaution = [].obs;
  final TextEditingController searchPrecautionController =
      TextEditingController();

  List<Map<String, dynamic>> getSelectedPrecaution() {
    return List<Map<String, dynamic>>.from(
      filteredDetailsPrecaution.where((item) => item['isChecked'] == true),
    );
  }

  var checklistPrecaution = [
    {'title': 'Engagement of untrained workers', 'isChecked': false},
    {'title': 'Improper Stacking', 'isChecked': false},
    {'title': 'Face Shield', 'isChecked': false},
  ];

  void toggleCheckboxPrecaution(int index) {
    filteredDetailsPrecaution[index]['isChecked'] =
        !filteredDetailsPrecaution[index]['isChecked'];
    filteredDetailsPrecaution.refresh();
  }

  void toggleSelectAllPrecaution() {
    bool newValue = !isCheckedPrecaution.value;
    isCheckedPrecaution.value = newValue;

    for (var item in filteredDetailsPrecaution) {
      item['isChecked'] = newValue;
    }
    filteredDetailsPrecaution.refresh();
  }

  void searchDataPrecaution(String query) {
    searchQueryPrecaution.value = query;
    if (query.isEmpty) {
      filteredDetailsPrecaution.assignAll(checklistPrecaution);
    } else {
      filteredDetailsPrecaution.assignAll(
        filteredDetailsPrecaution
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  RxBool isCheckedPPE = false.obs;
  var searchQueryPPE = ''.obs;
  var filteredDetailsPPE = [].obs;
  final TextEditingController searchPPEController = TextEditingController();

  List<Map<String, dynamic>> getSelectedPPE() {
    return List<Map<String, dynamic>>.from(
      filteredDetailsPPE.where((item) => item['isChecked'] == true),
    );
  }

  var checklistPPE = [
    {'title': 'Engagement of untrained workers', 'isChecked': false},
    {'title': 'Improper Stacking', 'isChecked': false},
    {'title': 'Face Shield', 'isChecked': false},
    {'title': 'Awkward Posture', 'isChecked': false},
  ];

  void toggleCheckboxPPE(int index) {
    filteredDetailsPPE[index]['isChecked'] =
        !filteredDetailsPPE[index]['isChecked'];
    filteredDetailsPPE.refresh();
  }

  void toggleSelectAllPPE() {
    bool newValue = !isCheckedPPE.value;
    isCheckedPPE.value = newValue;

    for (var item in filteredDetailsPPE) {
      item['isChecked'] = newValue;
    }
    filteredDetailsPPE.refresh();
  }

  void searchDataPPE(String query) {
    searchQueryPPE.value = query;
    if (query.isEmpty) {
      filteredDetailsPPE.assignAll(checklistPPE);
    } else {
      filteredDetailsPPE.assignAll(
        filteredDetailsPPE
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

//Precautions in Place  *

  RxBool isCheckedTE = false.obs;
  var searchQueryTE = ''.obs;
  var filteredDetailsTE = [].obs;
  final TextEditingController searchTEController = TextEditingController();

  List<Map<String, dynamic>> getSelectedTE() {
    return List<Map<String, dynamic>>.from(
      filteredDetailsTE.where((item) => item['isChecked'] == true),
    );
  }

  var checklistTE = [
    {'title': 'Engagement of untrained workers', 'isChecked': false},
    {'title': 'Improper Stacking', 'isChecked': false},
  ];

  void toggleCheckboxTE(int index) {
    filteredDetailsTE[index]['isChecked'] =
        !filteredDetailsTE[index]['isChecked'];
    filteredDetailsTE.refresh();
  }

  void toggleSelectAllTE() {
    bool newValue = !isCheckedTE.value;
    isCheckedTE.value = newValue;

    for (var item in filteredDetailsTE) {
      item['isChecked'] = newValue;
    }
    filteredDetailsTE.refresh();
  }

  void searchDataTE(String query) {
    searchQueryTE.value = query;
    if (query.isEmpty) {
      filteredDetailsTE.assignAll(checklistTE);
    } else {
      filteredDetailsTE.assignAll(
        filteredDetailsTE
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }
}
