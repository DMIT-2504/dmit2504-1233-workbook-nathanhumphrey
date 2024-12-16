class Quote {
  int? id;
  String author;
  String text;

  Quote({this.id, this.author = 'Unknown', required this.text});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'text': text,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['id'],
      author: map['author'],
      text: map['text'],
    );
  }

  @override
  String toString() {
    return '$id: $text - $author';
  }
}
