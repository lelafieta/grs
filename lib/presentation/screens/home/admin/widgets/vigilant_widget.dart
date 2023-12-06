import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/presentation/screens/home/admin/vigilant_detail_screen.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';

class VigilantWidget extends StatelessWidget {
  const VigilantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => VigilantDetailScreen());
          },
          child: Container(
            //margin: EdgeInsets.only(bottom: 20),

            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Container(
                  width: double.infinity,
                  child: ListTile(
                    leading: Stack(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black26,
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
                    title: Text(
                      "Lela Fieta",
                      style: GoogleFonts.rajdhani(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.MAIN_COLOR,
                      ),
                    ),
                    subtitle: Text(
                      "Dependência Kikolo",
                      style: GoogleFonts.rajdhani(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.MAIN_COLOR,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
