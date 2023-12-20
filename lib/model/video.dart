


class Video {

  final String name;
  final String key;
  final String site;
  final String size;
  final String type;
  final String official;
  final String published_at;
  final String id;

  Video({

    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.published_at,
    required this.id,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(

      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'].toString(),
      type: json['type'],
      official: json['official'].toString(),
      published_at: json['published_at'],
      id: json['id'],
    );
  }
}