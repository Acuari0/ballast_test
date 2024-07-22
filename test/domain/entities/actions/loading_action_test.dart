import 'package:ballast_test/domain/entities/actions/actions.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Loading Action', () {

    test('SetLoading() true', () async {
      final bool loading = true;
      final SetLoading setLoading = SetLoading(loading);

      expect(setLoading.loading, loading);
    });
    test('SetLoading() false', () async {
      final bool loading = false;
      final SetLoading setLoading = SetLoading(loading);

      expect(setLoading.loading, loading);
    });
  });
}