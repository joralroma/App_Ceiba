import 'package:dartz/dartz.dart';

// Models
import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/models/error.dart';

// Resource
import 'package:ceiba/app/resources/database_resource.dart';

class DatabaseProvider implements DatabaseResource {

  DatabaseProvider();

  @override
  Future<Either<CeibaError, List<User>>> getListUsers() async {
    return const Right([]);
  }

}
