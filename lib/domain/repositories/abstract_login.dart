import 'package:ballast_test/domain/entities/models/user.dart';

abstract class AbstractLoginRepository {

  User? login({String? username, String? password, dynamic dispatch});

  Future<void> logout({dynamic dispatch});

  Future<bool> checkLogin();

}