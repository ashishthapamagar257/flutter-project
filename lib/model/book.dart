class Book {
  final String title;
  final String image;
  final String detail;
  final String rating;
  final String genre;

  Book({
    required this.title,
    required this.image,
    required this.detail,
    required this.rating,
    required this.genre,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['title'] ?? 'no-title',
        image: json['image'],
        detail: json['detail'],
        rating: json['rating'],
        genre: json['genre']);
  }
}
