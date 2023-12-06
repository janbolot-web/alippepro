import 'dart:convert';

import 'package:alippepro/providers/story_provider.dart';
import 'package:alippepro/utils/constants.dart';
import 'package:alippepro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class StoryService {
  void getAllStories(
    BuildContext context,
  ) async {
    try {
      var storyProvider = Provider.of<StoryProvider>(context, listen: false);

      var stories = await http.get(
        Uri.parse('${Constants.uri}/getAllStories'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var response = jsonDecode(stories.body);
      Map<String, dynamic> ne = {};
      ne['items'] = response;
      // ne['previewImgUrl'] = response[0]['previewImgUrl'];
      var storiesData = jsonEncode(ne);
      storyProvider.setStory(storiesData);
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
  }
}
