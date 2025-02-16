import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StaffDocumentationController extends GetxController {
  var labourAdharcard = <XFile>[];
  var labourotherimg = <XFile>[];
  TextEditingController adharnoController = TextEditingController();
  TextEditingController idnoController = TextEditingController();
  TextEditingController validityController = TextEditingController();

  var validityText = ''.obs;
  var idnoText = ''.obs;
  @override
  void onInit() {
    super.onInit();
    validityController.addListener(() {
      validityText.value = validityController.text; // ✅ Update observabl
    });

    idnoController.addListener(() {
      idnoText.value = idnoController.text;
    });
  }

  var alllabourImgData = <XFile>[];

  var adharImageCount = 0.obs;
  var otherImageCount = 0.obs;
  var alllabourImgDataCount = 0.obs;
  final maxPhotos = 3;
  final maxPhotos2 = 3;

  Future<void> pickadharStaffImages() async {
    final ImagePicker picker = ImagePicker();

    if (labourAdharcard.length < maxPhotos) {
      int remainingSlots = maxPhotos - labourAdharcard.length;

      final List<XFile> pickedFiles = await picker.pickMultiImage();

      final List<XFile> limitedFiles =
          pickedFiles.take(remainingSlots).toList();

      labourAdharcard.addAll(limitedFiles);
      updateAllLabourImages();
      adharImageCount.value = labourAdharcard.length; // ✅ Correct update

      log('-----------adharImageCount------------$adharImageCount');
      log('-----------labourAdharcard-------------${labourAdharcard.length}');
    }
  }

  Future<void> pickotherImages() async {
    if (labourotherimg.length < maxPhotos2) {
      int remainingSlots = maxPhotos2 - labourotherimg.length;
      final ImagePicker picker = ImagePicker();
      final List<XFile> pickedFiles = await picker.pickMultiImage();
      final List<XFile> limitedFiles =
          pickedFiles.take(remainingSlots).toList();

      labourotherimg.addAll(limitedFiles);
      log('-----------labourotherimg-------------${labourotherimg.length}');
      otherImageCount.value = labourotherimg.length;
      updateAllLabourImages();
    }
  }

  void updateAllLabourImages() {
    alllabourImgData = [...labourAdharcard, ...labourotherimg];
    alllabourImgDataCount.value = alllabourImgData.length;
    log('Updated alllabourImgData: ${alllabourImgData.length} images');
  }

  // ✅ Function to remove an image from labourAdharcard
  void removeAdharImage(int index) {
    if (index >= 0 && index < labourAdharcard.length) {
      labourAdharcard.removeAt(index);
      adharImageCount.value = labourAdharcard.length;
      updateAllLabourImages();

      log('Removed image at index $index from AdharCard. Remaining: ${adharImageCount.value}');
    }
  }

  // ✅ Function to remove an image from labourotherimg
  void removeOtherImage(int index) {
    if (index >= 0 && index < labourotherimg.length) {
      labourotherimg.removeAt(index);
      otherImageCount.value = labourotherimg.length;
      updateAllLabourImages();

      log('Removed image at index $index from Other Images. Remaining: ${otherImageCount.value}');
    }
  }

  var selecteddoctype = ''.obs; // Observable for Blood Group selection
  final List<String> doctype = ['work', 'today'];
}
