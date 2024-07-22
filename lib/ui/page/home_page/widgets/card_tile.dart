import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:ballast_test/ui/page/summary_page/summary_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardTile extends StatelessWidget{
  final Product? product;
  CardTile({Key? key,this.product}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return product!=null?
    Column(
      children: [
        ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(product!.title!),
          leading: Image.network(product!.image!,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.image),),
          trailing: Text(product!.id.toString()),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SummaryPage(
                      product: product,)));
          },
        ),
        Divider(),
      ],
    ):SizedBox();
  }

}