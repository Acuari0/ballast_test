import 'package:ballast_test/domain/entities/actions/actions.dart';
import 'package:ballast_test/domain/entities/models/app_state.dart';
import 'package:ballast_test/domain/entities/models/user.dart';
import 'package:ballast_test/domain/entities/reducers/app_reducer.dart';
import 'package:flutter_test/flutter_test.dart';

final initialState = AppState(
    user: User.defaultValues(),
    products: [],
    loading: false);

void main() {
  group('Loading Reducer Test', () {
    test('_setLoadingReducer handle', () {

      bool loading=true;
      final finalStore = appReducer(initialState, SetLoading(loading));

      expect(loading, finalStore.loading);
    });
  });
}