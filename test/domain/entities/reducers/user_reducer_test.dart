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
  group('User Reducer Test', () {
    test('_setUserReducer handle', () async{

      User user = User(name: "jos", token: "ue");
      final finalStore = appReducer(initialState, SetUser(user));

      expect(user, finalStore.user);
    });
  });
}