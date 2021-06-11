import 'Signification.dart';
import 'Adage.dart';

class Article {
  final String? maddeId;
  final String? kac;
  final String? kelimeNo;
  final String? cesit;
  final String? anlamGor;
  final String? onTaki;
  final String? madde;
  final String? cesitSay;
  final String? taki;
  final String? cogulMu;
  final String? ozelMi;
  final String? lisanKodu;
  final String? lisan;
  final String? telaffuz;
  final String? birlesikler;
  final String? font;
  final String? maddeDuz;
  final String? gosterimTarihi;
  final List<Signification> anlamlarListe;
  final List<Adage> atasozu;

  Article({
    required this.maddeId,
    required this.kac,
    required this.kelimeNo,
    required this.cesit,
    required this.anlamGor,
    required this.onTaki,
    required this.madde,
    required this.cesitSay,
    required this.taki,
    required this.cogulMu,
    required this.ozelMi,
    required this.lisanKodu,
    required this.lisan,
    required this.telaffuz,
    required this.birlesikler,
    required this.font,
    required this.maddeDuz,
    required this.gosterimTarihi,
    required this.anlamlarListe,
    required this.atasozu,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      maddeId: json['madde_id'] != null ? json['madde_id'] : null,
      kac: json['kac'] != null ? json['kac'] : null,
      kelimeNo: json['kelime_no'] != null ? json['kelime_no'] : null,
      cesit: json['cesit'] != null ? json['cesit'] : null,
      anlamGor: json['anlam_gor'] != null ? json['anlam_gor'] : null,
      onTaki: json['on_taki'] != null ? json['on_taki'] : null,
      madde: json['madde'] != null ? json['madde'] : null,
      cesitSay: json['cesit_say'] != null ? json['cesit_say'] : null,
      taki: json['taki'] != null ? json['taki'] : null,
      cogulMu: json['cogul_mu'] != null ? json['cogul_mu'] : null,
      ozelMi: json['ozel_mi'] != null ? json['ozel_mi'] : null,
      lisanKodu: json['lisan_kodu'] != null ? json['lisan_kodu'] : null,
      lisan: json['lisan'] != null && json['lisan'] != '' ? json['lisan'] : null,
      telaffuz: json['telaffuz'] != null ? json['telaffuz'] : null,
      birlesikler: json['birlesikler'] != null ? json['birlesikler'] : null,
      font: json['font'] != null ? json['font'] : null,
      maddeDuz: json['madde_duz'] != null ? json['madde_duz'] : null,
      gosterimTarihi: json['gosterim_tarihi'] != null ? json['gosterim_tarihi'] : null,
      anlamlarListe: json['anlamlarListe'] != null ? List<Signification>.from(json['anlamlarListe'].map((item) => Signification.fromJson(item))) : [],
      atasozu: json['atasozu'] != null ? List<Adage>.from(json['atasozu'].map((item) => Adage.fromJson(item))) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'maddeId': maddeId,
      'kac': kac,
      'kelimeNo': kelimeNo,
      'cesit': cesit,
      'anlamGor': anlamGor,
      'onTaki': onTaki,
      'madde': madde,
      'cesitSay': cesitSay,
      'taki': taki,
      'cogulMu': cogulMu,
      'ozelMi': ozelMi,
      'lisanKodu': lisanKodu,
      'lisan': lisan,
      'telaffuz': telaffuz,
      'birlesikler': birlesikler,
      'font': font,
      'maddeDuz': maddeDuz,
      'gosterimTarihi': gosterimTarihi,
      'anlamlarListe': List<dynamic>.from(anlamlarListe.map((Signification signification) => signification.toJson())),
      'atasozu': List<dynamic>.from(atasozu.map((Adage adage) => adage.toJson())),
    };
  }
}
