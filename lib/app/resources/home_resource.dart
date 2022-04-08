import 'package:dartz/dartz.dart';

// Models
import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/models/error.dart';
import 'package:ceiba/app/models/publication.dart';

abstract class HomeResource {
  
  Future<Either<CeibaError, List<User>>> getListUsers();
  Future<Either<CeibaError, List<Publication>>> getListPublications(int userId);

}