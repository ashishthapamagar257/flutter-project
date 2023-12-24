


class Movie{
  final String title;
  final String overview;
  final String poster_path;
  final String backdrop_path;
  final String vote_average;
  final int id;

  Movie({
    required this.title,
    required this.overview,
    required this.id,
    required this.poster_path,
    required this.backdrop_path,
    required this.vote_average
});
  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
        title: json['title'] ?? '',
        overview: json['overview'] ?? '',
        id: json['id'] ?? '',
        poster_path: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
        backdrop_path: 'https://image.tmdb.org/t/p/w500${json['backdrop_path']}',
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
// class Reco{
//   final String userId;
//   final String id;
//   final String title;
//   final String body;
//
//
//   Reco({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.body
// });
//
//   factory Reco.fromJson(Map<String, dynamic>json){
//     return Reco(
//     userId: json['userId'] ??'',
//     id: json['id']??'',
//   title: json['title']??'',
//   body: json['body'].toString()
//   );
//   }
//
// }