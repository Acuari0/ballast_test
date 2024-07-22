import 'package:ballast_test/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('main widget', () {
    testWidgets('main view is created', (WidgetTester tester) async {
      await tester.runAsync(() async {
        Widget test = createStoreWrapper(child: MyApp());
        await tester.pumpWidget(test);
        await tester.pump(Duration(seconds: 1));
        expect(find.byKey(Key('main')), findsOneWidget);
      });
    });
    testWidgets('Splashview is created', (WidgetTester tester) async {
      await tester.runAsync(() async {
        Widget test = createStoreWrapper(child: MyApp());
        await tester.pumpWidget(test);
        await tester.pump(Duration(seconds: 1));
        expect(find.byKey(Key('splash')), findsOneWidget);
      });
    });
  });


}