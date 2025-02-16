import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectReviewerController extends GetxController {
  var selectedContacts = <String, bool>{}.obs;
  var addedReviewer = <String, bool>{}.obs; // Store confirmed selections
  var searchReviewerQuery = ''.obs;
  final TextEditingController searchReviwerController = TextEditingController();

  final Map<String, List<Map<String, String>>> reviewer = {
    'A': [
      {
        'name': 'John Doe',
        'designation': 'Manager',
        'img': 'assets/icons/phone_orange.png'
      },
      {
        'name': 'Alice Brown',
        'designation': 'Designer',
        'img': 'assets/icons/phone_orange.png'
      },
    ],
    'B': [
      {
        'name': 'Brian Adams',
        'designation': 'HR',
        'img': 'assets/icons/phone_orange.png'
      },
      {
        'name': 'Bob Marley',
        'designation': 'Musician',
        'img': 'assets/icons/phone_orange.png'
      },
    ],
  };

  /// Toggle contact selection
  void toggleReviewerSelection(String contactName) {
    selectedContacts[contactName] = !(selectedContacts[contactName] ?? false);
  }

  /// Confirm selections by adding them to `addedContacts`
  void confirmReviewerSelection() {
    addedReviewer.clear();
    addedReviewer.addAll(selectedContacts);
    print('----------------------------------$selectedContacts');
  }

  /// Remove a contact from added list
  void removeReviewerAdded(String contactName) {
    addedReviewer.remove(contactName);
    selectedContacts[contactName] = false;
  }

  /// Filter contacts based on search query
  List<Map<String, String>> getFilteredReviewer() {
    if (searchReviewerQuery.value.isEmpty) {
      return reviewer.values.expand((list) => list).toList();
    }
    return reviewer.values.expand((list) => list).where((contact) {
      return contact['name']!
          .toLowerCase()
          .contains(searchReviewerQuery.value.toLowerCase());
    }).toList();
  }

  /// Group contacts by their first letter
  Map<String, List<Map<String, String>>> getGroupedReviewer() {
    Map<String, List<Map<String, String>>> groupedReviewer = {};

    for (var entry in reviewer.entries) {
      String letter = entry.key;
      List<Map<String, String>> contactList = entry.value;

      List<Map<String, String>> filteredReviewer = contactList.where((contact) {
        return contact['name']!
            .toLowerCase()
            .contains(searchReviewerQuery.value.toLowerCase());
      }).toList();

      if (filteredReviewer.isNotEmpty) {
        groupedReviewer[letter] = filteredReviewer;
      }
    }

    return groupedReviewer;
  }
}
