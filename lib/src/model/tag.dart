import 'package:flutter/material.dart';
import 'package:test_tag/src/model/tag_list.dart';

class TagModel extends ChangeNotifier {
  String tagOwner;
  String tagName;
  String tagStartId;
  String tagEndId;
  String tagLocation;
  int tagQuantity;
  bool tagStatus;
  DateTime startTime;
  DateTime endTime;
  TagListModel tagListModel = TagListModel([]);

  TagModel(
      {required this.tagOwner,
      required this.tagName,
      required this.tagStartId,
      required this.tagEndId,
      required this.tagLocation,
      required this.tagQuantity,
      required this.tagStatus,
      required this.startTime,
      required this.endTime});
  TagModel clone() {
    return TagModel(
      tagOwner: tagOwner,
      tagName: tagName,
      tagStartId: tagStartId,
      tagEndId: tagEndId,
      tagLocation: tagLocation,
      tagQuantity: tagQuantity,
      tagStatus: tagStatus,
      startTime: startTime,
      endTime: endTime,
    );
  }

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
        tagOwner: json['tagOwner'],
        tagName: json['tagName'],
        tagStartId: json['tagStartId'],
        tagEndId: json['tagEndId'],
        tagLocation: json['tagLocation'],
        tagQuantity: json['tagQuantity'],
        tagStatus: json['tagStatus'],
        startTime: DateTime.parse(json['startTime']),
        endTime: DateTime.parse(json['endTime']));
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

  void updateTagStatus(bool newTagStatus) {
    tagStatus = newTagStatus;
    endTime = DateTime.now();
  }

  void resetTag() {
    tagOwner = 'Default Owner';
    tagName = '';

    // Set the start ID to the current end ID

    // Separate all alphabetic and numeric parts
    var matches = RegExp(r'(\D+|\d+)')
        .allMatches(tagEndId)
        .map((match) => match.group(0))
        .toList();

    // Find the last numeric part and increment it
    for (var i = matches.length - 1; i >= 0; i--) {
      if (RegExp(r'\d+').hasMatch(matches[i]!)) {
        matches[i] = (int.parse(matches[i]!) + 1).toString();
        break;
      }
    }

    // Concatenate all parts back together
    tagEndId = matches.join('');
    tagStartId = tagEndId;
    tagQuantity = 1;
    tagStatus = true;
    startTime = DateTime.now();
    endTime = DateTime.now();
    notifyListeners();
  }
}
