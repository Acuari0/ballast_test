import 'dart:io';

import 'package:ballast_test/domain/entities/models/app_state.dart';
import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:ballast_test/domain/entities/models/user.dart';
import 'package:ballast_test/ui/page/summary_page/summary_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';


import '../../../utils.dart';


void main(){

  group("Summary widget", () {
    testWidgets('Summary view is created', (WidgetTester tester) async {
      await loadAppFonts();
      await tester.runAsync(() async {
        Widget test = createWrapper(
            child: SummaryPage(product: Product(id: 299,
                title: "Hello",
                description: "pokemon",
                image: "http"),),
            state: AppState(
                user: User.defaultValues(),
                products: [],
                loading: false,));
        await tester.pumpWidget(test);
        await tester.pump(Duration(seconds: 1));

        expect(find.byKey(const Key('arrow_back')), findsOneWidget);
        expect(find.byKey(const Key('title')), findsOneWidget);
        expect(find.byKey(const Key('description')), findsOneWidget);
        expect(find.byKey(const Key('id')), findsOneWidget);

      });
    });

    testGoldens("Summary Golden", (WidgetTester tester) async{
      await loadAppFonts();
      await tester.runAsync(() async {
        Widget test = createWrapper(
            child: MaterialApp(
              home: Scaffold(
                body: SummaryPage(product: Product(id: 299,
                    title: "Hello",
                    description: "pokemon",
                    image: "http"),
                isTest: true),
              ),
            ),
            state: AppState(
              user: User(name: "Admin",token: "token"),
              products: [],
              loading: false,));

        await tester.pumpWidget(test);
        await tester.pumpAndSettle();

        expect(find.byKey(const Key('arrow_back')), findsOneWidget);
        expect(find.byKey(const Key('title')), findsOneWidget);
        expect(find.byKey(const Key('description')), findsOneWidget);
        expect(find.byKey(const Key('id')), findsOneWidget);

        await tester.pumpAndSettle();

      });

      await screenMatchesGolden(tester, 'summary');
    });


  });

}