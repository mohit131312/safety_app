import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ToolboxAddTraineeController extends GetxController {
  var traineeimg = <XFile>[];

  var traineeImageCount = 0.obs;

  final maxPhotos = 10;

  Future<void> picktraineeImages() async {
    final ImagePicker picker = ImagePicker();

    if (traineeimg.length < maxPhotos) {
      int remainingSlots = maxPhotos - traineeimg.length;

      final List<XFile> pickedFiles = await picker.pickMultiImage();

      final List<XFile> limitedFiles =
          pickedFiles.take(remainingSlots).toList();

      traineeimg.addAll(limitedFiles);
      traineeImageCount.value = traineeimg.length; // ✅ Correct update

      log('-----------incidentImageCount------------$traineeImageCount');
      log('-----------incidentimg-------------${traineeimg.length}');
    }
  }

  void removetraineeImage(int index) {
    if (index >= 0 && index < traineeimg.length) {
      traineeimg.removeAt(index);
      traineeImageCount.value = traineeimg.length;

      log('Removed image at index $index from incidentimg. Remaining: ${traineeImageCount.value}');
    }
  }

  var isTraineeExpanded = true.obs; // Observable to track expansion state

  void toggleTraineeExpansion() {
    isTraineeExpanded.value = !isTraineeExpanded.value;
  }
}
