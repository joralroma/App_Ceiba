import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

// Models
import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/models/error.dart';
import 'package:ceiba/app/models/input.dart';
import 'package:ceiba/app/models/publication.dart';

// Resource
import 'package:ceiba/app/resources/home_resource.dart';

class HomeController extends GetxController {

  final HomeResource _homeResource;

  HomeController(this._homeResource);

  final RxBool _loadingUsers = RxBool(true);

  final RxBool _loadingPublications = RxBool(true);

  final RxList<User> _users = RxList([]);

  final RxList<Publication> _publications = RxList([]);

  final InputModel search = InputModel();

  @override
  void onInit() {
    search.onChange(_onChangeSearch);
    super.onInit();
  }

  @override
  void onClose() {
    _loadingUsers.close();
    _users.close();
    _loadingPublications.close();
    _publications.close();
    search.dispose();
    super.onClose();
  }

  bool get loadingUsers => _loadingUsers.value;
  set loadingUsers(bool value) => _loadingUsers.value = value;

  bool get loadingPublications => _loadingPublications.value;
  set loadingPublications(bool value) => _loadingPublications.value = value;

  List<User> get users => _users.value;
  set users(List<User> value) => _users.value = value;

  List<Publication> get publications => _publications.value;
  set publications(List<Publication> value) => _publications.value = value;

  void _onChangeSearch() {
    _users.addAll([]);
  }

  bool filter(User s) {
    return s.username.toLowerCase().contains(search.text.toLowerCase());
  }

  Future<CeibaError?> getListUsers() async {
    CeibaError? _error;
    final Either<CeibaError, List<User>> result = await _homeResource.getListUsers();
    result.fold(
      (l) => _error = l,
      (r) => _doSuccessGetListUsers(r)
    );    
    return _error;
  }

  void _doSuccessGetListUsers(List<User> items) {
    users = items;
    loadingUsers = false;
  }

  Future<CeibaError?> getListPublications(int userId) async {
    CeibaError? _error;
    loadingPublications = true;
    publications = [];
    final Either<CeibaError, List<Publication>> result = await _homeResource.getListPublications(userId);
    result.fold(
      (l) => _error = l,
      (r) => _doSuccessGetListPublications(r)
    );    
    return _error;
  }

  void _doSuccessGetListPublications(List<Publication> items) {
    publications = items;
    loadingPublications = false;
  }

}