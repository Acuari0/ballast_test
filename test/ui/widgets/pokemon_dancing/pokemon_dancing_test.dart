import 'package:ballast_test/ui/widgets/CustomFlatButton/CustomFlatButton.dart';
import 'package:ballast_test/ui/widgets/pokemon_dancing/pokemon_dancing.dart';
import 'package:ballast_test/ui/widgets/random_pokemon/random_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils.dart';

void main(){
  group('Pokemon Dancing widget', (){
    testWidgets('Random Pokemon is created', (WidgetTester tester) async {
      final testKey = Key('test');
      Widget testWidget = createElementTestWrapper(child:
      PokemonDancing(
           key: testKey));

      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(seconds: 1));
      expect(find.byKey(testKey), findsOneWidget);
    });
  });
}