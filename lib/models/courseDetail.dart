import 'dart:convert';

class CourseDetail {
  final String id;
  final String title;
  final String duration;
  final String description;
  final int price;
  final String previewImgUrl;
  final String previewVideoUrl;
  final modules;
  CourseDetail({
    required this.id,
    required this.title,
    required this.duration,
    required this.description,
    required this.price,
    required this.previewImgUrl,
    required this.previewVideoUrl,
    required this.modules,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'duration': duration,
      'description': description,
      'price': price,
      'previewImgUrl': previewImgUrl,
      'previewVideoUrl': previewVideoUrl,
      'modules': modules,
    };
  }

  factory CourseDetail.fromMap(Map<String, dynamic> map) {
    return CourseDetail(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      duration: map['duration'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      previewImgUrl: map['previewImgUrl'] ?? '',
      previewVideoUrl: map['previewVideoUrl'] ?? '',
      modules: map['modules'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseDetail.fromJson(String source) =>
      CourseDetail.fromMap(json.decode(source));
}
