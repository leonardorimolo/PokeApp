
import 'package:poke_app/models/pokemon_stats.dart';

class PokemonDetails {
  final int id;
  final String name;
  final String imageUrl;
  final String gifUrl;
  final String speciesUrl;
  final int height;
  final int weight;
  final List<PokemonType> types;
  final List<PokemonAbility> abilities;
  late List<PokemonSpecies> species;



  PokemonDetails({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.gifUrl,
    required this.speciesUrl,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
    required this.species,

  });


  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    return PokemonDetails(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      imageUrl: json['sprites']['other']['official-artwork']['front_default'] ?? '',
      gifUrl: json['sprites']['versions']['generation-v']['black-white']['animated']['front_default'] ?? '',
      speciesUrl: json['species']['url'] ?? '',
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      types: (json['types'] as List?)?.map((type) => PokemonType.fromJson(type)).toList() ?? [],
      abilities: (json['abilities'] as List?)?.map((ability) => PokemonAbility.fromJson(ability)).toList() ?? [],
      species: [PokemonSpecies.fromJson(json['species'])],
    );
  }

}

class PokemonSpecies {
  final List<PokemonAbout> about;


  PokemonSpecies({required this.about});

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) {
    return PokemonSpecies(
      about: (json['flavor_text_entries'] as List?)?.map((about) => PokemonAbout.fromJson(about)).toList() ?? [],
    );
  }
}

class PokemonAbout {
  final String text;

  PokemonAbout({required this.text});

  factory PokemonAbout.fromJson(Map<String, dynamic> json) {
    return PokemonAbout(
      text: json['flavor_text'] ?? 'Unknown',
    );
  }
}
