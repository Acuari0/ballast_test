import 'package:ballast_test/domain/entities/models/pokemon.dart';
import 'package:ballast_test/ui/constants/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pokemon model', () {
    test('Pokemon constructor', ()  async{
      Pokemon pokemon = Pokemon.fromJson(pokemons[0]);
      expect(pokemon is Pokemon, true);
    });



    test('defaultValues()', () async {
      expect(Pokemon.defaultValue() is Pokemon, true);
    });

    test('fromJson', () async {
      Pokemon pokemon = Pokemon.fromJson(pokemons[0]);
      expect(pokemon.name, "Heracross");
      expect(pokemon.description, "This powerful POKéMON thrusts its prized horn under its enemies' bellies then lifts and throws them");
      expect(pokemon.image, "assets/heracross.png");
      expect(pokemon.color, "#4B0082");
      expect(pokemon.text_color, "white");
    });
  });
}