// ignore_for_file: use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/components/pokeball_spinner/pokeball_spinner.dart';


import '../../constants/color_themes.dart';

import '../layout/font_style.dart';

class CustomPokeCard extends StatefulWidget {
  final Function action;
  final String? imageUrl;
  final String pokemonName;
  final String type;


  const CustomPokeCard({
    required this.action,
    this.imageUrl,
    required this.pokemonName,
    required this.type,
  });

  @override
  State<CustomPokeCard> createState() => _CustomPokeCardState();
}

class _CustomPokeCardState extends State<CustomPokeCard> {

  @override
  Widget build(BuildContext context) {
    Map<String, Color> colors = getTypeColors(widget.type);
    return InkWell(
      onTap: () {
        widget.action();
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                colors: [colors['baseColor']!, colors['fadedColor']!],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                ),
                ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only( top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      capitalizeFirstLetter(widget.pokemonName),
                      style: BOLD_LABEL_STYLE_WHITE,
                    ),

                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 20,
                  right: 0,
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl ?? '',
                    placeholder: (context, url) => const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: PokeballSpinner(width: 50,height: 50,),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.contain,
                    alignment: Alignment.centerRight,
                    filterQuality: FilterQuality.high,

                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
String capitalizeFirstLetter(String? text) {
  if (text == null || text.isEmpty) {
    return '';
  }
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}

Map<String, Color> getTypeColors(String type) {
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
  Color fadedColor = baseColor.withOpacity(0.5);
  return {'baseColor': baseColor, 'fadedColor': fadedColor};
}