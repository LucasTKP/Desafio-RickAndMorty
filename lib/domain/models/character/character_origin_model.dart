class CharacterOriginModel {
  final String name;
  final String url;

  CharacterOriginModel({required this.name, required this.url});

  factory CharacterOriginModel.fromJson(Map<String, dynamic> json) {
    return CharacterOriginModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
