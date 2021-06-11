import 'package:flutter/material.dart';

String Function(String string) latinizer = (String string) {
  return string.replaceAll(RegExp(r'â'), 'a')
    .replaceAll(RegExp(r'Â'), 'a')
    .replaceAll(RegExp(r'î'), 'i')
    .replaceAll(RegExp(r'Î'), 'i')
    .replaceAll(RegExp(r'İ'), 'i')
    .replaceAll(RegExp(r'ı'), 'i')
    .replaceAll(RegExp(r'û'), 'u')
    .replaceAll(RegExp(r'Û'), 'u')
    .replaceAll(RegExp(r'ü'), 'u')
    .replaceAll(RegExp(r'Ü'), 'u')
    .replaceAll(RegExp(r'ş'), 's')
    .replaceAll(RegExp(r'Ş'), 's')
    .replaceAll(RegExp(r'ö'), 'o')
    .replaceAll(RegExp(r'Ö'), 'o')
    .replaceAll(RegExp(r'ç'), 'c')
    .replaceAll(RegExp(r'Ç'), 'c');
};

RegExp regexLocalizer (String value) {
  return new RegExp(value
    .replaceAll(RegExp(r'[aAÂâ]'), '[aAÂâ]')
    .replaceAll(RegExp(r'[iİIıîÎ]'), '[iİIıîÎ]')
    .replaceAll(RegExp(r'[üÜuUÛû]'), '[üÜuUÛû]')
    .replaceAll(RegExp(r'[cCÇç]'), '[cCÇç]')
    .replaceAll(RegExp(r'[gGĞğ]'), '[gGĞğ]')
    .replaceAll(RegExp(r'[sSŞş]'), '[sSŞş]')
    .replaceAll(RegExp(r'[oOÖö]'), '[oOÖö]'),
    caseSensitive: false,
  );
}

List<TextSpan> createHighlightedTextSpanChildren(String text, String query) {
  if (query == '' || query.isEmpty || !regexLocalizer(query).hasMatch(text)) {
    return [
      TextSpan(text: text)
    ];
  }

  final matches = regexLocalizer(query).allMatches(text);

  int lastMatchEnd = 0;

  final List<TextSpan> children = [];

  for (var i = 0; i < matches.length; i++) {
    final match = matches.elementAt(i);

    if (match.start != lastMatchEnd) {
      children.add(TextSpan(
        text: text.substring(lastMatchEnd, match.start),
        style: TextStyle(fontWeight: FontWeight.bold)
      ));
    }

    children.add(TextSpan(
      text: text.substring(match.start, match.end),
    ));

    if (i == matches.length - 1 && match.end != text.length) {
      children.add(TextSpan(
        text: text.substring(match.end, text.length),
        style: TextStyle(fontWeight: FontWeight.bold)
      ));
    }

    lastMatchEnd = match.end;
  }

  return children;
}
