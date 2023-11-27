import 'dart:math';

import 'package:grs/models/dispositivo_model.dart';

List<DispositivoModel> dispositivos = List.generate(10, (index) {
  // Gere números aleatórios para os campos inteiros
  int randomId = Random().nextInt(1000);
  int randomBateria = Random().nextInt(100);
  int randomConexaoEstado = Random().nextInt(2);

  // Gere strings aleatórias para os campos de texto
  String randomDispositivo = 'Dispositivo $randomId';
  String randomSerie = 'Série $randomId';
  String randomImi = 'IMI $randomId';
  String randomMac = 'MAC $randomId';
  String randomTipoRede = 'Tipo de Rede $randomId';
  String randomNumeroTelefone = 'Número $randomId';
  String randomLatitude = 'Latitude $randomId';
  String randomLongitude = 'Longitude $randomId';

  // Gere datas aleatórias para createdAt e updatedAt
  DateTime createdAt =
      DateTime.now().subtract(Duration(days: Random().nextInt(365)));
  DateTime updatedAt = createdAt.add(Duration(days: Random().nextInt(365)));

  return DispositivoModel(
    id: randomId,
    dispositivo: randomDispositivo,
    serie: randomSerie,
    imi: randomImi,
    mac: randomMac,
    bateria: randomBateria,
    conexaoEstado: randomConexaoEstado,
    tipoRede: randomTipoRede,
    numeroTelefone: randomNumeroTelefone,
    latitude: randomLatitude,
    longitude: randomLongitude,
    siteId: 1,
    estadoDispositivoId: 1,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
});
