import 'package:flutter/material.dart';

import '../screen/ArticleScreen.dart';

import 'Card1.dart';
import 'Card1Link.dart';

class CardConjugates extends StatelessWidget {
  CardConjugates({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<String> articles;

  @override
  Widget build(BuildContext context) {
    return Card1(
      title: 'birleşikler',

      body: Column(
        children: articles.map((String article) {
          return Column(
            children: [
              Card1Link(
                icon: Icons.near_me_outlined,
                text: article,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleScreen(article: article),
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
