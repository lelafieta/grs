import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/data/repositories/auth_repository.dart';
import 'package:grs/logic/bloc/user_bloc.dart';
import 'package:grs/logic/cubit/auth_cubit.dart';
import 'package:grs/logic/event/auth_event.dart';
import 'package:grs/presentation/screens/camera_screen.dart';
import 'package:grs/presentation/screens/home/admin/home_screen.dart';
import 'package:grs/presentation/screens/home/admin/main_admin_screen.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';
import 'package:simple_annimated_staggered/simple_annimated_staggered.dart';

import '../../logic/state/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthBloc bloc;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  ValueNotifier<bool> isObscure = ValueNotifier<bool>(true);
  final _formKey = GlobalKey<FormBuilderState>();
  AuthRepository authRepository = AuthRepository();
  @override
  void initState() {
    bloc = AuthBloc(authRepository: authRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: bloc,
      listener: (context, state) {
        if (state is AuthLoading) {
          EasyLoading.show();
        } else if (state is AuthFailure) {
          EasyLoading.dismiss();
          if (state.code == 401) {
            CoolAlert.show(
              title: "Credencias inválidas",
              context: context,
              type: CoolAlertType.warning,
              text: "E-mail ou password inválida",
            );
          } else {
            EasyLoading.dismiss();
            CoolAlert.show(
              title: "Error",
              context: context,
              type: CoolAlertType.error,
              text: "Verifique a internet ou servidor",
              titleTextStyle: GoogleFonts.rajdhani(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textTextStyle: GoogleFonts.rajdhani(
                fontWeight: FontWeight.w600,
              ),
            );
          }
        } else if (state is AuthSuccess) {
          EasyLoading.dismiss();
          Get.to(() => MainAdminScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              reverse: true,
              child: AnimationLimiter(
                child: SafeArea(
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Image.asset(
                            AppImages.MAIN_LOGO,
                            width: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "MINHA CONTA",
                                  style: GoogleFonts.rajdhani(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.MAIN_COLOR,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: FormBuilderTextField(
                              name: 'E-mail',
                              keyboardType: TextInputType.emailAddress,
                              controller: email,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.PLACEHOLDERBG_COLOR,
                                hintText: "E-mail",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    50.0,
                                  ), // Set your border radius here
                                  borderSide: BorderSide.none,
                                  // Hide the border
                                ),
                                hintStyle: TextStyle(
                                  color: AppColors.PLACEHOLDER_COLOR,
                                ),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: "Campo obrigatório"),
                                FormBuilderValidators.email(
                                    errorText: "E-mail inválido")
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ValueListenableBuilder(
                              valueListenable: isObscure,
                              builder: (context, value, _) {
                                print(value);
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: FormBuilderTextField(
                                    name: 'Senha',
                                    controller: password,
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: value,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.PLACEHOLDERBG_COLOR,
                                      hintText: "Senha",
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          50.0,
                                        ), // Set your border radius here
                                        borderSide: BorderSide.none,
                                        // Hide the border
                                      ),
                                      suffixIcon: (value == true)
                                          ? InkWell(
                                              onTap: () {
                                                isObscure.value = false;
                                              },
                                              child: Icon(
                                                FontAwesomeIcons.eyeSlash,
                                                size: 20,
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                isObscure.value = true;
                                              },
                                              child: Icon(
                                                FontAwesomeIcons.eye,
                                                size: 20,
                                              ),
                                            ),
                                      hintStyle: TextStyle(
                                        color: AppColors.PLACEHOLDER_COLOR,
                                      ),
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                          errorText: "Campo obrigatório"),
                                    ]),
                                  ),
                                );
                              }),
                          Container(
                            width: double.infinity,
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate() ==
                                          true) {
                                        bloc.add(AuthLoginRequestedEvent(
                                            email: email.text,
                                            password: password.text));
                                      }

                                      //Get.to(MainAdminScreen());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.MAIN_COLOR,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          50,
                                        ), // Ajuste o valor do raio conforme necessário
                                      ),
                                      minimumSize: Size(200, 0),
                                    ),
                                    child: Text(
                                      "ENTRAR",
                                      style: GoogleFonts.rajdhani(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(CameraScreen());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: AppColors.MAIN_COLOR
                                            .withOpacity(.2),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: SvgPicture.asset(
                                      AppIcons.FACEID,
                                      color: AppColors.MAIN_COLOR,
                                      width: 35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Afrizona 2023",
                              style: GoogleFonts.rajdhani(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
