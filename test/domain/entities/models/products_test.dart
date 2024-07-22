import 'package:ballast_test/domain/entities/models/app_state.dart';
import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:ballast_test/domain/entities/models/user.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('Product model', () {
    test('Product constructor', ()  async{
      Product product =  Product(id: 299,
          title: "Hello",
          description: "pokemon",
          image: "http");
      expect(product is Product, true);
    });

    test('toJson()', () async {
      Product product =  Product(id: 299,
          title: "Hello",
          description: "pokemon",
          image: "http");
      expect(product.toJson() is Map<String, dynamic>, true);
    });

    test('toString()', () async {
      Product product =  Product(id: 299,
          title: "Hello",
          description: "pokemon",
          image: "http");

      expect(product.toString() is String, true);
    });

    test('defaultValues()', () async {
      expect(Product.defaultValue() is Product, true);
    });
  });
}