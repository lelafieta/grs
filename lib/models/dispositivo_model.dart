class DispositivoModel {
  int? id;
  String? dispositivo;
  String? serie;
  String? imi;
  String? mac;
  int? bateria;
  int? conexaoEstado;
  String? tipoRede;
  String? numeroTelefone;
  String? latitude;
  String? longitude;
  int? siteId;
  int? estadoDispositivoId;
  DateTime? createdAt;
  DateTime? updatedAt;

  DispositivoModel({
    this.id,
    this.dispositivo,
    this.serie,
    this.imi,
    this.mac,
    this.bateria,
    this.conexaoEstado,
    this.tipoRede,
    this.numeroTelefone,
    this.latitude,
    this.longitude,
    this.siteId,
    this.estadoDispositivoId,
    this.createdAt,
    this.updatedAt,
  });

  factory DispositivoModel.fromJson(Map<String, dynamic> json) {
    return DispositivoModel(
      id: json['id'],
      dispositivo: json['dispositivo'],
      serie: json['serie'],
      imi: json['imi'],
      mac: json['mac'],
      bateria: json['bateria'],
      conexaoEstado: json['conexao_estado'],
      tipoRede: json['tipo_rede'],
      numeroTelefone: json['numero_telefone'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      siteId: json['site_id'],
      estadoDispositivoId: json['estado_dispositivo_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dispositivo': dispositivo,
      'serie': serie,
      'imi': imi,
      'mac': mac,
      'bateria': bateria,
      'conexao_estado': conexaoEstado,
      'tipo_rede': tipoRede,
      'numero_telefone': numeroTelefone,
      'latitude': latitude,
      'longitude': longitude,
      'site_id': siteId,
      'estado_dispositivo_id': estadoDispositivoId,
      'created_at': createdAt!.toIso8601String(),
      'updated_at': updatedAt!.toIso8601String(),
    };
  }
}
