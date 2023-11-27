import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/presentation/screens/home/admin/widgets/round_widget.dart';
import 'package:grs/presentation/screens/home/admin/widgets/admin_info_widget.dart';
import 'package:grs/presentation/screens/home/admin/widgets/site_widget.dart';
import 'package:grs/presentation/screens/home/admin/widgets/vigilant_widget.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';

class DeviceInfoScreen extends StatefulWidget {
  const DeviceInfoScreen({super.key});

  @override
  State<DeviceInfoScreen> createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BODY_BACKGROUND,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColors.MAIN_COLOR,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.ARROW_LEFT,
              width: 40,
              color: Colors.white,
            ),
            Text(
              "INFORMAÇÕES DO DISPOSITIVO",
              style: GoogleFonts.russoOne(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.CONTENT_CONTAINER,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.4),
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: FittedBox(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.PHONE_ANDROID,
                          width: 30,
                        ),
                        FittedBox(
                          child: FittedBox(
                            child: Text(
                              "119292838393023JD223",
                              style: GoogleFonts.righteous(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 5,
                                  color: AppColors.MAIN_COLOR,
                                ),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              child: SvgPicture.asset(
                                AppIcons.WIFI,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FittedBox(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'TIPO DE REDE: ',
                                    style: GoogleFonts.rajdhani(
                                      color: AppColors.CONTENT_COLOR,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'DADOS MÓVEIS',
                                    style: GoogleFonts.rajdhani(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.MAIN_COLOR,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 5,
                                  color: AppColors.MAIN_COLOR,
                                ),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              child: SvgPicture.asset(
                                AppIcons.INTERNET,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FittedBox(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'CONEXÃO DE REDE: ',
                                    style: GoogleFonts.rajdhani(
                                      color: AppColors.CONTENT_COLOR,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'LIGADA',
                                    style: GoogleFonts.rajdhani(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.MAIN_COLOR,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 5,
                                  color: AppColors.MAIN_COLOR,
                                ),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              child: SvgPicture.asset(
                                AppIcons.MAP_POINT,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FittedBox(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'LATITUDE: ',
                                    style: GoogleFonts.rajdhani(
                                      color: AppColors.CONTENT_COLOR,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '8,22992',
                                    style: GoogleFonts.rajdhani(
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.MAIN_COLOR,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 5,
                                  color: AppColors.MAIN_COLOR,
                                ),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              child: SvgPicture.asset(
                                AppIcons.MAP_POINT,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FittedBox(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'LONGITUDE: ',
                                    style: GoogleFonts.rajdhani(
                                      color: AppColors.CONTENT_COLOR,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '-12293837383',
                                    style: GoogleFonts.rajdhani(
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.MAIN_COLOR,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 5,
                                  color: AppColors.MAIN_COLOR,
                                ),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              child: SvgPicture.asset(
                                AppIcons.MAP,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FittedBox(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'PRECISÃO: ',
                                    style: GoogleFonts.rajdhani(
                                      color: AppColors.CONTENT_COLOR,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '2.3',
                                    style: GoogleFonts.rajdhani(
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.MAIN_COLOR,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
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

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 16, right: 16, bottom: 16), // Defina suas margens aqui
      decoration: BoxDecoration(
        color: Colors.blue, // Cor de fundo da barra de navegação
        borderRadius: BorderRadius.circular(20), // Borda arredondada
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Sombra
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              onPressed: () {
                // Adicione ação para a primeira guia
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Adicione ação para a segunda guia
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Adicione ação para a terceira guia
              },
            ),
          ],
        ),
      ),
    );
  }
}
