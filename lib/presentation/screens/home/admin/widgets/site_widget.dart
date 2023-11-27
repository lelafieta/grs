import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';

class SiteWidget extends StatelessWidget {
  const SiteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.gps_fixed,
                  color: AppColors.CONTENT_COLOR,
                  size: 14,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "DEPENDÊNCIA KIKOLO",
                  style: GoogleFonts.russoOne(
                    color: AppColors.CONTENT_COLOR,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6.0),
              topRight: Radius.circular(6.0),
              bottomRight: Radius.circular(6.0),
              topLeft: Radius.circular(6.0),
            ),
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "LELA FIETA",
                            style: GoogleFonts.rammettoOne(
                              color: AppColors.MAIN_COLOR,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "PROTECTOR",
                            style: GoogleFonts.russoOne(
                              color: AppColors.CONTENT_COLOR,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.MAIN_COLOR,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                AppIcons.PHONE_CALLING,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.map,
                                color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}
