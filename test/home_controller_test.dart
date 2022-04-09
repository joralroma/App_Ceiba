import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_test/flutter_test.dart';

// Resource
import 'package:ceiba/app/resources/home_resource.dart';

// Models
import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/models/error.dart';
import 'package:ceiba/app/models/publication.dart';

// Controller
import 'package:ceiba/app/ui/home/home_controller.dart';

// Mock
import 'mocks/home_controller_test.mocks.dart';

@GenerateMocks([HomeResource])
void main() {

  final MockHomeResource homeMock = MockHomeResource();

  BindingsBuilder(
    () {     
      Get.put<HomeController>(HomeController(homeMock));
    }
  ).builder();

  final HomeController _homeController = Get.find<HomeController>();

  final List<User> _users = [];
  final CeibaError _error = CeibaError('');
  final List<Publication> _publications = [];

  test('Get List Users fail', () async {

    when(homeMock.getListUsers()).thenAnswer((_) async => Future.value(Left(_error)) );

    final CeibaError? error = await _homeController.getListUsers();

    expect(error, equals(_error));
  
    expect(_homeController.loadingUsers, true);

  });

  test('Get List Users success', () async {

    when(homeMock.getListUsers()).thenAnswer((_) async => Future.value(Right(_users)) );

    final CeibaError? error = await _homeController.getListUsers();

    expect(error, isNull);

    expect(_homeController.loadingUsers, false);
  
    expect(_homeController.users$,  equals(_users));

  });

  test('Get List Publications fail', () async {

    when(homeMock.getListPublications(1)).thenAnswer((_) async => Future.value(Left(_error)) );

    final CeibaError? error = await _homeController.getListPublications(1);

    expect(error, equals(_error));

    expect(_homeController.loadingPublications, true);

  });
  
  test('Get List Products success', () async {

    when(homeMock.getListPublications(1)).thenAnswer((_) async => Future.value(Right(_publications)) );

    final CeibaError? error = await _homeController.getListPublications(1);

    expect(error, isNull);

    expect(_homeController.loadingPublications, false);

  });

}