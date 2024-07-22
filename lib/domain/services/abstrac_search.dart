import '../entities/models/products.dart';

abstract class AbstractSearch {

  Future<List<Product>> Filter(String text3, List<Product> products);


}