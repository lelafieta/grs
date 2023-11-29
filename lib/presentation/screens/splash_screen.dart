import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:grs/data/repositories/auth_repository.dart';
import 'package:grs/data/services/api_service.dart';
import 'package:grs/logic/bloc/user_bloc.dart';
import 'package:grs/logic/cubit/auth_cubit.dart';
import 'package:grs/logic/event/auth_event.dart';
import 'package:grs/presentation/screens/home/auth_screen.dart';

import '../../logic/state/auth_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthRepository authRepository = AuthRepository();
  late final AuthBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = AuthBloc(authRepository: authRepository)..add(AppInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {
        if (state is AuthNotLoggedState) {
          Get.to(AuthScreen());
        } else if (state is AuthSuccess) {
          Center(
            child: Text("TRUE"),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Text("OLA")),
      ),
    );
  }
}
