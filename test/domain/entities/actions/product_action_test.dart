import 'package:ballast_test/domain/entities/actions/actions.dart';
import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Product Action', () {

    test('SetProduct()', () async {
      final Product product = Product(id: 299,
      title: "Hello",
      description: "pokemon",
      image: "http");
      final SetProduct setProduct = SetProduct(product);

      expect(setProduct.product.id, product.id);
      expect(setProduct.product.title, product.title);
      expect(setProduct.product.description, product.description);
      expect(setProduct.product.image, product.image);
    });

  });
}