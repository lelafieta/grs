import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/presentation/screens/camera_screen.dart';
import 'package:grs/presentation/screens/login_screen.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';
import 'package:simple_annimated_staggered/simple_annimated_staggered.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BODY_BACKGROUND,
      body: SafeArea(
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Container(
                          width: 280,
                          height: 280,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.VECTEEZY_SECURITY),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.MAIN_LOGO),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              FittedBox(
                                child: Text(
                                  "Gestão de rondas & supervisão",
                                  style: GoogleFonts.russoOne(
                                    fontSize: 20,
                                    color: AppColors.MAIN_COLOR,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.MAIN_COLOR,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  50), // Ajuste o valor do raio conforme necessário
                            ),
                            minimumSize: Size(200, 0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "MARCAR PRESENÇA",
                                style: GoogleFonts.rajdhani(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SvgPicture.asset(
                                AppIcons.FACEID,
                                color: Colors.white,
                                width: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(LoginPage());
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.BODY_BACKGROUND,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(
                                  width: 2, color: AppColors.MAIN_COLOR),
                            ),
                            minimumSize: Size(200, 0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ENTRAR",
                                style: GoogleFonts.rajdhani(
                                  color: AppColors.MAIN_COLOR,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SvgPicture.asset(
                                AppIcons.FACEID,
                                color: AppColors.MAIN_COLOR,
                                width: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FittedBox(
                        child: Text(
                          "Powered by Afrizona",
                          style: GoogleFonts.rajdhani(
                            fontSize: 16,
                            color: AppColors.MAIN_COLOR,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
