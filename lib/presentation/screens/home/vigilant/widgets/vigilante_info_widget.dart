import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';

class VigilantInfoWidget extends StatelessWidget {
  const VigilantInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                "LELA FIETA",
                style: GoogleFonts.rammettoOne(
                  fontSize: 16,
                  color: AppColors.MAIN_COLOR,
                ),
              ),
            ),
            FittedBox(
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.COMPANY),
                  SizedBox(
                    width: 3,
                  ),
                  FittedBox(
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.russoOne(
                          color: AppColors.CONTENT_COLOR,
                          fontSize: 16,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Protector ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '| Dependência Shopping Kilamba',
                            style: GoogleFonts.russoOne(
                              color: AppColors.CONTENT_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FittedBox(
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.SECURITY),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "VIGILANTE",
                    style: GoogleFonts.righteous(
                      color: AppColors.MAIN_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
