class Attribute {
  String? ozellikId;
  String? tur;
  String? tamAdi;
  String? kisaAdi;
  String? ekno;

  Attribute({
    required this.ozellikId,
    required this.tur,
    required this.tamAdi,
    required this.kisaAdi,
    required this.ekno,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      ozellikId: json['ozellik_id'],
      tur: json['tur'],
      tamAdi: json['tam_adi'],
      kisaAdi: json['kisa_adi'],
      ekno: json['ekno'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'ozellikId': ozellikId,
      'tur': tur,
      'tamAdi': tamAdi,
      'kisaAdi': kisaAdi,
      'ekno': ekno,
    };
  }
}
