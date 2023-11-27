import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/presentation/screens/home/vigilant/widgets/round_widget.dart';
import 'package:grs/presentation/screens/home/vigilant/widgets/vigilante_info_widget.dart';
import 'package:grs/presentation/screens/qr_screen.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#ffffff",
      "SAIR",
      true,
      ScanMode.QR,
    );

    print(code);

    //setState(() => qrCode = code != '-1' ? code : "Não valido");

    //print("Código QR $qrCode");

    // qrData = Utils.manipulateQRAndBARCODE(qrCode);

    // bi.text = qrData?["bi"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BODY_BACKGROUND,
      extendBody: true,
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppImages.BACKGROUND,
            ),
          ),
        ),
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
                            "RONDAS",
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
                  child: ListView.builder(
                      itemCount: 100,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, int i) {
                        return RoundWidget();
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
