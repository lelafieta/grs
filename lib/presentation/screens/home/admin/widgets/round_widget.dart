import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';

class RoundWidget extends StatelessWidget {
  const RoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black12,
                    image: DecorationImage(
                      image: AssetImage(AppImages.AVATAR_USER),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Lela Fieta",
                  style: GoogleFonts.russoOne(color: AppColors.CONTENT_COLOR),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: Colors.blue,
                    width: 4.0,
                  ),
                ),
              ),
              child: Container(
                child: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "RONDA INICIALIZADA",
                        style: GoogleFonts.russoOne(
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.COMPANY,
                            color: AppColors.MAIN_COLOR,
                          ),
                          Text(
                            "DEPENDÊNCIA KIKOLO",
                            style: GoogleFonts.russoOne(
                              color: AppColors.MAIN_COLOR,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.calendarDay,
                                color: AppColors.CONTENT_COLOR,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "09-10-2023",
                                style: GoogleFonts.russoOne(
                                  color: AppColors.CONTENT_COLOR,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                color: AppColors.CONTENT_COLOR,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "10:23:20",
                                style: GoogleFonts.russoOne(
                                  color: AppColors.CONTENT_COLOR,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 5,
                            height: 20,
                            color: Colors.black12,
                            margin: EdgeInsets.only(left: 10, right: 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.calendarCheck,
                                color: AppColors.CONTENT_COLOR,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "09-10-2023",
                                style: GoogleFonts.russoOne(
                                  color: AppColors.CONTENT_COLOR,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_time_filled_rounded,
                                color: AppColors.CONTENT_COLOR,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "13:20:00",
                                style: GoogleFonts.russoOne(
                                  color: AppColors.CONTENT_COLOR,
                                ),
                              ),
                            ],
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
