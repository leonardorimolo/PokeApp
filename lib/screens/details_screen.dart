
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_app/components/poke_details/custom_pokemon_details.dart';
import '../components/DialogError/dialog_error.dart';
import '../components/poke_details/custom_tab_bar_details.dart';
import '../constants/color_themes.dart';
import '../stores/pokemon_store.dart';

class DetailsScreen extends StatefulWidget {
  final String url;
  final PokemonStore pokemonStore;

  DetailsScreen({required this.url, required this.pokemonStore});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late String type;

  @override
  void initState() {
    super.initState();
    widget.pokemonStore.fetchPokemonDetails(widget.url);

  }

  Widget build(BuildContext context) {
    return Observer(
          builder: (_) {
            if(widget.pokemonStore.errorMessage.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return ShowDialogError(message: widget.pokemonStore.errorMessage);
                    }
                );
              });
            }
            var details = widget.pokemonStore.pokemonDetails;
            return  widget.pokemonStore.isFetchingDetails ?
            Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                  ),
                )
            )
                :
            DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  backgroundColor: getTypeColors(details!.types[0].name),
                ),
                backgroundColor: getTypeColors(details.types[0].name),
                body: Column(
                  children: [
                    CustomPokeDetails(
                      id: details.id.toString(),
                      name: details.name,
                      imageUrl: details.imageUrl,
                      gifUrl: details.gifUrl,
                    ),
                    SizedBox(height: 20),
                    Expanded(child: TabBarDetails(
                      about: details.species[0].about[6].text,
                      gifUrl: details.gifUrl,
                      height: details.height,
                      weight: details.weight,
                      types: details.types,
                      abilities: details.abilities,
                    ),)

                  ],
                ),
              ),
            );
          },
    );
  }


}




Color getTypeColors(String type) {
  const typeColors = {
    'grass': GRASS_POKEMON_COLORS,
    'fire': FIRE_POKEMON_COLORS,
    'water': WATER_POKEMON_COLORS,
    'electric': ELECTRIC_POKEMON_COLORS,
    'fairy': FAIRY_POKEMON_COLORS,
    'ghost': GHOST_POKEMON_COLORS,
    'bug': BUG_POKEMON_COLORS,
    'poison': POISON_POKEMON_COLORS,
    'flying': FLYING_POKEMON_COLORS,
    'fighting': FIGHTING_POKEMON_COLORS,
    'psychic': PSYCHIC_POKEMON_COLORS,
    'rock': ROCK_POKEMON_COLORS,
    'ground': GROUND_POKEMON_COLORS,
    'ice': ICE_POKEMON_COLORS,
    'dragon': DRAGON_POKEMON_COLORS,
    'dark': DARK_POKEMON_COLORS,
    'steel': STEEL_POKEMON_COLORS,
    'normal': NORMAL_POKEMON_COLORS,
  };
  Color baseColor = typeColors[type] ?? Colors.grey;
  return baseColor;
}


