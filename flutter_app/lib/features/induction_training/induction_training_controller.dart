import 'package:get/get.dart';

class InductionTrainingController extends GetxController {
  var selectedOption = 0.obs;
  var searchQuery = ''.obs;
  var personalDetails = <Map<String, dynamic>>[].obs;
  var filteredDetails = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit

    personalDetails.value = personalDetailData;
    filteredDetails.value = personalDetailData;

    super.onInit();
  }

  final List<Map<String, dynamic>> personalDetailData = [
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/Labours.png",
      "text": "Labour",
    },
    {
      'img': "assets/icons/Profile.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/Labours.png",
      "text": "Gov. Official",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/User.png",
      "text": "Client",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Navin Shah",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/users.png",
      "text": "Staff",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/messages.png",
      "text": "Consultant",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/Labours.png",
      "text": "Contractor",
    },
    {
      'img': "assets/icons/Profile.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/Labours.png",
      "text": "Gov. Official",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/User.png",
      "text": "Client",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/Labours.png",
      "text": "Labour",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/Labours.png",
      "text": "Labour",
    },
  ];
  void changeSelection(int index) {
    selectedOption.value = index;
  }

  void searchLabor(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredDetails.value = personalDetails;
    } else {
      filteredDetails.value = personalDetails
          .where((item) =>
              item['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
