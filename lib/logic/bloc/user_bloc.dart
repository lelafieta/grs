import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grs/data/repositories/auth_repository.dart';
import 'package:grs/logic/event/auth_event.dart';

import '../state/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final secureStorage = FlutterSecureStorage();

  AuthBloc({required this.authRepository}) : super(AppStartState()) {
    on<AppInitialEvent>((event, emit) async {
      if (await secureStorage.read(key: "authToken") == "" ||
          await secureStorage.read(key: "authToken") == null) {
        emit(AuthNotLoggedState());
      } else {
        emit(AuthSuccess());
      }
    });

    on<AuthLoginRequestedEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        bool auth =
            await authRepository.authenticate(event.email, event.password);
        if (auth == true) {
          emit(AuthSuccess());
        } else {
          emit(AuthFailure("E-mail ou senha errada", 401));
        }
      } catch (e) {
        emit(AuthFailure("Ouve um erro", 500));
      }
    });
  }

  Future<bool> authenticateWithFaceID(String uuid) async {
    String device_id = await _getDeviceId();
    print(device_id);
    bool isAuth = await authRepository.authenticateWithFaceID(uuid, device_id);
    if (isAuth) {
      print("Passou!!");
    } else {
      print("Não passou");
    }
    return true;
  }

  Future authenticate(String email, String password) async {
    try {
      emit(AuthLoading());
      bool auth = await authRepository.authenticate(email, password);
      if (auth == true) {
        emit(AuthSuccess());
        return true;
      } else {
        emit(AuthFailure("E-mail ou senha errada", 401));
      }
      return false;
    } catch (e) {
      emit(AuthFailure("Ouve um erro", 500));
    }
  }

  Future verifyAuth() async {}

  Future<String> _getDeviceId() async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.androidId;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor;
      } else {
        return "Error";
      }
    } catch (e) {
      return "Error";
    }
  }
}
