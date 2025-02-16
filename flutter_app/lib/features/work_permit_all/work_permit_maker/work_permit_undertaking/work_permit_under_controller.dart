import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class WorkPermitUnderController extends GetxController {
  RxBool isCheckedUndertakingPermit = false.obs;
  var searchQueryUndertakingPermit = ''.obs;
  var filteredDetailsUndertakingPermit = [].obs;
  final TextEditingController searchControllerUndertakingPermit =
      TextEditingController();
  var isCheckedPermit = false.obs; // Observable variable

  void toggleCheckboxPermit() {
    isCheckedPermit.value = !isCheckedPermit.value; // Toggle value
  }

  @override
  void onInit() {
    super.onInit();
    filteredDetailsUndertakingPermit.assignAll(checklistUndertakingPermit);
  }

  var checklistUndertakingPermit = [
    {
      'title': 'I understood and will follow all the instructions given to me.',
      'isChecked': false
    },
    {
      'title':
          'I accept all the company regulations explained to me and I will comply to those. ',
      'isChecked': false
    },
    {
      'title':
          'I hereby declare that the information documents provided in above form is true & correct to the best of my knowledge and belief and nothing has been falsely stated. In case any of the above information is found to be false or untrue or misleading or misreprese-nting, I am aware that may be held liable for it.',
      'isChecked': false
    },
  ];

  void toggleCheckboxUndertakingPermit(int index) {
    filteredDetailsUndertakingPermit[index]['isChecked'] =
        !filteredDetailsUndertakingPermit[index]['isChecked'];
    filteredDetailsUndertakingPermit.refresh();
  }

  void toggleSelectAllUndertakingPermit() {
    bool newValue = !isCheckedUndertakingPermit.value;
    isCheckedUndertakingPermit.value = newValue;

    for (var item in filteredDetailsUndertakingPermit) {
      item['isChecked'] = newValue;
    }
    filteredDetailsUndertakingPermit.refresh();
  }

  // void updateSelectAllCheckbox() {
  //   bool allChecked =
  //       filteredDetailsEquipment.every((item) => item['isChecked'] == true);
  //   isCheckedEquipment.value = allChecked;
  // }

  void searchDataUndertakingPermit(String query) {
    searchQueryUndertakingPermit.value = query;
    if (query.isEmpty) {
      filteredDetailsUndertakingPermit.assignAll(checklistUndertakingPermit);
    } else {
      filteredDetailsUndertakingPermit.assignAll(
        filteredDetailsUndertakingPermit
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  final SignatureController signatureControllerPermit = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  var savedSignature = Rxn<Uint8List>(); // Observable for signature data

  @override
  void onClose() {
    signatureControllerPermit.dispose();
    super.onClose();
  }

  void clearPermitSignature() {
    signatureControllerPermit.clear();
    savedSignature.value = null; // Clear the stored signature
  }

  Future<void> savePermitSignature() async {
    try {
      Uint8List? signatureBytes = await signatureControllerPermit.toPngBytes();

      savedSignature.value = signatureBytes; // Update observable
      print('----------------${savedSignature.value} ');

      print("Signature Saved Successfully");
    } catch (e) {
      print("Error saving signature: $e");
    }
  }
}
