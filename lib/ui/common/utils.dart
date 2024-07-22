import 'package:ballast_test/data/service/delegate.dart';
import 'package:ballast_test/domain/entities/actions/actions.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:full_text_search/searches.dart';
import 'package:quickalert/quickalert.dart';

import '../../domain/entities/models/products.dart';

void showErrorrDialog(context)=>
    QuickAlert.show(context: context, type: QuickAlertType.error,
    confirmBtnColor: Colors.red);


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


