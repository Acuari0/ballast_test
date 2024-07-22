import 'package:ballast_test/ui/widgets/store/my_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils.dart';

void main() {
  group('store widget', () {
    testWidgets('Store is created successfully', (WidgetTester tester) async {
      Widget widget = createElementTestWrapper(child: Column());
      Finder finder = find.byWidget(widget);
      await tester.pumpWidget(MyStore(child: widget));
      expect(finder, findsOneWidget);
    });
  });
}