import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddStaffController extends GetxController {
  var selectedStaffGender = 0.obs; // Default to Male

  final List<Map<String, dynamic>> staffgenders = [
    {'label': 'Male', 'icon': 'assets/icons/male.png'},
    {'label': 'Female', 'icon': 'assets/icons/female.png'},
    {'label': 'Other', 'icon': 'assets/icons/star.png'}
  ];

  void selectStaffGender(int index) {
    selectedStaffGender.value = index;
  }

  String get selectedGenderLabel =>
      staffgenders[selectedStaffGender.value]['label']!;
  var selectedImgPath = ''.obs;

  Future<void> pickStaffImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImgPath.value = pickedFile.path;
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

  var selectedStaffDate = Rxn<DateTime>();
  final TextEditingController dateStaffController = TextEditingController();

  void updateDate(DateTime newDate) {
    selectedStaffDate.value = newDate;
    dateStaffController.text =
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

  List<TextEditingController> addressStaffControllers =
      List.generate(6, (index) => TextEditingController());

  @override
  void onClose() {
    for (var controller in addressStaffControllers) {
      controller.dispose(); // Dispose of controllers when done
    }
    for (var controller in permanantAddressStaffController) {
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
    formattedAddress.value = addressStaffControllers
        .map((controller) => controller.text)
        .where((text) => text.isNotEmpty) // Remove empty fields
        .join(" ");
  }

  // Function to return formatted address
  var formattedpermanantaddAddress = "".obs; // Observable for dynamic updates

  void updateFormattedpermenantAddress() {
    formattedpermanantaddAddress.value = permanantAddressStaffController
        .map((controller) => controller.text)
        .where((text) => text.isNotEmpty) // Remove empty fields
        .join(" ");
  }

  List<TextEditingController> permanantAddressStaffController =
      List.generate(6, (index) => TextEditingController());

  TextEditingController fullnameStaffController = TextEditingController();
  TextEditingController contactnumberStaffController = TextEditingController();
  TextEditingController econtactnumberStaffController = TextEditingController();
  TextEditingController econtactnameStaffController = TextEditingController();
}
