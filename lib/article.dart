class Article {
  int id;
  String content;
  String title;

  Article({this.id, this.content, this.title});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title']["rendered"],
      content: json['content']["rendered"],
    );
  }
}
