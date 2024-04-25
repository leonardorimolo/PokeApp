
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_app/models/pokemon_details.dart';
import '../models/pokemon.dart';

class PokemonApi {
  final String baseUrl = 'https://pokeapi.co/api/v2';


  Future<List<Pokemon>> fetchPokemons({required int offset , required int limit}) async {
    String url = '$baseUrl/pokemon?offset=$offset&limit=$limit';
    return await fetchPokemonsWithImages(url);
  }



  Future<List<Pokemon>> fetchPokemonsWithImages(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) {
        throw Exception('Failed to fetch pokemons list from $url');
      }
      var data = jsonDecode(response.body);

      var pokemonFutures = (data['results'] as List).map<Future<Pokemon>>((pokemon) async {
        var detailResponse = await http.get(Uri.parse(pokemon['url']));
        if (detailResponse.statusCode != 200) {
          throw Exception('Failed to fetch pokemon details from ${pokemon['url']}');
        }
        var detailData = jsonDecode(detailResponse.body);
        return Pokemon.fromJson({
          'name': pokemon['name'],
          'url': pokemon['url'],
          'imageUrl': detailData['sprites']['other']['official-artwork']['front_default'],
          'types': detailData['types']
        });
      }).toList();
      return await Future.wait(pokemonFutures);
    } catch (e) {
      throw Exception(e);
    }
  }


  Future<PokemonDetails> fetchPokemonDetails(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var pokemonDetails = PokemonDetails.fromJson(json);
        var speciesResponse = await http.get(Uri.parse(pokemonDetails.speciesUrl));
        if (speciesResponse.statusCode == 200) {
          var speciesJson = jsonDecode(speciesResponse.body);
          var species = PokemonSpecies.fromJson(speciesJson);
          pokemonDetails.species = [species];
          return pokemonDetails;
        } else {
          throw Exception('Failed to load Pokémon species');
        }
      } else {
        throw Exception('Failed to load Pokémon details');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
