import 'package:hive_flutter/adapters.dart';

// Models
import 'package:ceiba/app/models/user.dart';

// Resource
import 'package:ceiba/app/resources/database_resource.dart';

class DatabaseProvider implements DatabaseResource {

  late final Box usersDB;

  static final DatabaseProvider _singleton = DatabaseProvider._internal();
  DatabaseProvider._internal();
  static DatabaseProvider get instance => _singleton;  

  @override
  Future<void> initDatabase() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    usersDB = await Hive.openBox<User>('users');
  }

  @override
  void saveListUsers(List<User> users) {
    usersDB.addAll(users);
  }

  @override
  List<User> getListUsers() {
    final List<User> listUsers = usersDB.values.toList() as List<User>;
    return listUsers;
  }

}
