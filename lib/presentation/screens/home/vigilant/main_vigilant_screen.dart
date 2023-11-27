import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';

class MainVigilantScreen extends StatefulWidget {
  const MainVigilantScreen({super.key});

  @override
  State<MainVigilantScreen> createState() => _MainVigilantScreenState();
}

class _MainVigilantScreenState extends State<MainVigilantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( bottomNavigationBar: Container(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.SECOND_COLOR,
        onPressed: () async {
          // await readQRCode();
        },
        child: SvgPicture.asset(
          AppIcons.QR_CODE,
          color: Colors.white,
          width: 30,
        ),
      ),
     
      body: Center(child: Text("data"),),);
  }
}