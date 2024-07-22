import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:ballast_test/domain/services/abstrac_search.dart';
import 'package:diacritic/diacritic.dart';
import 'package:full_text_search/searches.dart';

class Search extends AbstractSearch {
  @override
  Future<List<Product>> Filter(String text3, List<Product> products) async {
    List<Product> aux = [];
    FullTextSearch<Product> a = FullTextSearch(
        isMatchAll: true,
        isStartsWith: false,
        ignoreCase: false,
        term: removeDiacritics(text3),
        items: products,
        tokenize: (element) {
          List<String> a2 = [];
          List<String> ai = element.title!.split(' ');
          ai.addAll(element.id.toString().split(' '));
          a2 = ai.map((e) => removeDiacritics(e)).toList();
          return a2;
        });
    await a.findResults().then((value) {
      aux.addAll(value);
    });
    return aux;
  }
}
