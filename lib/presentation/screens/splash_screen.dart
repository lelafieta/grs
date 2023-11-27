import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:grs/data/services/api_service.dart';
import 'package:grs/logic/cubit/auth_cubit.dart';
import 'package:grs/logic/state/auth/auth_state.dart';
import 'package:grs/presentation/screens/home/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService authService = AuthService();
  late final AuthCubit authCubit;
  @override
  void initState() {
    super.initState();
    authCubit = BlocProvider.of<AuthCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: authCubit,
      listener: (context, state) {
        print(state);
        if (state is AuthNotLoggedState) {
          Get.to(AuthScreen());
        } else if (state is AuthSuccess) {
          print("True");
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
