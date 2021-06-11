import 'Example.dart';
import 'Attribute.dart';

class Signification {
  String? anlamId;
  String? maddeId;
  String? anlamSira;
  String? fiil;
  String? tipkes;
  String? anlam;
  String? gos;
  List<Example> orneklerListe;
  List<Attribute> ozelliklerListe;

  Signification({
    required this.anlamId,
    required this.maddeId,
    required this.anlamSira,
    required this.fiil,
    required this.tipkes,
    required this.anlam,
    required this.gos,
    required this.orneklerListe,
    required this.ozelliklerListe,
  });

  factory Signification.fromJson(Map<String, dynamic> json) {
    return Signification(
      anlamId: json['anlam_id'] != null ? json['anlam_id'] : null,
      maddeId: json['madde_id'] != null ? json['madde_id'] : null,
      anlamSira: json['anlam_sira'] != null ? json['anlam_sira'] : null,
      fiil: json['fiil'] != null ? json['fiil'] : null,
      tipkes: json['tipkes'] != null ? json['tipkes'] : null,
      anlam: json['anlam'] != null ? json['anlam'] : null,
      gos: json['gos'] != null ? json['gos'] : null,
      orneklerListe: json['orneklerListe'] != null ? List<Example>.from(json['orneklerListe'].map((item) => Example.fromJson(item))) : [],
      ozelliklerListe: json['ozelliklerListe'] != null ? List<Attribute>.from(json['ozelliklerListe'].map((item) => Attribute.fromJson(item))) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'anlamId': anlamId,
      'maddeId': maddeId,
      'anlamSira': anlamSira,
      'fiil': fiil,
      'tipkes': tipkes,
      'anlam': anlam,
      'gos': gos,
      'orneklerListe': orneklerListe,
      'ozelliklerListe': ozelliklerListe,
    };
  }
}
