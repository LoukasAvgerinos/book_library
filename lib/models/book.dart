class Book {
  final int? id;
  final String title;
  final String author;

  const Book({
    this.id,
    required this.title,
    required this.author,
  });

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as int?,
      title: map['title'] as String,
      author: map['author'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
    };
  }

  @override
  String toString() => 'Book(id: $id, title: $title, author: $author)';
}
