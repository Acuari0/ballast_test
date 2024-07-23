import 'package:ballast_test/data/service/delegate.dart';
import 'package:ballast_test/domain/entities/actions/actions.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'dart:math';

import '../../domain/entities/models/products.dart';

Future<List<Product>> obtainElements(Delegate delegate, List<Product> vm, dynamic dispatch) async {
  dispatch(SetLoading(true));
  await delegate.obtainListElements().then((value) {
    value.forEach((element) {
      vm.add(Product.fromJson(
          element));
    });
  });

  dispatch(SetLoading(false));
  return vm;
}

int randomNumber(int min, int max) {
  return min + Random().nextInt(max - min);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

void showErrorrDialog(context)=>
    QuickAlert.show(context: context, type: QuickAlertType.error,
        confirmBtnColor: Colors.red);


