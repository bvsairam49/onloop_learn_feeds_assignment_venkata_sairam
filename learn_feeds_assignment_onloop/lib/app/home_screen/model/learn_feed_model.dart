class LearnFeedModel {
  LearnFeedModel({required this.learnContent});

  late final List<LearnContent> learnContent;

  /// Creates a feed from the given [json]
  LearnFeedModel.fromJson(Map<String, dynamic> json) {
    learnContent = List.from(json['learn_content'])
        .map((e) => LearnContent.fromJson(e))
        .toList();
  }

  /// Returns the feed as json object.
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['learn_content'] = learnContent.map((e) => e.toJson()).toList();
    return _data;
  }
}

class LearnContent {
  LearnContent({
    required this.createdAt,
    required this.type,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.contentUrl,
    required this.tags,
  });

  late final String createdAt;
  late final String type;
  late final String title;
  late final String description;
  late final String thumbnailUrl;
  late final String contentUrl;
  late final List<Tags> tags;

  LearnContent.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    thumbnailUrl = json['thumbnail_url'];
    contentUrl = json['content_url'];
    tags = List.from(json['tags']).map((e) => Tags.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['created_at'] = createdAt;
    _data['type'] = type;
    _data['title'] = title;
    _data['description'] = description;
    _data['thumbnail_url'] = thumbnailUrl;
    _data['content_url'] = contentUrl;
    _data['tags'] = tags.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Tags {
  Tags({
    required this.name,
    required this.color,
  });

  late final String name;
  late final String color;

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['color'] = color;
    return _data;
  }
}
