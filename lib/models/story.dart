import 'dart:convert';

class Story {
  final String id;
  final items;
  Story({
    required this.id,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'items': items,
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      id: map['id'] ?? '',
      items: map['items'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) => Story.fromMap(json.decode(source));
}
