import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grs/data/services/api_error.dart';
import 'package:grs/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final _endPoint = "https://grs.afrizona.com/api/auth/login";

  final secureStorage = FlutterSecureStorage();

  Future<bool> authenticateWithFaceID(String uuid, String device_id) async {
    var _url = Uri.parse('${_endPoint}');
    String? token = await secureStorage.read(key: "access_token");

    try {
      final response = await http.post(
        _url,
        body: {
          "uuid": uuid,
        },
        headers: {
          "Accept": "application/json",
        },
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        print("TRUE");
      }

      if (response.statusCode == 401) {
        throw ApiError(
            statusCode: 401,
            message: "Utilizador sem permissão, porfavor faça login");
      }
      return true;
    } on TimeoutException {
      throw "Utilizador sem permissão, porfavor faça login";
    } on SocketException {
      throw "Verifica sua internet ou servidor";
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<bool> authenticate(String email, String password) async {
    var _url = Uri.parse('${_endPoint}');
    String? token = await secureStorage.read(key: "access_token");

    try {
      final response = await http.post(_url, body: {
        "email": email,
        "password": password
      }, headers: {
        "Accept": "application/json",
      }).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        secureStorage.write(
          key: "access_token",
          value: json.decode(response.body)["access_token"],
        );
        return true;
      }
      return false;
    } on TimeoutException {
      throw "Utilizador sem permissão, porfavor faça login";
    } on SocketException {
      throw "Verifica sua internet ou servidor";
    } catch (e) {
      throw e;
    }
  }
}
