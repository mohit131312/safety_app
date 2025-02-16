import 'package:get/get.dart';

class SelectAssigneController extends GetxController {
  var selectedassign = <String, bool>{}.obs;
  var addedAssigned = <String, bool>{}.obs; // Store confirmed selections
  var searchQuery = ''.obs;

  final Map<String, List<Map<String, String>>> contacts = {
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
      {
        'name': 'Alex Smith',
        'designation': 'Developer',
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
      {
        'name': 'Bella Swan',
        'designation': 'Writer',
        'img': 'assets/icons/phone_orange.png'
      },
    ],
    'C': [
      {
        'name': 'Charlie Chaplin',
        'designation': 'Actor',
        'img': 'assets/icons/phone_orange.png'
      },
      {
        'name': 'Chris Evans',
        'designation': 'Actor',
        'img': 'assets/icons/phone_orange.png'
      },
      {
        'name': 'Catherine Tate',
        'designation': 'Comedian',
        'img': 'assets/icons/phone_orange.png'
      },
    ],
  };

  /// **Toggle contact selection**
  void toggleContactSelection(String contactName) {
    if (selectedassign.containsKey(contactName)) {
      selectedassign[contactName] = !selectedassign[contactName]!;
    } else {
      selectedassign[contactName] = true;
    }
  }

  /// **Confirm selections**
  void confirmSelections() {
    addedAssigned.assignAll(selectedassign);
  }

  /// **Get filtered contacts based on search query**
  List<Map<String, String>> getFilteredContacts() {
    if (searchQuery.value.isEmpty) {
      return contacts.values.expand((list) => list).toList();
    }
    return contacts.values.expand((list) => list).where((contact) {
      return contact['name']!
          .toLowerCase()
          .contains(searchQuery.value.toLowerCase());
    }).toList();
  }

  /// **Group contacts alphabetically after filtering**
  Map<String, List<Map<String, String>>> getGroupedContacts() {
    Map<String, List<Map<String, String>>> grouped = {};

    contacts.forEach((letter, contactList) {
      List<Map<String, String>> filteredList = contactList.where((contact) {
        return contact['name']!
            .toLowerCase()
            .contains(searchQuery.value.toLowerCase());
      }).toList();

      if (filteredList.isNotEmpty) {
        grouped[letter] = filteredList;
      }
    });

    return grouped;
  }

  void removeAddedContact(String contactName) {
    addedAssigned.remove(contactName);
    selectedassign.remove(contactName);
  }

  /// **Clear selections**
  void clearSelections() {
    selectedassign.clear();
  }
}
