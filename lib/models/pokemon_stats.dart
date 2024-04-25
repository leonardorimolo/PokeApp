
class PokemonType {
  final String name;

  PokemonType({required this.name});

  factory PokemonType.fromJson(Map<String, dynamic> typeJson) {
    return PokemonType(
      name: typeJson['type']['name'],
    );
  }
}

class PokemonAbility {
  final String name;

  PokemonAbility({required this.name});

  factory PokemonAbility.fromJson(Map<String, dynamic> abilityJson) {
    return PokemonAbility(
      name: abilityJson['ability']['name'],
    );
  }
}
