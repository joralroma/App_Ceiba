import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String username;

  @HiveField(3)
  final String email;

  @HiveField(4)
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