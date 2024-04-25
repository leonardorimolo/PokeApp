import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/pokemon_stats.dart';
import '../layout/font_style.dart';





class TabBarDetails extends StatefulWidget {
  final int height;
  final int weight;
  final List<PokemonType> types;
  final List<PokemonAbility> abilities;
  final String gifUrl;
  final String about;

  TabBarDetails({ required this.height, required this.weight, required this.types, required this.abilities, required this.gifUrl, required this.about});

  @override
  State<TabBarDetails> createState() => _TabBarDetailsState();
}

class _TabBarDetailsState extends State<TabBarDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          TabBar.secondary(
              tabs: [
                  Tab(
                    child: Text(
                    'About',
                    style: boldLabelStyleWhite,
                   ),
                  ),
                  Tab(
                    child: Text(
                    'Stats',
                    style: boldLabelStyleWhite,
                   ),
                  ),

                ]
              ),
          Expanded(
            child: TabBarView(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height* 0.025, left: 20, right: 20),
                  child: Text(removeLines(widget.about),style: labelStyleWhite,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height* 0.025, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Height',style: labelStyleWhite,),
                              Text('${widget.height / 10}m',style: boldLabelStyleWhite),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Weight',style: labelStyleWhite,),
                              Text('${widget.weight / 10}kg',style: boldLabelStyleWhite),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text('Types',style: labelStyleWhite),
                      Text(widget.types.map((type) => type.name).join(', '),style: boldLabelStyleWhite),
                      SizedBox(height: 20),
                      Text('Abilities',style: labelStyleWhite),
                      Text(widget.abilities.map((ability) => ability.name).join(', '),style: boldLabelStyleWhite),
            
                    ],
                  ),
                ),
            
              ],
            ),
          ),
            ],
          );
        }
      }

String removeLines(String about) {
  return about.replaceAll('\n', '');
}
