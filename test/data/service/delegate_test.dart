import 'package:ballast_test/data/service/delegate.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Delegate', () {
    Delegate delegate=Delegate();
    test('obtainDescriptionElements Success', () async {
      Map<String, dynamic> map = await delegate.obtainDescriptionElements(512);
      expect(map.isNotEmpty, true);
    });

    test('obtainDescriptionElements failes', () async {
      Map<String, dynamic> map = await delegate.obtainDescriptionElements(2);
      expect(map.isNotEmpty,false );
    });

    test('obtainDescriptionElements Success', () async {
      List<dynamic> map = await delegate.obtainListElements();
      expect(map.isNotEmpty, false);
    });

  });
}