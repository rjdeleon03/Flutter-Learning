/// A placeholder class that represents an entity or model.
class News{
  
  News(this.title, this.content);

  String title;
  String content;

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
      };
}
