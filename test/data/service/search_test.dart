import 'package:ballast_test/data/service/search.dart';
import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Search', () {
    Search search = Search();
    List<Product> products= List<Product>.generate(10, (index) => Product(
      id: index,title: "Pókemon $index",description: "",image: ""
    ));

    test('Filter empty', () async {
      List<Product> map = await search.Filter("", products);
      expect(map.length, 0);
    });

    test('Filter word normal', () async {
      List<Product> map = await search.Filter("pokemon", products);
      expect(map.length, 10);
    });

    test('Filter word diacritic', () async {
      List<Product> map = await search.Filter("pokemón", products);
      expect(map.length, 10);
    });

    test('Filter no found', () async {
      List<Product> map = await search.Filter("asjsd", products);
      expect(map.length, 0);
    });

    test('Filter by index', () async {
      List<Product> map = await search.Filter("1", products);
      expect(map.length, 1);
    });

    test('Filter only one ', () async {
      List<Product> map = await search.Filter("pokemon 1", products);
      expect(map.length, 1);
    });

  });
}