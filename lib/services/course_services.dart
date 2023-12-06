import 'dart:convert';

import 'package:alippepro/providers/course_provider.dart';
import 'package:alippepro/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CourseService {
  void getAllCourses(
    BuildContext context,
  ) async {
    try {
      var courseProvider = Provider.of<CourseProvider>(context, listen: false);

      var courses = await http.get(
        Uri.parse('${Constants.uri}/getAllCourses'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var response = jsonDecode(courses.body);
      Map<String, dynamic> ne = {};
      ne['id'] = response[0]['id'];
      ne['title'] = response[0]['title'];
      ne['duration'] = response[0]['duration'];
      ne['price'] = response[0]['price'];
      ne['previewImgUrl'] = response[0]['previewImgUrl'];
      var courseRes = jsonEncode(ne);
      courseProvider.setCourse(courseRes);

      // Map<String, dynamic> ne = {};
      // ne['token'] = token;
      // ne['email'] = response['email'];
      // ne['id'] = response['id'];
      // ne['name'] = response['name'];
      // ne['roles'] = response['roles'];
      // ne['courses'] = response['courses'];
      // ne['createdAt'] = response['createdat'];
      // ne['updatedAt'] = response['updatedAt'];
      // var userRes = jsonEncode(ne);
    } catch (e) {
      // ignore: use_build_context_synchronously
      // showSnackBar(context, e.toString());
    }
  }

  void getCourse({
    required BuildContext context,
    required String id,
  }) async {
    try {
      var courseDetailProvider =
          Provider.of<CourseDetailProvider>(context, listen: false);

      var course = await http.get(
        Uri.parse('${Constants.uri}/getCourse/${id.toString()}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      var response = json.decode(course.body);

      Map<String, dynamic> ne = {};
      ne['id'] = response['_id'];
      ne['title'] = response['title'];
      ne['duration'] = response['duration'];
      ne['description'] = response['description'];
      ne['price'] = response['price'];
      ne['previewImgUrl'] = response['previewImgUrl'];
      ne['previewVideoUrl'] = response['previewVideoUrl'];
      ne['modules'] = response['modules'];
      var courseDetailRes = jsonEncode(ne);
      courseDetailProvider.setCourseDetail(courseDetailRes);

      // Map<String, dynamic> ne = {};
      // ne['token'] = token;
      // ne['email'] = response['email'];
      // ne['id'] = response['id'];
      // ne['name'] = response['name'];
      // ne['roles'] = response['roles'];
      // ne['courses'] = response['courses'];
      // ne['createdAt'] = response['createdat'];
      // ne['updatedAt'] = response['updatedAt'];
      // var userRes = jsonEncode(ne);
    } catch (e) {
      // ignore: use_build_context_synchronously
      // showSnackBar(context, e.toString());
    }
  }

  void addModuleToUser({
    moduleId,
    userId,
    courseId,
  }) async {
    try {
      await http.patch(Uri.parse('${Constants.uri}/addCourseToUser'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "params": {
              "moduleId": moduleId,
              "userId": userId,
              "courseId": courseId
            }
          }));
    } catch (e) {}
  }
}
