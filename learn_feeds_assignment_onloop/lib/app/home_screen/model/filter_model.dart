class FilterModel {
  FilterModel({required this.tags});

  late final List<Tags> tags;

  FilterModel.fromJson(Map<String, dynamic> json) {
    tags = List.from(json['tags']).map((e) => Tags.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tags'] = tags.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Tags {
  Tags({required this.name, required this.color});

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
