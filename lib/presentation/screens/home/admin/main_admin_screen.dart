import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/presentation/screens/home/admin/create_round_screen.dart';
import 'package:grs/presentation/screens/home/admin/home_screen.dart';
import 'package:grs/presentation/screens/home/admin/sites_screen.dart';
import 'package:grs/presentation/screens/home/admin/vigilant_screen.dart';
import 'package:grs/presentation/screens/qr_screen.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';

class MainAdminScreen extends StatefulWidget {
  const MainAdminScreen({super.key});

  @override
  State<MainAdminScreen> createState() => _MainAdminScreenState();
}

class _MainAdminScreenState extends State<MainAdminScreen> {
  int selectedWidget = 0;
  List<Widget> widgets = [
    HomeScreen(),
    VigilantScreen(),
    SiteScreen(),
    CreateRoundScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  /// and then assign it to the our widget library
  Widget float1() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        heroTag: "btn1",
        tooltip: 'First button',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget float2() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        heroTag: "btn2",
        tooltip: 'Second button',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          notchMargin: 8.0,
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
                      onTap: () {
                        setState(() {
                          selectedWidget = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 2),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.HOME,
                              width: 25,
                              color: Colors.white.withOpacity(.8),
                            ),
                            Text(
                              "Página inicial",
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
                      onTap: () {
                        print("vi");
                        setState(() {
                          selectedWidget = 1;
                        });
                      },
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
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedWidget = 2;
                        });
                      },
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
                      onTap: () {
                        setState(() {
                          selectedWidget = 3;
                        });
                      },
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
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.SECOND_COLOR,
      //   onPressed: () async {
      //     Get.to(QrScreen());
      //   },
      //   child: SvgPicture.asset(
      //     AppIcons.QR_CODE,
      //     color: Colors.white,
      //     width: 30,
      //   ),
      // ),
      floatingActionButton: Container(
        child: SpeedDialFabWidget(
          secondaryIconsList: [
            Icons.content_copy,
            Icons.content_paste,
            Icons.content_cut,
          ],
          secondaryIconsText: [
            "copy",
            "paste",
            "cut",
          ],
          secondaryIconsOnPress: [
            () => {},
            () => {},
            () => {},
          ],
          secondaryBackgroundColor: Colors.grey[900]!,
          secondaryForegroundColor: Colors.grey[100]!,
          primaryBackgroundColor: Colors.grey[900]!,
          primaryForegroundColor: Colors.grey[100]!,
        ),
      ),
      body: widgets[selectedWidget],
    );
  }
}
