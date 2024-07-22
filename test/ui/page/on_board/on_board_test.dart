import 'package:ballast_test/data/repositories/simple_login.dart';
import 'package:ballast_test/domain/entities/models/app_state.dart';
import 'package:ballast_test/domain/entities/models/user.dart';
import 'package:ballast_test/ui/page/on_board/on_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/services.dart';
import 'package:mockito/annotations.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  FlutterSecureStorage storage=FlutterSecureStorage();
  SimpleLogin simpleLogin= SimpleLogin();
  group('On borad widget', () {
    testWidgets('On Board view ', (WidgetTester tester) async {
      await tester.runAsync(() async {
        Widget test = createWrapper(
            child: LoginPage(key: Key('login'),
              storage: storage, authenticationService: simpleLogin,),
            state: AppState(
                user: User.defaultValues(),
                products: [],
                loading: false,
                ));
        await tester.pumpWidget(test);
        await tester.pump(Duration(seconds: 1));

        expect(find.byKey(Key('login')), findsAny);
      });
    });


  });
}