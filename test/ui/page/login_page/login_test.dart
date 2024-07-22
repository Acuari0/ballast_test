import 'package:ballast_test/data/repositories/simple_login.dart';
import 'package:ballast_test/domain/entities/models/app_state.dart';
import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:ballast_test/domain/entities/models/user.dart';
import 'package:ballast_test/ui/page/login_page/login.dart';
import 'package:ballast_test/ui/page/summary_page/summary_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../utils.dart';


void main(){
  SimpleLogin simpleLogin=SimpleLogin();

  group("Login View", () {
    testWidgets('LoginView is created', (WidgetTester tester) async {
      await loadAppFonts();
      await tester.runAsync(() async {
        Widget test = createWrapper(
            child: Login(simpleLogin:simpleLogin ,),
            state: AppState(
              user: User.defaultValues(),
              products: [],
              loading: false,));
        await tester.pumpWidget(test);
        await tester.pump(Duration(seconds: 1));

        expect(find.byKey(const Key('username')), findsOneWidget);
        expect(find.byKey(const Key('login')), findsOneWidget);
        expect(find.byKey(const Key('password')), findsOneWidget);
        expect(find.byKey(const Key('visibility_button')), findsOneWidget);
        expect(find.byKey(const Key('login_button')), findsOneWidget);

      });
    });

  });

}