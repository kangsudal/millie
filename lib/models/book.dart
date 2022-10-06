class Book {
  final String id;
  final String title;
  final List<String> authors;

  const Book({
    required this.id,
    required this.title,
    required this.authors,
  });

  factory Book.fromJson(Map json) {
    return Book(
      id: json['id'],
      title: json['title'],
      authors: json['author'],
    );
  }
}
