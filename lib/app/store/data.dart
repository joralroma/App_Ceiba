// Models
import 'package:ceiba/app/models/user.dart';

class CeibaData {

  static final CeibaData _singleton = CeibaData._internal();
  CeibaData._internal();
  static CeibaData get instance => _singleton;

  User? user;

}
