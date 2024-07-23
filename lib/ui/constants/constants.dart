// LOGIN
import 'package:flutter/material.dart';

const String EMAIL_REG_EXP =
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

//POKEMONS JSON
List<Map<String,dynamic>> pokemons=[
  {
    "name": "Heracross",
    "image":"assets/heracross.png",
    "description":"This powerful POKéMON thrusts its prized horn under its enemies' bellies then lifts and throws them",
    "color": "#4B0082",
    "text_color":"white"
  },
  {
    "name": "Vulpix",
    "image":"assets/vulpix.png",
    "description":"As its body grows larger, its six warm tails become more beautiful, with a more luxurious coat of fur.",
    "color": "#B02B25",
    "text_color":"white"
  }
];