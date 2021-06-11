class Adage {
  String? maddeId;
  String? madde;
  String? onTaki;

  Adage({
    required this.maddeId,
    required this.madde,
    required this.onTaki,
  });

  factory Adage.fromJson(Map<String, dynamic> json) {
    return Adage(
      maddeId: json['madde_id'] != null ? json['madde_id'] : null,
      madde: json['madde'] != null ? json['madde'] : null,
      onTaki: json['on_taki'] != null ? json['on_taki'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'maddeId': maddeId,
      'madde': madde,
      'onTaki': onTaki,
    };
  }
}
