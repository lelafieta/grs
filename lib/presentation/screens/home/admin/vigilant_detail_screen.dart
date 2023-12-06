import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/presentation/screens/home/admin/widgets/round_widget.dart';
import 'package:grs/presentation/screens/home/admin/widgets/admin_info_widget.dart';
import 'package:grs/presentation/screens/home/admin/widgets/vigilant_widget.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';

class VigilantDetailScreen extends StatefulWidget {
  const VigilantDetailScreen({super.key});

  @override
  State<VigilantDetailScreen> createState() => _VigilantDetailScreenState();
}

class _VigilantDetailScreenState extends State<VigilantDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BODY_BACKGROUND,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(
        //       AppImages.BACKGROUND,
        //     ),
        //     fit: BoxFit.fill,
        //     opacity: .5,
        //   ),
        // ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      //color: Colors.red,
                    ),
                    Positioned(
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: AppColors.MAIN_COLOR,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        child: SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.arrow_back_sharp,
                                color: Colors.white,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Transferir",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 15,
                      right: 15,
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 110, top: 20),
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Lela Fieta",
                                      style: GoogleFonts.montserratAlternates(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Desde 11/10/2000",
                                      style: GoogleFonts.bigShouldersInlineText(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 13,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 13,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 13,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 13,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          size: 13,
                                          color: Colors.orange,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Expanded(
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceAround,
                            //     children: [
                            //       Container(
                            //         padding: EdgeInsets.all(10),
                            //         decoration: BoxDecoration(
                            //           color: AppColors.MAIN_COLOR,
                            //           borderRadius: BorderRadius.circular(50),
                            //           boxShadow: [
                            //             BoxShadow(
                            //               color: Colors.black12
                            //                   .withOpacity(0.4), // Sombra
                            //               blurRadius: 6,
                            //               offset: Offset(0, 0),
                            //             ),
                            //           ],
                            //         ),
                            //         child: Row(
                            //           children: [
                            //             Text(
                            //               "Avaliar",
                            //               style: GoogleFonts.rajdhani(
                            //                 color: Colors.white,
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               width: 5,
                            //             ),
                            //             Icon(
                            //               Icons.star,
                            //               color: Colors.white,
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       Container(
                            //         padding: EdgeInsets.all(10),
                            //         decoration: BoxDecoration(
                            //           color: AppColors.MAIN_COLOR,
                            //           borderRadius: BorderRadius.circular(50),
                            //           boxShadow: [
                            //             BoxShadow(
                            //               color: Colors.black12
                            //                   .withOpacity(0.4), // Sombra
                            //               blurRadius: 6,
                            //               offset: Offset(0, 0),
                            //             ),
                            //           ],
                            //         ),
                            //         child: Row(
                            //           children: [
                            //             Text(
                            //               "Contactar",
                            //               style: GoogleFonts.rajdhani(
                            //                 color: Colors.white,
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               width: 5,
                            //             ),
                            //             Icon(
                            //               Icons.phone,
                            //               color: Colors.white,
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       Container(
                            //         padding: EdgeInsets.all(10),
                            //         decoration: BoxDecoration(
                            //           color: AppColors.MAIN_COLOR,
                            //           borderRadius: BorderRadius.circular(50),
                            //           boxShadow: [
                            //             BoxShadow(
                            //               color: Colors.black12
                            //                   .withOpacity(0.4), // Sombra
                            //               blurRadius: 6,
                            //               offset: Offset(0, 0),
                            //             ),
                            //           ],
                            //         ),
                            //         child: Row(
                            //           children: [
                            //             Text(
                            //               "Mapa",
                            //               style: GoogleFonts.rajdhani(
                            //                 color: Colors.white,
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               width: 5,
                            //             ),
                            //             Icon(
                            //               Icons.map,
                            //               color: Colors.white,
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      left: 40,
                      child: Container(
                        width: 80,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
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
