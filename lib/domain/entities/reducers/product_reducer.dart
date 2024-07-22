import 'package:ballast_test/domain/entities/actions/actions.dart';
import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:redux/redux.dart';


final productReducer = TypedReducer<Product, SetProduct>(_setProductReducer);

Product _setProductReducer(Product state, SetProduct action) {
  return action.product;
}