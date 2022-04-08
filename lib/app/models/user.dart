class User {

  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;

  User(
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone
  );

  static User fromJson(json) {
    User user = User(
      json['id'],
      json['name'],
      json['username'],
      json['email'],
      json['phone']
    );
    return user;
  }

  static List<User> fromJsonList(Iterable data) {
    List<User> list = [];
    for (var e in data) {
      list.add(fromJson(e));
    }
    return list;
  }

}