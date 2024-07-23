import 'package:ballast_test/data/service/text_localization.dart';
import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:ballast_test/ui/common/utils.dart';
import 'package:ballast_test/ui/widgets/random_pokemon/random_pokemon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


import '../../../data/service/delegate.dart';

class SummaryPage extends StatefulWidget{
  final Product? product;
  final bool? isTest;
  SummaryPage({this.product, this.isTest});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  TextLocalization textLocalization=TextLocalization();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          key: Key('arrow_back'),
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 2,
        title: Text(textLocalization.text(id: "summary")),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,
        vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child:
              widget.isTest==null?
              Image.network(
                  key:Key('image'),
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.image),
                  widget.product!.image!):
              Icon(Icons.image),),
              SizedBox(height: 20,),
              Text(
                key:Key('title'),
                widget.product!.title!,
              style: TextStyle(fontWeight: FontWeight.w700,
              fontSize: 20),),
              Text(
                  key:Key('id'),
                  widget.product!.id.toString()),
              SizedBox(height: 20,),
              HtmlWidget(
                  key:Key('description'),
                  widget.product!.description!),
              SizedBox(height: 20,),
              RandomPokemon(number: randomNumber(0, 2),),
              SizedBox(height: 80,)
            ],
          ),
        ),
      ),
    );
  }
}