



import 'package:flutter/material.dart';
import 'package:poke_app/components/layout/font_style.dart';


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
              child: Row(
                children: [
                Text(capitalizeFirstLetter(name), style: BOLD_TITLE_STYLE_WHITE),
                const Spacer(),
                Text(' #$id', style: BOLD_TITLE_STYLE_WHITE),
              ],),
            ),
            Image.network(imageUrl, height: MediaQuery.sizeOf(context).height*0.35, filterQuality: FilterQuality.high,),
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
