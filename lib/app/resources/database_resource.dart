// Models
import 'package:ceiba/app/models/user.dart';

abstract class DatabaseResource {
  
  Future<void> initDatabase();
  void saveListUsers(List<User> users);
  List<User> getListUsers();

}