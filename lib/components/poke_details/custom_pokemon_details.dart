



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/components/layout/font_style.dart';

import '../pokeball_spinner/pokeball_spinner.dart';


class CustomPokeDetails extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  final String gifUrl;

  CustomPokeDetails({
    required this.name,
    required this.imageUrl,
    required this.gifUrl, required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        capitalizeFirstLetter(name),
                        style: boldTitleStyleWhite,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        ' #$id',
                        style: boldTitleStyleWhite,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                )
                ,
              ),
            ),
            CachedNetworkImage(
              errorWidget: (context, url, error) => Image.asset('assets/images/pikachu_error_image.png',height: MediaQuery.sizeOf(context).height*0.35,),
              imageUrl: imageUrl, height: MediaQuery.sizeOf(context).height*0.35, filterQuality: FilterQuality.high,placeholder: (context, url) => const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: PokeballSpinner(width: 50,height: 50,),
              ),
            ),),
          ],
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
