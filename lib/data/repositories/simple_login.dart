import 'package:ballast_test/data/constants.dart' as Constant;
import 'package:ballast_test/domain/entities/actions/actions.dart';
import 'package:ballast_test/domain/entities/models/user.dart';
import 'package:ballast_test/domain/repositories/abstract_login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/actions/loading_action.dart';

class SimpleLogin extends AbstractLoginRepository {
  FlutterSecureStorage? storage = FlutterSecureStorage();

  @override
  User? login({String? username, String? password, dynamic dispatch}) {
    dispatch(SetLoading(true));

    if (username != null && password != null) if (username == 'admin' &&
        password == 'admin') {
      storage!.write(key: Constant.TOKEN, value: "token");
      dispatch(SetUser(User(name: "Admin", token: "token")));
      dispatch(SetLoading(false));
      return User(name: "Admin");
    }
    dispatch(SetLoading(false));
    return null;
  }

  @override
  Future<bool> checkLogin() async {
    String? token = await storage!.read(key: Constant.TOKEN);
    if (token != null) {
      return true;
    }

    return false;
  }

  @override
  Future<void> logout({dispatch}) async {
    dispatch(SetLoading(true));
    storage!.delete(key: Constant.TOKEN);
    if (dispatch != null) {
      await dispatch(SetUser(User.defaultValues()));
      await dispatch(SetLoading(false));
    }
    dispatch(SetLoading(false));
  }
}
