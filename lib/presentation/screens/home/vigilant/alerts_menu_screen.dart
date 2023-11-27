import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/presentation/screens/home/vigilant/widgets/round_widget.dart';
import 'package:grs/presentation/screens/home/vigilant/widgets/vigilante_info_widget.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';

class AlertsMenuScreen extends StatefulWidget {
  const AlertsMenuScreen({super.key});

  @override
  State<AlertsMenuScreen> createState() => _AlertsMenuScreenState();
}

class _AlertsMenuScreenState extends State<AlertsMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BODY_BACKGROUND,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.SECOND_COLOR,
        onPressed: () {},
        child: SvgPicture.asset(
          AppIcons.QR_CODE,
          color: Colors.white,
          width: 30,
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: AppColors.MAIN_COLOR,
            ),
            child: IconTheme(
              data: IconThemeData(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.only(top: 2),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AppIcons.MICROPHONE,
                            color: Colors.white.withOpacity(.8),
                          ),
                          Text(
                            "POCC",
                            style: GoogleFonts.russoOne(
                              color: Colors.white.withOpacity(.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.only(top: 2),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AppIcons.SIREN,
                            color: Colors.white.withOpacity(.8),
                          ),
                          Text(
                            "ALERTAS",
                            style: GoogleFonts.russoOne(
                              color: Colors.white.withOpacity(.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.MAIN_COLOR,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.MAIN_LOGO),
                ),
              ),
            ),
            SvgPicture.asset(
              AppIcons.PHONE_CALLING,
              color: Colors.white,
              width: 35,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.ANGOLA,
                  width: 30,
                ),
                SvgPicture.asset(
                  AppIcons.LOGOUT,
                  color: Colors.white,
                  width: 40,
                ),
              ],
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
                        color: Colors.grey,
                        offset: Offset(0, 1),
                        blurRadius: 4,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                )
                              ],
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: AssetImage(AppImages.AVATAR_USER),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      VigilantInfoWidget(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              width: 6,
                              color: AppColors.MAIN_COLOR,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 8), // Adicione o espaço à esquerda desejado
                          child: Text(
                            "ALERTAS",
                            style: GoogleFonts.russoOne(
                              fontSize: 20,
                              color: AppColors.CONTENT_COLOR,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.PHONE_ANDROID,
                              width: 60,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "ASSALTO",
                              style: GoogleFonts.russoOne(
                                color: AppColors.MAIN_COLOR,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.LIGHT,
                              width: 60,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "SEM ENERGIA",
                              style: GoogleFonts.russoOne(
                                color: AppColors.MAIN_COLOR,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.FIRE,
                              width: 60,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "INCÉNDIO",
                              style: GoogleFonts.russoOne(
                                color: AppColors.MAIN_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
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
