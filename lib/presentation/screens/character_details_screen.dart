import 'package:characters_app/constants/colors.dart';
import 'package:characters_app/data/models/character.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key, required this.character});
  final Character character;
  Widget buildSliverAppbar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: kScondryColor,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text(
          character.name,
          style: TextStyle(
            fontSize: 20,
            color: kBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(character.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: kBackground,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: kBackground,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDevider(double endindent) {
    return Divider(
      height: 30,
      endIndent: endindent,
      color: kPrimaryColor,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScondryColor,
      body: CustomScrollView(
        slivers: [
          buildSliverAppbar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    characterInfo('Name : ',character.name ),
                     buildDevider(300),
                     characterInfo('Status : ', character.status),
                     buildDevider(280),
                     characterInfo('Gender : ', character.gender),
                     buildDevider(240),
                     characterInfo('Episode : \n\n', character.episode.join('\n'))
                     ,buildDevider(120),
                     ],
                ),
              ),
              SizedBox(
                height: 500,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
