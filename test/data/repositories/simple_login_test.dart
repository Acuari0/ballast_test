import 'package:ballast_test/data/repositories/simple_login.dart';
import 'package:ballast_test/domain/entities/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Simple Login', () {
    SimpleLogin simpleLogin= SimpleLogin();

    dispatch(dynamic any) {
      return true;
    }

    test('Login Failed', () async {
      expect(simpleLogin.login(username: "admn",
          password: "admin",dispatch: dispatch ),
          null);
    });
    test('Login Successfull', () async {
      User? user= simpleLogin.login(username: "admin", password: "admin",dispatch: dispatch);
      expect(user!.name!, "Admin");
    });

  });
}