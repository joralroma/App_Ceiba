import 'package:dartz/dartz.dart';

// Models
import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/models/error.dart';

abstract class DatabaseResource {
  
  Future<Either<CeibaError, List<User>>> getListUsers();

}