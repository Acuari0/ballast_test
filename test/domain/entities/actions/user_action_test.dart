import 'package:ballast_test/domain/entities/actions/actions.dart';
import 'package:ballast_test/domain/entities/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('User Action', () {

    test('SetUser()', () async {
      final User user = User(name: "admin",
      token: "token");
      final SetUser setUser = SetUser(user);

      expect(setUser.user.name, user.name);
      expect(setUser.user.token, user.token);
    });

  });
}