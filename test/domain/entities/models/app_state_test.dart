import 'package:ballast_test/domain/entities/models/app_state.dart';
import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:ballast_test/domain/entities/models/user.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('App state model', () {
    test('App state constructor', ()  async{
      AppState appState = AppState(user: User.defaultValues(), loading: true,
          products:  List<Product>.generate(10, (index) => Product(
              id: index,title: "Pókemon $index",description: "",image: ""
          )));
      expect(appState is AppState, true);
    });

    test('toJson()', () async {
      AppState appState = AppState(user: User.defaultValues(), loading: true,
          products:  List<Product>.generate(10, (index) => Product(
              id: index,title: "Pókemon $index",description: "",image: ""
          )));
      expect(appState.toJson() is Map<String, dynamic>, true);
    });

    test('toString()', () async {
      AppState appState = AppState(user: User.defaultValues(), loading: true,
          products:  List<Product>.generate(10, (index) => Product(
              id: index,title: "Pókemon $index",description: "",image: ""
          )));

      expect(appState.toString() is String, true);
    });
  });
}

