import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

var headers = {'token': "a6feefca0b8442688c3b742ec8096674"};

class ApiFaceRecognition{
   Future<bool> findPerson(
      File image) async {
    try {
      //DialogHelper.loading();
      final imagePath = image.path;

      // Defina um timeout de 10 segundos
      const timeoutDuration = Duration(seconds: 20);

      // Use um Future.delayed para definir o timeout
      final timeout = Future.delayed(timeoutDuration, () {
        throw TimeoutException(
            'Tempo limite excedido. Por favor, tente novamente.');
      });

      var request = http.MultipartRequest(
          'POST', Uri.parse('https://api.luxand.cloud/photo/search/v2'));
      request.files.add(await http.MultipartFile.fromPath('photo', imagePath));
      request.headers.addAll(headers);

      http.StreamedResponse response =
          await Future.any([timeout, request.send()]);

      // Verifique a resposta da API com tratamento de erro e timeout
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonData = json.decode(responseBody);

        if (jsonData.isEmpty) {
          print("False");
          return false;
        } else {
          print("${jsonData}");
          Map<String, dynamic> data = jsonData[0];
          
          print("THE NAME");
          print(data['name']);
          return true;
        }
      } else {}
    } on TimeoutException {
      print('Erro, verifique a sua conexão de dados');
      return false;
    } catch (e) {
      print('Rosto não detectado.');
      return false;
    }
    return false;
  }
}