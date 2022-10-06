class Book {
  final String? id;
  final String? title;
  final List<String>? authors;
  final String thumbnail;

  const Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.thumbnail,
  });

  factory Book.fromJson(Map json) {
    if(json['volumeInfo']['imageLinks']!= null){
      return Book(
        id: json['id'],
        title: json['volumeInfo']['title'],
        authors: json['volumeInfo']['author'],
        thumbnail: json['volumeInfo']['imageLinks']['thumbnail'],
      );
    }else{
      return Book(
        id: json['id'],
        title: json['volumeInfo']['title'],
        authors: json['volumeInfo']['author'],
        thumbnail: 'https://images.unsplash.com/photo-1630427144557-245b51ee70be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80',
      );
    }

  }
}
