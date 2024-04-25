import 'package:poke_app/models/pokemon_stats.dart';

class Pokemon {
  final String name;
  final String url;
  String? imageUrl;
  final List<PokemonType> types;
  Pokemon({required this.name, required this.url, this.imageUrl, required this.types});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
      imageUrl: json['imageUrl'] as String?,
      types: List<PokemonType>.from(json['types'].map((type) => PokemonType.fromJson(type))),
    );
  }
}
