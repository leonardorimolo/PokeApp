// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonStore on _PokemonStore, Store {
  late final _$pokemonsAtom =
      Atom(name: '_PokemonStore.pokemons', context: context);

  @override
  ObservableList<Pokemon> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<Pokemon> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$offsetAtom =
      Atom(name: '_PokemonStore.offset', context: context);

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  late final _$limitAtom = Atom(name: '_PokemonStore.limit', context: context);

  @override
  int get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(int value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_PokemonStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$isFetchingListAtom =
      Atom(name: '_PokemonStore.isFetchingList', context: context);

  @override
  bool get isFetchingList {
    _$isFetchingListAtom.reportRead();
    return super.isFetchingList;
  }

  @override
  set isFetchingList(bool value) {
    _$isFetchingListAtom.reportWrite(value, super.isFetchingList, () {
      super.isFetchingList = value;
    });
  }

  late final _$isFetchingDetailsAtom =
      Atom(name: '_PokemonStore.isFetchingDetails', context: context);

  @override
  bool get isFetchingDetails {
    _$isFetchingDetailsAtom.reportRead();
    return super.isFetchingDetails;
  }

  @override
  set isFetchingDetails(bool value) {
    _$isFetchingDetailsAtom.reportWrite(value, super.isFetchingDetails, () {
      super.isFetchingDetails = value;
    });
  }

  late final _$isFetchingMoreAtom =
      Atom(name: '_PokemonStore.isFetchingMore', context: context);

  @override
  bool get isFetchingMore {
    _$isFetchingMoreAtom.reportRead();
    return super.isFetchingMore;
  }

  @override
  set isFetchingMore(bool value) {
    _$isFetchingMoreAtom.reportWrite(value, super.isFetchingMore, () {
      super.isFetchingMore = value;
    });
  }

  late final _$pokemonDetailsAtom =
      Atom(name: '_PokemonStore.pokemonDetails', context: context);

  @override
  PokemonDetails? get pokemonDetails {
    _$pokemonDetailsAtom.reportRead();
    return super.pokemonDetails;
  }

  @override
  set pokemonDetails(PokemonDetails? value) {
    _$pokemonDetailsAtom.reportWrite(value, super.pokemonDetails, () {
      super.pokemonDetails = value;
    });
  }

  late final _$fetchPokemonListAsyncAction =
      AsyncAction('_PokemonStore.fetchPokemonList', context: context);

  @override
  Future<void> fetchPokemonList() {
    return _$fetchPokemonListAsyncAction.run(() => super.fetchPokemonList());
  }

  late final _$fetchMorePokemonsAsyncAction =
      AsyncAction('_PokemonStore.fetchMorePokemons', context: context);

  @override
  Future<void> fetchMorePokemons() {
    return _$fetchMorePokemonsAsyncAction.run(() => super.fetchMorePokemons());
  }

  late final _$fetchPokemonDetailsAsyncAction =
      AsyncAction('_PokemonStore.fetchPokemonDetails', context: context);

  @override
  Future<void> fetchPokemonDetails(String url) {
    return _$fetchPokemonDetailsAsyncAction
        .run(() => super.fetchPokemonDetails(url));
  }

  late final _$_PokemonStoreActionController =
      ActionController(name: '_PokemonStore', context: context);

  @override
  void handleNetworkError(Object exception) {
    final _$actionInfo = _$_PokemonStoreActionController.startAction(
        name: '_PokemonStore.handleNetworkError');
    try {
      return super.handleNetworkError(exception);
    } finally {
      _$_PokemonStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
offset: ${offset},
limit: ${limit},
errorMessage: ${errorMessage},
isFetchingList: ${isFetchingList},
isFetchingDetails: ${isFetchingDetails},
isFetchingMore: ${isFetchingMore},
pokemonDetails: ${pokemonDetails}
    ''';
  }
}
