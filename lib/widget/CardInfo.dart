import 'package:flutter/material.dart';

import 'Card1.dart';

class CardInfoItem extends StatelessWidget {
  const CardInfoItem({
    Key? key,
    required this.text,
    required this.title,
  }) : super(key: key);

  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(text, textScaleFactor: 1.2),

          Text(title, textScaleFactor: 1.2),
        ],
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  CardInfo({
    Key? key,
    this.lisan,
    this.telaffuz,
  }) : super(key: key);

  final String? lisan;
  final String? telaffuz;

  @override
  Widget build(BuildContext context) {
    return Card1(
      body: Column(
        children: [
          if (lisan != null && lisan != '')
            CardInfoItem(text: lisan.toString(), title: 'köken'),

          if (lisan != null && lisan != '' && telaffuz != null)
            Divider(height: 0, color: Colors.grey.shade200),

          if (telaffuz != null)
            CardInfoItem(text: telaffuz.toString(), title: 'söyleyiş'),
        ],
      ),
    );
  }
}
