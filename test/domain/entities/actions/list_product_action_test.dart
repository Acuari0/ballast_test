import 'package:ballast_test/domain/entities/actions/actions.dart';
import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Action List Product', () {

    test('SetListProducts()', () async {
      final List<Product> products= List<Product>.generate(10, (index) => Product(
          id: index,title: "Pókemon $index",description: "",image: ""
      ));
      final SetListProduct setListProduct = SetListProduct(products);
      expect(setListProduct.products.isNotEmpty, true);
    });
  });
}