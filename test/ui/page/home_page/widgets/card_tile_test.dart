import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:ballast_test/ui/constants/theme.dart';
import 'package:ballast_test/ui/page/home_page/widgets/card_tile.dart';
import 'package:ballast_test/ui/widgets/CustomFlatButton/CustomFlatButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils.dart';



void main(){
  group('CardTile widget', (){
    testWidgets('CardTile is created', (WidgetTester tester) async {
      final testKey = Key('test');
      Widget testWidget = createElementTestWrapper(
          child:
      MaterialApp(
        theme: appTheme,
        home: Scaffold(
          body: CardTile(key:testKey,product: Product(id: 299,
              title: "Hello",
              description: "pokemon",
              image: "http",
              ),
              ),
        ),
      ));
      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(seconds: 1));
      expect(find.byKey(testKey), findsOneWidget);
    });
  });
}