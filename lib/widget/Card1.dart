import 'package:flutter/material.dart';

class Card1Title extends StatelessWidget {
  const Card1Title({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      alignment: Alignment.centerLeft,

      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),

      child: Text(
        title,
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  const Card1({
    Key? key,
    this.title = '',
    required this.body,
  }) : super(key: key);

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.25,
      margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.0),
      ),

      child: Column(
        children: [
          if (title != '')
            Card1Title(title: title),

          Container(
            alignment: Alignment.topLeft,

            child: body
          ),
        ]
      ),
    );
  }
}