import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grs/data/repositories/auth_repository.dart';
import 'package:grs/presentation/screens/splash_screen.dart';
import 'logic/bloc/user_bloc.dart';

class AppController extends StatefulWidget {
  const AppController({super.key});

  @override
  State<AppController> createState() => _AppControllerState();
}

class AuthValueNotifier extends ValueNotifier<bool> {
  AuthValueNotifier(bool value) : super(value);
}

class _AppControllerState extends State<AppController>
    with WidgetsBindingObserver {
  final AuthRepository authRepository = AuthRepository();

  ValueNotifier<bool> _isAuthenticated = ValueNotifier<bool>(false);
  ValueNotifier<bool> callBiometric = ValueNotifier<bool>(false);
  ValueNotifier<int> segundosRestantes = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
    } else if (state == AppLifecycleState.resumed) {}
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _isAuthenticated.value = false;
    callBiometric.value == false;

    super.dispose();
  }

  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    EasyLoading.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authRepository: authRepository),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GRS',
        home: SplashScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
