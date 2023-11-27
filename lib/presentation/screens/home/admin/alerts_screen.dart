import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/presentation/screens/home/admin/widgets/alert_widget.dart';
import 'package:grs/presentation/screens/home/admin/widgets/round_widget.dart';
import 'package:grs/presentation/screens/home/admin/widgets/admin_info_widget.dart';
import 'package:grs/presentation/screens/home/admin/widgets/site_widget.dart';
import 'package:grs/presentation/screens/home/admin/widgets/vigilant_widget.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
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
          // shape: CircularNotchedRectangle(),
          // clipBehavior: Clip.antiAlias,
          // notchMargin: 8.0,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: AppColors.MAIN_COLOR,
            ),
            child: FittedBox(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(top: 2),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.ROUND,
                              width: 25,
                              color: Colors.white.withOpacity(.8),
                            ),
                            Text(
                              "RONDAS",
                              style: GoogleFonts.russoOne(
                                color: Colors.white.withOpacity(.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(top: 2),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.VIGILANT,
                              color: Colors.white.withOpacity(.8),
                            ),
                            Text(
                              "VIGILANTES",
                              style: GoogleFonts.russoOne(
                                color: Colors.white.withOpacity(.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    // InkWell(
                    //   onTap: () {},
                    //   child: Container(
                    //     padding: EdgeInsets.only(top: 2),
                    //     child: Column(
                    //       children: [
                    //         SvgPicture.asset(
                    //           AppIcons.SITE,
                    //           color: Colors.white.withOpacity(.8),
                    //         ),
                    //         Text(
                    //           "SITES",
                    //           style: GoogleFonts.russoOne(
                    //             color: Colors.white.withOpacity(.8),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(top: 2),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.SITE,
                              color: Colors.white.withOpacity(.8),
                              width: 25,
                            ),
                            Text(
                              "SITES",
                              style: GoogleFonts.russoOne(
                                color: Colors.white.withOpacity(.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(top: 2),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.ADD,
                              color: Colors.white.withOpacity(.8),
                            ),
                            Text(
                              "CRIAR RONDAS",
                              style: GoogleFonts.russoOne(
                                color: Colors.white.withOpacity(.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // InkWell(
                    //   onTap: () {},
                    //   child: Container(
                    //     padding: EdgeInsets.only(top: 2),
                    //     child: Column(
                    //       children: [
                    //         SvgPicture.asset(
                    //           AppIcons.ADD,
                    //           color: Colors.white.withOpacity(.8),
                    //         ),
                    //         Text(
                    //           "CRIAR RONDAS",
                    //           style: GoogleFonts.russoOne(
                    //             color: Colors.white.withOpacity(.8),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
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
              "(8) ALERTAS",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 8), // Adicione o espaço à esquerda desejado
                          child: Row(
                            children: [
                              Text(
                                "PESQUISAR",
                                style: GoogleFonts.russoOne(
                                  fontSize: 20,
                                  color: AppColors.MAIN_COLOR,
                                ),
                              ),
                              SvgPicture.asset(
                                AppIcons.SEARCH,
                                color: AppColors.MAIN_COLOR,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                      itemCount: 100,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, int i) {
                        return AlertWidget();
                      }),
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
