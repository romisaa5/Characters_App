import 'package:characters_app/constants/colors.dart';
import 'package:characters_app/data/models/character.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: kBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kScondryColor)
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            character.name,
            style: TextStyle(
              height: 1.3,
             fontSize: 16, 
            color: Colors.white,
            fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: kBackground,
          child:
              character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                    width: 70,
                    height: 70,
                    placeholder: 'assets/images/Loading.gif',
                    image: character.image,
                    fit: BoxFit.cover,
                  )
                  : Image.asset('assets/images/placeholder.jpg'),
        ),
      ),
    );
  }
}
