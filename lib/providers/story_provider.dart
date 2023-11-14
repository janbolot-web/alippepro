import 'package:alippepro/models/course.dart';
import 'package:alippepro/models/courseDetail.dart';
import 'package:alippepro/models/story.dart';
import 'package:flutter/material.dart';

class StoryProvider extends ChangeNotifier {
  Story _story = Story(id: '', items: []);
  Story get story => _story;

  void setStory(String story) {
    _story = Story.fromJson(story);
    notifyListeners();
  }

  void setStoryFromModel(Story story) {
    _story = story;
    notifyListeners();
  }
}
