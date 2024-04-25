
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_app/components/cards/custom_poke_card.dart';
import 'package:poke_app/constants/color_themes.dart';
import '../components/DialogError/dialog_error.dart';
import '../components/layout/font_style.dart';
import '../components/pokeball_spinner/pokeball_spinner.dart';
import '../stores/pokemon_store.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PokemonStore pokemonStore = PokemonStore();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    pokemonStore.fetchPokemonList();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
        pokemonStore.fetchMorePokemons();
      }
    });
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokeApp',style: boldTitleStyleBlack),
        backgroundColor: BACKGROUND,
      ),
      backgroundColor: BACKGROUND,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showOptions(context);
        },
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.more_vert),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width:  MediaQuery.of(context).size.width*0.9,
          child: Observer(
            builder: (_) {
              if (pokemonStore.errorMessage.isNotEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ShowDialogError(message: pokemonStore.errorMessage);
                      }
                  );
                });
              }
              return Column(
                children: [
                  Expanded(
                    child: pokemonStore.isFetchingList ? const Center(
                        child: PokeballSpinner(width: 100,height: 100,)) : GridView.builder(
                      controller: _scrollController,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: pokemonStore.pokemons.length,
                      itemBuilder: (context, index) {
                        var pokemon = pokemonStore.pokemons[index];
                        return CustomPokeCard(
                          action: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(
                                      url: pokemon.url,
                                      pokemonStore: pokemonStore,
                                    ),
                              ),
                            );
                          },
                          imageUrl: pokemon.imageUrl,
                          pokemonName: pokemon.name,
                          type: pokemon.types[0].name.toString(),
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: pokemonStore.isFetchingMore,
                    child: Center(child: Image.asset('assets/gifs/pika_loader.gif',),),
                  )
                ],
              );
            }
          ),
        ),
    ),
    );
  }
  void _showOptions(BuildContext context) {
    showModalBottomSheet(

      showDragHandle: true,
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.refresh, color: Colors.green),
                  title: Text('Reload Pokémon',style: labelStyleBlack,),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }),
              ListTile(
                leading: const Icon(Icons.arrow_upward, color: Colors.blue),
                title: Text('Go to Top',style: labelStyleBlack,),
                onTap: () {
                  Navigator.pop(context);
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

