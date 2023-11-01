import 'package:flutter/material.dart';

class TagModel extends ChangeNotifier {
  String tagOwner = 'Default Owner';
  String tagName = '';
  String tagStartId = '';
  String tagEndId = '';
  String tagLocation = '';
  int tagQuantity = 0;
  bool tagStatus = true;
  DateTime timestamp = DateTime.now();
  void updateTagNumber() {
    tagQuantity = calculateTagNumber();
    notifyListeners();
  }

  void updateTagName(String newTagName) {
    tagName = newTagName;
    notifyListeners();
  }

  void updateTagStartId(String newTagId) {
    tagStartId = newTagId;

    updateTagNumber();
  }

  void updateTagEndId(String newTagId) {
    tagEndId = newTagId;
    updateTagNumber();
  }

  int extractNumber(String id) {
    var number = int.tryParse(id.replaceAll(RegExp(r'\D'), ''));
    return number ?? 0;
  }

  int calculateTagNumber() {
    int startNumber = extractNumber(tagStartId);
    int endNumber = extractNumber(tagEndId);

    return endNumber - startNumber + 1;
  }

  void createTag(
      {required String tagOwner,
      required String tagName,
      required String tagStartId,
      required String tagEndId,
      required String tagLocation,
      required int tagNumber,
      required bool tagStatus,
      required DateTime timestamp}) {
    this.tagOwner = tagOwner;
    this.tagName = tagName;
    this.tagStartId = tagStartId;
    this.tagEndId = tagEndId;
    this.tagLocation = tagLocation;
    this.tagQuantity = tagNumber;
    this.tagStatus = tagStatus;
    this.timestamp = timestamp;
    notifyListeners();
  }
}
