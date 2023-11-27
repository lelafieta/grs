import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/presentation/screens/home/admin/widgets/round_widget.dart';
import 'package:grs/presentation/screens/home/admin/widgets/admin_info_widget.dart';
import 'package:grs/presentation/screens/home/admin/widgets/vigilant_widget.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';

class VigilantScreen extends StatefulWidget {
  const VigilantScreen({super.key});

  @override
  State<VigilantScreen> createState() => _VigilantScreenState();
}

class _VigilantScreenState extends State<VigilantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BODY_BACKGROUND,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              "(8) VIGILANTES",
              style: GoogleFonts.russoOne(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImages.BACKGROUND,
              ),
              fit: BoxFit.fill,
              opacity: .5,
            ),
          ),
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
                                left:
                                    8), // Adicione o espaço à esquerda desejado
                            child: Text(
                              "RONDAS",
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
                                left:
                                    8), // Adicione o espaço à esquerda desejado
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
                          return VigilantWidget();
                        }),
                  )
                ],
              ),
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
