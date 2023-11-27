import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
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
                  style: GoogleFonts.russoOne(
                    color: AppColors.CONTENT_COLOR,
                    fontSize: 16,
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
              bottomLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: Colors.red,
                    width: 4.0,
                  ),
                ),
              ),
              child: Container(
                width: double.infinity,
                child: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              AppIcons.SMARTPHONE,
                              width: 18,
                            ),
                            Text(
                              "ASSALTO",
                              style: GoogleFonts.russoOne(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ],
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
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  fontSize: 16,
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
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 150,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.MAIN_COLOR,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppIcons.PHONE_CALLING,
                                    color: Colors.white,
                                    width: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.map,
                                  color: Colors.white,
                                  size: 20,
                                )),
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
