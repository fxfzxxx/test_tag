import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:test_tag/src/model/tag.dart';

class TagListModel extends ChangeNotifier{
  
  List<SingleTag> tags;

  TagListModel(this.tags);

  void addTag(TagModel tag) {
    addTagsFromRange(tag);
        notifyListeners();
  }

  void removeTag(TagModel tag) {
    tags.remove(tag);
    notifyListeners();
  }

  void updateTag(SingleTag tag) {
    tags[tags.indexWhere((element) => element == tag)] = tag;
    notifyListeners();
  }

  void clearTags() {
    tags.clear();
  }

  void addTagsFromRange(TagModel tag) {
  // Separate all alphabetic and numeric parts
  var matchesStart = RegExp(r'(\D+|\d+)').allMatches(tag.tagStartId).map((match) => match.group(0)).toList();
  var matchesEnd = RegExp(r'(\D+|\d+)').allMatches(tag.tagEndId).map((match) => match.group(0)).toList();

  // Check if the non-numeric parts are the same
  if (matchesStart.where((s) => !RegExp(r'\d+').hasMatch(s!)).join() == matchesEnd.where((s) => !RegExp(r'\d+').hasMatch(s!)).join()) {
    // Find the last numeric part in startID and the corresponding part in endID
    for (var i = matchesStart.length - 1; i >= 0; i--) {
      if (RegExp(r'\d+').hasMatch(matchesStart[i]!)) {
        var numberStart = int.parse(matchesStart[i]!);
        var numberEnd = int.parse(matchesEnd[i]!);

        // Create SingleTag instances for each ID in the range
        for (var j = numberStart; j <= numberEnd; j++) {
          matchesStart[i] = j.toString();
          var newTag = SingleTag(
            id: matchesStart.join(''),
            description: '',
            tagOwner: tag.tagOwner,
            tagName: tag.tagName,
            tagLocation: tag.tagLocation,
            tagStatus: tag.tagStatus,
            startTime: tag.startTime,
            endTime: tag.endTime,
            // Copy other properties from the original tag
          );
          tags.add(newTag);
        }

        break;
      }
    }
  }

  notifyListeners();
}

  int get length => tags.length;

  List<TagModel> parseTags(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

    return parsed.map<TagModel>((json) => TagModel.fromJson(json)).toList();
  }

  Future<List<TagModel>> fetchTags(http.Client client) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    // Use the compute function to run parsePhotos in a separate isolate.
    return compute(parseTags, response.body);
  }
}
class SingleTag {
  String id;
  String description;
  String tagOwner;
  String tagName;
  String tagLocation;
  bool tagStatus;
  DateTime startTime;
  DateTime endTime;
  SingleTag(
      {required this.id,
      required this.description,
      required this.tagOwner,
      required this.tagName,
      required this.tagLocation,
      required this.tagStatus,
      required this.startTime,
      required this.endTime});
}

