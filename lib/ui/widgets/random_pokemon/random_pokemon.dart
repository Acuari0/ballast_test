import 'package:ballast_test/domain/entities/models/pokemon.dart';
import 'package:ballast_test/ui/common/utils.dart';
import 'package:ballast_test/ui/constants/constants.dart';
import 'package:ballast_test/ui/constants/styles/box_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomPokemon extends StatefulWidget{
  final int? number;
  RandomPokemon({Key? key,this.number}): super(key:key);

  @override
  State<RandomPokemon> createState() => _RandomPokemonState();
}

class _RandomPokemonState extends State<RandomPokemon> {
  Pokemon pokemon=Pokemon.defaultValue();


  @override
  Widget build(BuildContext context) {
    pokemon=Pokemon.fromJson(pokemons[widget.number!]);
    return Container(

      height: 200,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      decoration: roundedRectangle().copyWith(
        color: HexColor(pokemon.color!)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Image.asset(pokemon.image!)),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child: Text(pokemon.name!,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: pokemon.text_color! == "white"?
                  Colors.white:Colors.black
              ),)),
              SizedBox(height: 10,),
              Container(child:  Text(pokemon.description!,
                style: TextStyle(
                    color: pokemon.text_color! == "white"?
                    Colors.white:Colors.black
                ),))
            ],
          ))

        ],
      ),
    );
  }
}