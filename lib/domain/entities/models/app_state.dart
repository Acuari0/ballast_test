
import 'dart:convert';
import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:ballast_test/domain/entities/models/user.dart';

class AppState {
  final User user;
  final bool loading;
  final List<Product> products;

  const AppState(
      {required this.user,
      required this.loading,
      required this.products});

  Map<String, dynamic> toJson() => {
        'user': user,
        'loading': loading,
        'products':products
      };

  @override
  String toString() {
    return 'AppState: ${const JsonEncoder.withIndent('  ').convert(this)}';
  }
}
