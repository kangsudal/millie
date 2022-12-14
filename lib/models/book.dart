class Book {
  final String? id;
  final String? title;
  final List authors;
  final String thumbnail;

  const Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.thumbnail,
  });

  factory Book.fromJson(Map json) {
    String thumbnail;
    List authors;
    if (json['volumeInfo']['imageLinks'] != null) {
      thumbnail = json['volumeInfo']['imageLinks']['thumbnail'];
    } else {
      thumbnail =
          '';
    }

    if (json['volumeInfo']['authors'] != null) {
      authors = json['volumeInfo']['authors'];
    } else {
      authors = [''];
    }

    return Book(
      id: json['id'],
      title: json['volumeInfo']['title'],
      authors: authors,
      thumbnail: thumbnail,
    );
  }
}
