import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AssigneeIncidentDetailsController extends GetxController {
  var isincidentdetailsDetailsExpanded =
      true.obs; // Observable to track expansion state

  void toggleExpansionIncedenet() {
    isincidentdetailsDetailsExpanded.value =
        !isincidentdetailsDetailsExpanded.value;
  }

  var isinvolvepeople = true.obs; // Observable to track expansion state

  void toggleExpansionpeople() {
    isinvolvepeople.value = !isinvolvepeople.value;
  }

  var isprecautionDetailsExpanded =
      true.obs; // Observable to track expansion state

  void toggleExpansionPrecaution() {
    isprecautionDetailsExpanded.value = !isprecautionDetailsExpanded.value;
  }

  var assignerincidentimg = <XFile>[];

  var assignerincidentImageCount = 0.obs;

  final maxPhotos = 5;

  Future<void> pickAssignorImages() async {
    final ImagePicker picker = ImagePicker();

    if (assignerincidentimg.length < maxPhotos) {
      int remainingSlots = maxPhotos - assignerincidentimg.length;

      final List<XFile> pickedFiles = await picker.pickMultiImage();

      final List<XFile> limitedFiles =
          pickedFiles.take(remainingSlots).toList();

      assignerincidentimg.addAll(limitedFiles);
      assignerincidentImageCount.value =
          assignerincidentimg.length; // ✅ Correct update

      log('-----------incidentImageCount------------$assignerincidentImageCount');
      log('-----------assignerincidentimg-------------${assignerincidentimg.length}');
    }
  }

  void removeAssignorImage(int index) {
    if (index >= 0 && index < assignerincidentimg.length) {
      assignerincidentimg.removeAt(index);
      assignerincidentImageCount.value = assignerincidentimg.length;

      log('Removed image at index $index from incidentimg. Remaining: ${assignerincidentImageCount.value}');
    }
  }
}
