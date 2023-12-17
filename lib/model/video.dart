


class Video {
  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final String size;
  final String type;
  final String official;
  final String publishedAt;
  final String id;

  Video({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      iso6391: json['iso6391'],
      iso31661: json['iso31661'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'].toString(),
      type: json['type'],
      official: json['official'].toString(),
      publishedAt: json['publishedAt'],
      id: json['id'],
    );
  }
}