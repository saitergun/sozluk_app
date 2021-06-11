import 'Author.dart';

class Example {
  String? ornekId;
  String? anlamId;
  String? ornekSira;
  String? ornek;
  String? kac;
  String? yazarId;
  List<Author> yazar;

  Example({
    required this.ornekId,
    required this.anlamId,
    required this.ornekSira,
    required this.ornek,
    required this.kac,
    required this.yazarId,
    required this.yazar,
  });

  factory Example.fromJson(Map<String, dynamic> json) {
    return Example(
      ornekId: json['ornek_id'],
      anlamId: json['anlam_id'],
      ornekSira: json['ornek_sira'],
      ornek: json['ornek'],
      kac: json['kac'],
      yazarId: json['yazar_id'],
      yazar: json['yazar'] != null ? List<Author>.from(json['yazar'].map((item) => Author.fromJson(item))) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'ornekId': ornekId,
      'anlamId': anlamId,
      'ornekSira': ornekSira,
      'ornek': ornek,
      'kac': kac,
      'yazarId': yazarId,
      'yazar': List<dynamic>.from(yazar.map((Author author) => author.toJson())),
    };
  }
}
