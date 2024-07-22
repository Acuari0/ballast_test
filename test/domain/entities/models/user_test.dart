import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:ballast_test/domain/entities/models/user.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('User model', () {
    test('User constructor', ()  async{
     User user = User(name: "jos", token: "ue");
      expect(user is User, true);
    });

    test('toJson()', () async {
      User user = User(name: "jos", token: "ue");
      expect(user.toJson() is Map<String, dynamic>, true);
    });

    test('toString()', () async {
      User user = User(name: "jos", token: "ue");
      expect(user.toString() is String, true);
    });

    test('defaultValues()', () async {
      expect(User.defaultValues() is User, true);
    });

    test('doAdmin()', () async {
      User user = User(name: "jos", token: "ue");
      user.doAdmin();
      expect(user.token, "token");
      expect(user.name, "Admin");
    });
  });
}