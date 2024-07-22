import 'package:ballast_test/ui/widgets/CustomFlatButton/CustomFlatButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils.dart';


void main(){
  group('CustomFlatButton widget', (){
    testWidgets('CustomFlatButton is created', (WidgetTester tester) async {
      final testKey = Key('test');
      Widget testWidget = createElementTestWrapper(child:
      CustomFlatButton(
          text: "Logout",
          icon: Icons.power_settings_new,
          onPress: ()  {

          }, key: testKey));

      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(seconds: 1));
      expect(find.byKey(testKey), findsOneWidget);
    });
  });
}