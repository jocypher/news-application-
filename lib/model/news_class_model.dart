import 'package:hive/hive.dart';
part 'news_class_model.g.dart';

@HiveType(typeId: 0)
class NewsClass {
  @HiveField(0)
  final String? author;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? url;
  @HiveField(4)
  String? urlToImage;
  @HiveField(5)
  final String? content;

  NewsClass(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.content,
      this.urlToImage});

  factory NewsClass.fromJson(Map<String, dynamic> json) {
    return NewsClass(
        author: json['author'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        url: json['url'] ?? '',
        urlToImage: json['urlToImage'],
        content: json['content'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "author": author,
      "title": title,
      "description": description,
      "url": url,
      "content": content,
      "urlToImage":urlToImage
    };
  }

}
