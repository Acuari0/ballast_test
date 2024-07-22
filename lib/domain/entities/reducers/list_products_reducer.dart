import 'package:ballast_test/domain/entities/actions/list_product_action.dart';
import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:redux/redux.dart';


final productsReducer = TypedReducer<List<Product>, SetListProduct>(_setListProductReducer);

List<Product> _setListProductReducer(List<Product> state, SetListProduct action) {
  return action.products;
}