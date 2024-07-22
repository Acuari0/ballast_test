import 'package:ballast_test/domain/entities/actions/list_product_action.dart';
import 'package:ballast_test/domain/entities/models/app_state.dart';
import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:ballast_test/domain/entities/models/user.dart';
import 'package:ballast_test/domain/entities/reducers/app_reducer.dart';

import 'package:flutter_test/flutter_test.dart';

final initialState = AppState(
    user: User.defaultValues(),
    products: [],
    loading: false);

void main() {
  group('Products Reducer Test', () {
    test('_setProductReducer handle', () {

      List<Product> products=List<Product>.generate(10, (index) => Product(
          id: index,title: "Pókemon $index",description: "",image: ""
      ));
      final finalStore = appReducer(initialState, SetListProduct(products));

      expect(products, finalStore.products);
    });
  });
}