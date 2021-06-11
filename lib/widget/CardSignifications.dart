import 'package:flutter/material.dart';

import '../model/Signification.dart';
import '../model/Attribute.dart';
import '../model/Example.dart';

import 'Card1.dart';

class SignificationItem extends StatelessWidget {
  const SignificationItem({
    Key? key,
    required this.anlam,
  }) : super(key: key);

  final Signification anlam;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),

      child: Column(
        children: [

          Container(
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  ...anlam.ozelliklerListe.map((Attribute ozellik) {
                    return WidgetSpan(
                      alignment: PlaceholderAlignment.middle,

                      child: Container(
                        margin: EdgeInsets.only(right: 6),
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        color: Colors.amber.shade50,

                        child: Text(
                          ozellik.tamAdi.toString(),
                          style: TextStyle(
                            color: Colors.brown,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  }).toList(),

                  TextSpan(
                    text: anlam.anlam.toString(),
                    style: DefaultTextStyle.of(context).style.copyWith(
                      fontSize: 19,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (anlam.orneklerListe.length > 0)
            Container(
              alignment: Alignment.topLeft,

              child: Padding(
                padding: EdgeInsets.only(top: 5),

                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: anlam.orneklerListe.map((Example ornek) {
                      return TextSpan(
                        children: [
                          TextSpan(
                            text: ornek.ornek,
                            style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                              height: 1,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  )
                )
              ),
            ),
        ],
      ),
    );
  }
}

class CardSignifications extends StatelessWidget {
  CardSignifications({
    Key? key,
    required this.anlamlarListe,
  }) : super(key: key);

  final List<Signification> anlamlarListe;

  @override
  Widget build(BuildContext context) {
    return Card1(
      title: anlamlarListe.length > 1 ? 'anlamlar' : 'anlam',

      body: Column(
        children: anlamlarListe.map((Signification anlam) {
          return Column(
            children: [
              SignificationItem(anlam: anlam),

              Divider(height: 0, color: Colors.grey.shade200),
            ],
          );
        }).toList(),
      ),
    );
  }
}

