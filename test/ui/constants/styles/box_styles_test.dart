import 'package:ballast_test/ui/constants/styles/box_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    group('Styles Container', () {
        test('Box Style', () async {
            expect(roundedRectangle() is BoxDecoration, true);
        });
    });
}