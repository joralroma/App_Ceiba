class Publication {

  final int id;
  final int userId;
  final String title;
  final String body;

  Publication(
    this.id,
    this.userId,
    this.title,
    this.body
  );

  static Publication fromJson(json) {
    Publication publication = Publication(
      json['id'],
      json['userId'],
      json['title'],
      json['body']
    );
    return publication;
  }

  static List<Publication> fromJsonList(Iterable data) {
    List<Publication> list = [];
    for (var e in data) {
      list.add(fromJson(e));
    }
    return list;
  }

}