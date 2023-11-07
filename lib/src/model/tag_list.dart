import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:test_tag/src/model/tag.dart';

class TagListModel extends ChangeNotifier{
  
  List<TagModel> tags;

  TagListModel(this.tags);

  void addTag(TagModel tag) {
    tags.add(tag);
        notifyListeners();
  }

  void removeTag(TagModel tag) {
    tags.remove(tag);
    notifyListeners();
  }

  void updateTag(TagModel tag) {
    tags[tags.indexWhere((element) => element == tag)] = tag;
    notifyListeners();
  }

  void clearTags() {
    tags.clear();
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
