import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddLabourController extends GetxController {
  var selectedGender = 0.obs; // Default to Male

  final List<Map<String, dynamic>> genders = [
    {'label': 'Male', 'icon': 'assets/icons/male.png'},
    {'label': 'Female', 'icon': 'assets/icons/female.png'},
    {'label': 'Other', 'icon': 'assets/icons/star.png'}
  ];

  void selectGender(int index) {
    selectedGender.value = index;
  }

  String get selectedGenderLabel => genders[selectedGender.value]['label']!;
  var selectedImagePath = ''.obs;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      print("No image selected");
    }
  }

  var selectedBloodGroup = ''.obs; // Observable for Blood Group selection
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  var selectedreasons = ''.obs; // Observable for Blood Group selection
  final List<String> reasons = ['work', 'today'];

  var selectedrelation = ''.obs; // Observable for Blood Group selection
  final List<String> relations = ['Brothet', 'siste', 'father'];

  var selectedDate = Rxn<DateTime>();
  final TextEditingController dateController = TextEditingController();

  void updateDate(DateTime newDate) {
    selectedDate.value = newDate;
    dateController.text =
        DateFormat("yyyy MMM dd").format(newDate); // Format as YYYY MMM DD
  }

  var isExpanded = false.obs; // Observable boolean
  var isExpanded2 = false.obs; // Observable boolean

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }

  void toggleExpansion2() {
    isExpanded2.value = !isExpanded2.value;
  }

  List<TextEditingController> addressControllers =
      List.generate(6, (index) => TextEditingController());

  @override
  void onClose() {
    for (var controller in addressControllers) {
      controller.dispose(); // Dispose of controllers when done
    }
    for (var controller in permanantAddressController) {
      controller.dispose(); // Dispose of controllers when done
    }
    super.onClose();
  }

  List<String> addressLabels = [
    "Street Name",
    "City",
    "State",
    "District",
    "Taluka",
    "Pincode"
  ];
  List<String> addresspermanantLabels = [
    "Street Name",
    "City",
    "State",
    "District",
    "Taluka",
    "Pincode"
  ];

  // Function to return formatted address
  var formattedAddress = "".obs; // Observable for dynamic updates

  void updateFormattedAddress() {
    formattedAddress.value = addressControllers
        .map((controller) => controller.text)
        .where((text) => text.isNotEmpty) // Remove empty fields
        .join(" ");
  }

  // Function to return formatted address
  var formattedpermanantaddAddress = "".obs; // Observable for dynamic updates

  void updateFormattedpermenantAddress() {
    formattedpermanantaddAddress.value = permanantAddressController
        .map((controller) => controller.text)
        .where((text) => text.isNotEmpty) // Remove empty fields
        .join(" ");
  }

  List<TextEditingController> permanantAddressController =
      List.generate(6, (index) => TextEditingController());

  TextEditingController fullnameController = TextEditingController();
  TextEditingController contactnumberController = TextEditingController();
  TextEditingController econtactnumberController = TextEditingController();
  TextEditingController econtactnameController = TextEditingController();
}
