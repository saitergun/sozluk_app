import 'package:flutter/material.dart';

class Card1Link extends StatelessWidget {
  const Card1Link({
    Key? key,
    this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final IconData? icon;

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        alignment: Alignment.centerLeft,

        child: Row(
          children: [
            if (icon != null)
              Container(
                alignment: Alignment.centerLeft,
                width: 36,

                child: Icon(icon, size: 21, color: Colors.black54),
              ),

            Flexible(
              fit: FlexFit.tight,
              child: Container(

                child: Text(
                  text,

                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ),
            ),
          ],
        )
      ),

      onTap: onTap,
    );
  }
}
