import 'package:flutter/material.dart';

import '../model/Adage.dart';

import '../screen/ArticleScreen.dart';

import 'Card1.dart';
import 'Card1Link.dart';

class CardAdages extends StatelessWidget {
  CardAdages({
    Key? key,
    required this.adages,
  }) : super(key: key);

  final List<Adage> adages;

  @override
  Widget build(BuildContext context) {
    return Card1(
      title: 'atasözleri ve deyimler',

      body: Column(
        children: adages.map((Adage adage) {
          return Column(
            children: [
              Card1Link(
                icon: Icons.near_me_outlined,
                text: adage.madde.toString(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleScreen(article: adage.madde.toString()),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),

              Divider(height: 0, color: Colors.grey.shade200),
            ],
          );
        }).toList(),
      )
    );
  }
}
