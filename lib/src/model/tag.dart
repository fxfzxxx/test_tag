import 'package:flutter/material.dart';

class TagModel extends ChangeNotifier {
  String tagOwner;
  String tagName;
  String tagStartId;
  String tagEndId;
  String tagLocation ;
  int tagQuantity;
  bool tagStatus;
  DateTime timestamp;

  TagModel(
      {required this.tagOwner,
      required this.tagName,
      required this.tagStartId,
      required this.tagEndId,
      required this.tagLocation,
      required this.tagQuantity,
      required this.tagStatus,
      required this.timestamp});

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
        tagOwner: json['tagOwner'],
        tagName: json['tagName'],
        tagStartId: json['tagStartId'],
        tagEndId: json['tagEndId'],
        tagLocation: json['tagLocation'],
        tagQuantity: json['tagQuantity'],
        tagStatus: json['tagStatus'],
        timestamp: DateTime.parse(json['timestamp']));
  }

  void updateLocation(String newLocation) {
    tagLocation = newLocation;
    notifyListeners();
  }
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

  // void createTag(
  //     {required String tagOwner,
  //     required String tagName,
  //     required String tagStartId,
  //     required String tagEndId,
  //     required String tagLocation,
  //     required int tagNumber,
  //     required bool tagStatus,
  //     required DateTime timestamp}) {
  //   this.tagOwner = tagOwner;
  //   this.tagName = tagName;
  //   this.tagStartId = tagStartId;
  //   this.tagEndId = tagEndId;
  //   this.tagLocation = tagLocation;
  //   tagQuantity = tagNumber;
  //   this.tagStatus = tagStatus;
  //   this.timestamp = timestamp;
  //   // notifyListeners();
  // }
}
