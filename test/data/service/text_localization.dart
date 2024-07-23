import 'package:ballast_test/data/service/delegate.dart';
import 'package:ballast_test/data/service/text_localization.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Text Localization', () {
    TextLocalization textLocalization= TextLocalization();
    test('Text Localization success', () async {
      expect(textLocalization.text(id: 'movie'), "Movies");
    });

    test('Text Localization failed', () async {
      expect(textLocalization.text(id: 'movi'), "");
    });

  });
}