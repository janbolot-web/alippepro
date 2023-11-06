import 'package:alippepro_v1/models/course.dart';
import 'package:alippepro_v1/models/courseDetail.dart';
import 'package:flutter/material.dart';

class CourseProvider extends ChangeNotifier {
  Course _course = Course(
    id: '',
    title: '',
    duration: '',
    description: '',
    price: 0,
    previewImgUrl: '',
    previewVideoUrl: '',
    modules: '',
  );
  Course get course => _course;

  void setCourse(String course) {
    _course = Course.fromJson(course);
    notifyListeners();
  }

  void setCourseFromModel(Course course) {
    _course = course;
    notifyListeners();
  }
}

class CourseDetailProvider extends ChangeNotifier {
  CourseDetail _courseDetail = CourseDetail(
    id: '',
    title: '',
    duration: '',
    description: '',
    price: 0,
    previewImgUrl: '',
    previewVideoUrl: '',
    modules: [],
  );
  CourseDetail get courseDetail => _courseDetail;

  void setCourseDetail(String courseDetail) {
    _courseDetail = CourseDetail.fromJson(courseDetail);
    notifyListeners();
  }

  void setCourseDetailFromModel(CourseDetail courseDetail) {
    _courseDetail = courseDetail;
    notifyListeners();
  }
}
