import 'dart:async' as _i4;

import 'package:ceiba/app/models/error.dart' as _i5;
import 'package:ceiba/app/models/publication.dart' as _i7;
import 'package:ceiba/app/models/user.dart' as _i6;
import 'package:ceiba/app/resources/home_resource.dart' as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [HomeResource].

class MockHomeResource extends _i1.Mock implements _i3.HomeResource {
  MockHomeResource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.CeibaError, List<_i6.User>>> getListUsers() =>
      (super.noSuchMethod(Invocation.method(#getListUsers, []),
          returnValue: Future<_i2.Either<_i5.CeibaError, List<_i6.User>>>.value(
              _FakeEither_0<_i5.CeibaError, List<_i6.User>>())) as _i4
          .Future<_i2.Either<_i5.CeibaError, List<_i6.User>>>);
  @override
  _i4.Future<_i2.Either<_i5.CeibaError, List<_i7.Publication>>>
      getListPublications(int? userId) => (super.noSuchMethod(
              Invocation.method(#getListPublications, [userId]),
              returnValue: Future<
                      _i2.Either<_i5.CeibaError, List<_i7.Publication>>>.value(
                  _FakeEither_0<_i5.CeibaError, List<_i7.Publication>>()))
          as _i4.Future<_i2.Either<_i5.CeibaError, List<_i7.Publication>>>);
}
