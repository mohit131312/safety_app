import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SafetyViolationDetailsController extends GetxController {
  var violationimg = <XFile>[];

  var violationImageCount = 0.obs;

  final maxPhotos = 5;

  Future<void> pickViolationImages() async {
    final ImagePicker picker = ImagePicker();

    if (violationimg.length < maxPhotos) {
      int remainingSlots = maxPhotos - violationimg.length;

      final List<XFile> pickedFiles = await picker.pickMultiImage();

      final List<XFile> limitedFiles =
          pickedFiles.take(remainingSlots).toList();

      violationimg.addAll(limitedFiles);
      violationImageCount.value = violationimg.length; // ✅ Correct update

      log('-----------incidentImageCount------------$violationImageCount');
      log('-----------incidentimg-------------${violationimg.length}');
    }
  }

  void removeViolationImage(int index) {
    if (index >= 0 && index < violationimg.length) {
      violationimg.removeAt(index);
      violationImageCount.value = violationimg.length;

      log('Removed image at index $index from incidentimg. Remaining: ${violationImageCount.value}');
    }
  }

  ////////////
  ///

  var selectedidProoftype = ''.obs; // Observable for Blood Group selection
  final List<String> idprooftype = [
    'A+',
    'A-',
    'B+',
    'B-',
  ];
//----------------------------------------------
  @override
  void onInit() {
    super.onInit();
    filteredDetailsIncident.assignAll(checklistIncident);
    filteredDetailsAow.assignAll(checklistAow);
  }

  var selectedIncident = ''.obs;

  var searchQueryIncident = ''.obs;
  var filteredDetailsIncident = [].obs;
  final TextEditingController searchControllerIncident =
      TextEditingController();

  List<Map<String, dynamic>> getSelectedIncident() {
    return List<Map<String, dynamic>>.from(
      filteredDetailsIncident.where((item) => item['isChecked'] == true),
    );
  }

  var Incidents = RxList<String>([
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
  var checklistIncident = [
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

  void toggleCheckboxIncident(int index) {
    filteredDetailsIncident[index]['isChecked'] =
        !filteredDetailsIncident[index]['isChecked'];
    filteredDetailsIncident.refresh();
  }

  void searchDataIncident(String query) {
    searchQueryIncident.value = query;
    if (query.isEmpty) {
      filteredDetailsIncident.assignAll(checklistIncident);
    } else {
      filteredDetailsIncident.assignAll(
        filteredDetailsIncident
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  //--------------------------
  var selectedAow = ''.obs;

  var searchQueryAow = ''.obs;
  var filteredDetailsAow = [].obs;
  final TextEditingController searchControllerAow = TextEditingController();

  List<Map<String, dynamic>> getSelectedAow() {
    return List<Map<String, dynamic>>.from(
      filteredDetailsAow.where((item) => item['isChecked'] == true),
    );
  }

  var aow = RxList<String>([
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
  var checklistAow = [
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

  void toggleCheckboxAow(int index) {
    filteredDetailsAow[index]['isChecked'] =
        !filteredDetailsAow[index]['isChecked'];
    filteredDetailsAow.refresh();
  }

  void searchDataAow(String query) {
    searchQueryIncident.value = query;
    if (query.isEmpty) {
      filteredDetailsAow.assignAll(checklistAow);
    } else {
      filteredDetailsAow.assignAll(
        filteredDetailsAow
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  TextEditingController incidentController = TextEditingController();

  var selectViolation = ''.obs; // Observable for Blood Group selection
  final List<String> violation = [
    'A',
    'B',
    'AB',
    'O',
  ];
  var selectCategory = ''.obs; // Observable for Blood Group selection
  final List<String> category = [
    'A',
    'B',
    'AB',
    'O',
  ];

  var selectBreach = ''.obs; // Observable for Blood Group selection
  final List<String> breach = [
    'A',
    'B',
    'AB',
    'O',
  ];
  var selectObservation = ''.obs; // Observable for Blood Group selection
  final List<String> observation = [
    'A',
    'B',
    'AB',
    'O',
  ];
  var selectRisklevel = ''.obs; // Observable for Blood Group selection
  final List<String> risklevel = [
    'A',
    'B',
    'AB',
    'O',
  ];

  TextEditingController detailsController = TextEditingController();
  TextEditingController turnArounttimeController = TextEditingController();
  TextEditingController loactionofBreachController = TextEditingController();
}
