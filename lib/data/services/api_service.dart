import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grs/data/services/api_error.dart';
import 'package:grs/utils/app_constants.dart';
import 'package:grs/utils/app_utils.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final _endPoint = 'auth/login'; // Substitua pela URL real
  final _endPointCode = 'auth/verification/code';
  final _endPointLogout = 'auth/logout';
  final _endPointResetCode = 'auth/resetCode';
  final _endPointUser = 'auth/user';

  final FlutterSecureStorage secureStorage;

  AuthService(this.secureStorage);

  Future<Object?> authenticate(
      String username, String password, String phoneCode) async {
    var _url = Uri.parse('${AppConstants.BASE_URL}${_endPoint}');

    try {
      final response = await http.post(_url, body: {
        'email': username,
        'password': password,
        'phoneCode': phoneCode,
      }, headers: {
        "Accept": "application/json"
      });

      if (response.statusCode == 200) {
        final userData = json.decode(response.body);

        await secureStorage.write(
            key: "identfyed", value: userData['identfyed'].toString());
        return userData['identfyed'];
      }

      if (response.statusCode == 200) {
        final userData = json.decode(response.body);

        await secureStorage.write(
            key: "identfyed", value: userData['identfyed'].toString());
        return userData['identfyed'];
      } else if (response.statusCode == 463) {
        final data = json.decode(response.body);

        return ApiError(statusCode: 463, message: data['alert'].toString());
      }
    } catch (e) {
      print(e);
      throw e;
    }

    return null;
  }

  Future saveUser() async {
    var _url = Uri.parse('${AppConstants.BASE_URL}${_endPointUser}');
    String? token = await secureStorage.read(key: "access_token");
    String? identfyed = await secureStorage.read(key: "identfyed");

    try {
      final response = await http.post(_url, body: {
        'identfyed': identfyed,
      }, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      });

      //print("USERS ${response.body}");

      if (response.statusCode == 200) {
        //(response.body.toString().substring(1, response.body.length - 1));
        await secureStorage.write(
            key: "user",
            value: response.body
                .toString()
                .substring(1, response.body.length - 1));
      }
    } catch (e) {
      throw e;
    }

    return null;
  }

  Future<Object?> validate_otp(String token, String code) async {
    var _url = Uri.parse('${AppConstants.BASE_URL}${_endPointCode}');

    try {
      final response = await http.post(_url, body: {
        'identfyed': token,
        'code': code,
      }, headers: {
        "Accept": "application/json"
      }).timeout(Duration(seconds: 20));

      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        secureStorage.write(
            key: 'access_token', value: userData['access_token']);
        secureStorage.write(key: 'token_type', value: userData['token_type']);
        secureStorage.write(
            key: 'expires_in', value: userData['expires_in'].toString());

        final expiration =
            DateTime.now().add(Duration(hours: 1)).toIso8601String();
        await secureStorage.write(key: 'expiration', value: expiration);

        await saveUser();
        return userData['access_token'];
      } else if (response.statusCode == 463) {
        final data = json.decode(response.body);
        return ApiError(statusCode: 463, message: data['alert'].toString());
      } else if (response.statusCode == 462) {
        final data = json.decode(response.body);
        return ApiError(statusCode: 462, message: data['error'].toString());
      } else if (response.statusCode == 461) {
        final data = json.decode(response.body);
        return ApiError(statusCode: 462, message: data['error'].toString());
      }
    } on TimeoutException {
      throw "Tempo de requisição terminado por favor tenta novamente";
    } catch (e) {
      throw e;
    }

    return null;
  }

  Future<bool> reset_code(String identfyed, String phoneCode) async {
    var _url = Uri.parse('${AppConstants.BASE_URL}${_endPointResetCode}');

    try {
      await http.post(_url, body: {
        'identfyed': identfyed,
        'phoneCode': phoneCode,
      }, headers: {
        "Accept": "application/json"
      }).timeout(Duration(seconds: 20));

      return true;
    } catch (e) {
      throw e;
    }
  }

  Future<bool> logout() async {
    var _url = Uri.parse('${AppConstants.BASE_URL}${_endPointLogout}');
    String? identfyed = await secureStorage.read(key: "identfyed");
    try {
      final response = await http.post(
        _url,
        body: {
          'identfyed': identfyed,
        },
        headers: {
          "Accept": "application/json",
          "Authorization":
              "Bearer ${secureStorage.read(key: "access_token").toString()}",
        },
      ).timeout(Duration(seconds: 20));

      if (response.statusCode == 200) {
        await secureStorage.delete(key: "identfyed");
        await secureStorage.delete(key: "access_token");
        return true;
      }
    } catch (e) {
      throw e;
    }

    return false;
  }
}
