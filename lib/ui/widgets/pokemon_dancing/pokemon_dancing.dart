import 'package:flutter/cupertino.dart';

class PokemonDancing extends StatelessWidget{
  PokemonDancing({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/pikachu_dance.gif",
            height: 90.0,
            width: 90.0,
          ),
          Image.asset(
            "assets/evee_dance.gif",
            height: 90.0,
            width: 90.0,
          ),
          Image.asset(
            "assets/riolu_dance.gif",
            height: 80.0,
            width: 80.0,
          ),
        ],
      ),
    );
  }

}