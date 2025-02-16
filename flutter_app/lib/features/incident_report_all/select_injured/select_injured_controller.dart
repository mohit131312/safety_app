import 'package:get/get.dart';

class SelectInjuredController extends GetxController {
  var selectedContacts = <String, bool>{}.obs;
  var addedContacts = <String, bool>{}.obs; // Store confirmed selections
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
  void toggleContactSelection(String contactName) {
    selectedContacts[contactName] = !(selectedContacts[contactName] ?? false);
  }

  /// Confirm selections by adding them to `addedContacts`
  void confirmSelection() {
    addedContacts.clear();
    addedContacts.addAll(selectedContacts);
  }

  /// Remove a contact from added list
  void removeAddedContact(String contactName) {
    addedContacts.remove(contactName);
    selectedContacts[contactName] = false;
  }

  /// Filter contacts based on search query
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

  /// Group contacts by their first letter
  Map<String, List<Map<String, String>>> getGroupedContacts() {
    Map<String, List<Map<String, String>>> groupedContacts = {};

    for (var entry in contacts.entries) {
      String letter = entry.key;
      List<Map<String, String>> contactList = entry.value;

      List<Map<String, String>> filteredContacts = contactList.where((contact) {
        return contact['name']!
            .toLowerCase()
            .contains(searchQuery.value.toLowerCase());
      }).toList();

      if (filteredContacts.isNotEmpty) {
        groupedContacts[letter] = filteredContacts;
      }
    }

    return groupedContacts;
  }
}
