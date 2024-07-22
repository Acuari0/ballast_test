import 'package:ballast_test/domain/entities/reducers/list_products_reducer.dart';
import 'package:ballast_test/domain/entities/reducers/product_reducer.dart';
import 'package:ballast_test/domain/entities/reducers/user_reducer.dart';
import '../models/app_state.dart';
import 'loading_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      user: userReducer(state.user, action),
      loading: loadingReducer(state.loading, action),
      products: productsReducer(state.products,action));
}
