class Author {
  String? yazarId;
  String? tamAdi;
  String? kisaAdi;
  String? ekno;

  Author({
    required this.yazarId,
    required this.tamAdi,
    required this.kisaAdi,
    required this.ekno,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      yazarId: json['yazar_id'],
      tamAdi: json['tam_adi'],
      kisaAdi: json['kisa_adi'],
      ekno: json['ekno'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'yazarId': yazarId,
      'tamAdi': tamAdi,
      'kisaAdi': kisaAdi,
      'ekno': ekno,
    };
  }
}
