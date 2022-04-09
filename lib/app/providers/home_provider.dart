import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';

// Models
import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/models/error.dart';
import 'package:ceiba/app/models/publication.dart';

// Resource
import 'package:ceiba/app/resources/http_resource.dart';
import 'package:ceiba/app/resources/home_resource.dart';
import 'package:ceiba/app/resources/database_resource.dart';

class HomeProvider implements HomeResource {

  final HttpResource _http;
  final DatabaseResource _databaseResource;

  HomeProvider(this._http, this._databaseResource);

  @override
  Future<Either<CeibaError, List<User>>> getListUsers() async {
    final CeibaError error = CeibaError('body.usersError');
    try {
      List<User> _items = _databaseResource.getListUsers();
      if(_items.isEmpty) {
        const String _url = 'users';
        final response = await _http.httpGet(_url);
        final data = json.decode(response.body);
        if (response.statusCode == 200) {
          _items = User.fromJsonList(data);
          _databaseResource.saveListUsers(_items);
        } else {
          return Left(error);
        }
      }
      return Right(_items);
    } catch (e) {
      return Left(error);
    }
  }

  @override
  Future<Either<CeibaError, List<Publication>>> getListPublications(int userId) async {
    final CeibaError error = CeibaError('body.publicationsError');
    try {
      final String _url = 'posts?userId=$userId';
      final response = await _http.httpGet(_url);
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        final List<Publication> _items = Publication.fromJsonList(data);
        return Right(_items);
      } else {
        return Left(error);
      }
    } catch (e) {
      inspect(e);
      return Left(error);
    }
  }

}
