import 'package:get/get.dart';

class WorkPermitController extends GetxController {
  var selectedOption = 0.obs; // To track selected filter option
  var searchQuery = ''.obs;
  var personalDetails = <Map<String, dynamic>>[].obs;
  var filteredDetails = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    personalDetails.value = personalDetailData;
    filteredDetails.value = personalDetailData;
  }

  final List<Map<String, dynamic>> personalDetailData = [
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Work Permit",
      "subtitle": "Work Permit detail",
      "text": "Open",
      'date': '12 Mar 2024, 02:22 PM',
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Work Permit",
      "subtitle": "Work Permit detail",
      "text": "Open",
      'date': '12 Mar 2024, 02:22 PM',
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Work Permit",
      "subtitle": "Work Permit detail",
      "text": "Closed",
      'date': '12 Mar 2024, 02:22 PM',
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Work Permit",
      "subtitle": "Work Permit detail",
      "text": "Accepted",
      'date': '12 Mar 2024, 02:22 PM',
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Work data",
      "subtitle": "Work Permit detail",
      "text": "Accepted",
      'date': '12 Mar 2024, 02:22 PM',
    },
  ];

  void changeSelection(int index) {
    selectedOption.value = index;
    applyFilters();
  }

  void searchLabor(String query) {
    searchQuery.value = query;
    applyFilters();
  }

  /// **Apply both search and selection filters**
  void applyFilters() {
    List<Map<String, dynamic>> filtered = List.from(personalDetails);

    // **Search Filter**
    if (searchQuery.value.isNotEmpty) {
      filtered = filtered
          .where((item) => item['title']!
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
    }

    // **Status Filter**
    if (selectedOption.value == 1) {
      filtered = filtered.where((item) => item['text'] == "Open").toList();
    } else if (selectedOption.value == 2) {
      filtered = filtered.where((item) => item['text'] == "Closed").toList();
    } else if (selectedOption.value == 3) {
      filtered = filtered.where((item) => item['text'] == "Accepted").toList();
    }

    // **Update filtered list**
    filteredDetails.value = filtered;
  }
}
