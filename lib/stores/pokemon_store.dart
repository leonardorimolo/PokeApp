import 'package:http/http.dart';
import 'package:mobx/mobx.dart';
import '../models/pokemon.dart';
import '../models/pokemon_details.dart';
import '../services/pokemon_api.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStore with _$PokemonStore;

abstract class _PokemonStore with Store {
  final PokemonApi _pokemonApi = PokemonApi();

  @observable
  ObservableList<Pokemon> pokemons = ObservableList<Pokemon>();

  @observable
  int offset = 0;

  @observable
  int limit = 20;

  @observable
  String errorMessage = '';

  @observable
  bool isFetchingList = false;

  @observable
  bool isFetchingDetails = false;

  @observable
  bool isFetchingMore = false;





  @action
  Future<void> fetchPokemonList() async {
    try {
      isFetchingList = true;
      var fetchedPokemons = await _pokemonApi.fetchPokemons(offset: offset, limit: limit);
      pokemons = ObservableList<Pokemon>.of(fetchedPokemons);
      offset += limit;
      isFetchingList = false;
    } catch (e) {
      errorMessage = "Oops! We couldn't complete your request. Please try again later.";
      isFetchingList = false;

    }
  }

  @action
  void handleNetworkError(Object exception) {
    if (exception is ClientException) {
      errorMessage = "Please, check your internet connection and try again.";
    } else {
      errorMessage = "Oops! We couldn't complete your request. Please try again later.";
    }
  }


  @action
  Future<void> fetchMorePokemons() async {
    if (isFetchingMore) return;

    isFetchingMore = true;
    try {
      var fetchedPokemons = await _pokemonApi.fetchPokemons(offset: pokemons.length, limit: 20);
      pokemons.addAll(ObservableList<Pokemon>.of(fetchedPokemons));
      isFetchingMore = false;
    } catch (e) {
      isFetchingMore = false;
      handleNetworkError(e);
    }
  }




  @observable
  PokemonDetails? pokemonDetails;

  @action
  Future<void> fetchPokemonDetails(String url) async {
    isFetchingDetails = true;
    try {
      pokemonDetails = await _pokemonApi.fetchPokemonDetails(url);
      isFetchingDetails = false;
    } catch (e) {
      isFetchingDetails = false;
      errorMessage = "Oops! We couldn't complete your request. Please try again later.";
    }
  }
}
