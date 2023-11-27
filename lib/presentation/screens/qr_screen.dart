import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/data/services/api_face_recognition.dart';
import 'package:grs/presentation/screens/home/admin/main_admin_screen.dart';
import 'package:grs/presentation/screens/home/vigilant/main_vigilant_screen.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';

late List<CameraDescription> _cameras;

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});
  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  late CameraController controller;
  ValueNotifier<String> placeholder =
      ValueNotifier<String>("Aguardando o rosto...");
  ValueNotifier<bool> capture = ValueNotifier<bool>(false);
  ValueNotifier<int> faceIdentify = ValueNotifier<int>(0);
  ValueNotifier<bool> acceptAutoCapture = ValueNotifier<bool>(true);
  ApiFaceRecognition apiFaceRecognition = ApiFaceRecognition();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Stack(
          children: [
            ValueListenableBuilder(
                valueListenable: acceptAutoCapture,
                builder: (context, _, __) {
                  return SmartFaceCamera(
                    autoCapture: _,
                    defaultCameraLens: CameraLens.front,
                    showControls: false,
                    onCapture: (File? image) async {
                      placeholder.value = "Processando...";
                      capture.value = true;
                      acceptAutoCapture.value = false;
                      if (await apiFaceRecognition.findPerson(image!) == true) {
                        placeholder.value = "";
                        faceIdentify.value = 1;
                        acceptAutoCapture.value = false;
                        Timer.periodic(Duration(seconds: 2), (timer) {
                          Get.off(MainAdminScreen());
                        });
                        return;
                      } else {
                        faceIdentify.value = 2;
                        acceptAutoCapture.value = false;
                        placeholder.value = "Aguardando o rosto...";
                        capture.value = false;
                      }
                    },
                  );
                }),
            Positioned(
              top: 65,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        "PICAGEM",
                        style: GoogleFonts.rajdhani(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: AppColors.WHITE_COLOR,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(.8),
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "APONTA A CÊMERA NA TAG",
                        style: GoogleFonts.rajdhani(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.WHITE_COLOR,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(.8),
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: 20,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    AppIcons.ARROW_LEFT,
                    width: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: Center(
                child: ValueListenableBuilder(
                    valueListenable: placeholder,
                    builder: (context, value, _) {
                      return ValueListenableBuilder(
                          valueListenable: capture,
                          builder: (context, value2, __) {
                            if (value2 == true) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SpinKitFadingCircle(
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "${placeholder.value}",
                                    style: GoogleFonts.rajdhani(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.WHITE_COLOR,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(.8),
                                          offset: Offset(1, 1),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }
                            return Text(
                              "${placeholder.value}",
                              style: GoogleFonts.rajdhani(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.WHITE_COLOR,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(.8),
                                    offset: Offset(1, 1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            );
                          });
                    }),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: faceIdentify,
                builder: (context, _, value) {
                  return (_ == 1)
                      ? Positioned(
                          top: 0,
                          left: 0,
                          bottom: 0,
                          right: 0,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.green.withOpacity(.1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AppImages.CHECKEDTICK),
                                  Text(
                                    "Rosto identificado",
                                    style: GoogleFonts.rajdhani(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : (_ == 2)
                          ? InkWell(
                              onTap: () {
                                faceIdentify.value = 0;
                                acceptAutoCapture.value = true;
                              },
                              child: Positioned(
                                top: 0,
                                left: 0,
                                bottom: 0,
                                right: 0,
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 5.0, sigmaY: 5.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: Colors.red.withOpacity(.1),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(AppImages.CLOSECIRCLE),
                                        Text(
                                          "Rosto não identificado",
                                          style: GoogleFonts.rajdhani(
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Clique aqui para voltar a verificar",
                                          style: GoogleFonts.rajdhani(
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox.shrink();
                }),
          ],
        ),
      ),
    );
  }
}
