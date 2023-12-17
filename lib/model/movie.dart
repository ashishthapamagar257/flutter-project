


class Movie{
  final String title;
  final String overview;
  final String poster_path;
  final String vote_average;
  final int id;

  Movie({
    required this.title,
    required this.overview,
    required this.id,
    required this.poster_path,
    required this.vote_average
});
  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
        title: json['title'],
        overview: json['overview'],
        id: json['id'],
        poster_path: json['poster_path'],
        vote_average: json['vote_average'].toString()
    );
  }
  @override
  String toString(){
    return 'Movie('
        "title: ${this.title},"
        "overview: ${this.overview},"
        "id: ${this.id},"
        "poster_path: ${this.poster_path},"
        "vote_average: ${this.vote_average}"
    ')';
  }

}
final data = {
  "_id": "EgCOqrOa1",
  "content": "Learning is the beginning of wealth. Learning is the beginning of health. Learning is the beginning of spirituality. Searching and learning is where the miracle process all begins.",
  "author": "Jim Rohn",
  "tags": [
    "Inspirational"
  ],
  "authorSlug": "jim-rohn",
  "length": 180,
  "dateAdded": "2020-09-29",
  "dateModified": "2023-04-14"
};

class Data {
  List<String>tags;


  Data({
    required this.tags
});
}