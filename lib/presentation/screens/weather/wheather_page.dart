import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';
import 'package:simple_annimated_staggered/simple_annimated_staggered.dart';

class WheatherPage extends StatefulWidget {
  const WheatherPage({super.key});

  @override
  State<WheatherPage> createState() => _WheatherPageState();
}

class _WheatherPageState extends State<WheatherPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Scaffold(
        body: AnimationLimiter(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                      curve: Curves.bounceInOut,
                    ),
                  ),
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(AppImages.AVATARIMAGE))),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: AppColors.MAIN_COLOR.withOpacity(.6),
                              ),
                              Text(
                                "Luanda",
                                style: GoogleFonts.rajdhani(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Luanda",
                            style: GoogleFonts.rajdhani(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "Sexta, 2 Abril",
                            style: GoogleFonts.rajdhani(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(WheatherPage());
                      },
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.WEATHERBACKGROUND,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 30),
                                spreadRadius: -15,
                                color: AppColors.WEATHERBACKGROUND
                                    .withOpacity(.10),
                              ),
                              BoxShadow(
                                offset: Offset(1, 20),
                                color:
                                    AppColors.WEATHERBACKGROUND.withOpacity(.6),
                                spreadRadius: -10,
                              ),
                              BoxShadow(
                                offset: Offset(1, 40),
                                color:
                                    AppColors.WEATHERBACKGROUND.withOpacity(.4),
                                spreadRadius: -20,
                              ),
                            ]),
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: AppColors.WHITE_COLOR,
                                    ),
                                    Text(
                                      "Luanda",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: AppColors.WHITE_COLOR,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "+",
                                              style: GoogleFonts.rajdhani(
                                                fontSize: 50,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "17",
                                              style: GoogleFonts.rajdhani(
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "º",
                                              style: GoogleFonts.rajdhani(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "C",
                                              style: GoogleFonts.rajdhani(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "H: 23ºC",
                                              style: GoogleFonts.rajdhani(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "L: 14ºC",
                                              style: GoogleFonts.rajdhani(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                      AppIcons.WEATHER,
                                      width: 90,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Humidade",
                                      style: GoogleFonts.rajdhani(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "30%",
                                      style: GoogleFonts.rajdhani(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Precisão",
                                      style: GoogleFonts.rajdhani(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "5.1ml",
                                      style: GoogleFonts.rajdhani(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Vento",
                                      style: GoogleFonts.rajdhani(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "450hPa",
                                      style: GoogleFonts.rajdhani(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Pressão",
                                      style: GoogleFonts.rajdhani(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "10m/s",
                                      style: GoogleFonts.rajdhani(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hoje",
                            style: GoogleFonts.rajdhani(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Próximos 7 dias",
                            style: GoogleFonts.rajdhani(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.MAIN_COLOR.withOpacity(.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(),
                      child: ListView.builder(
                        itemCount: 7,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, int i) {
                          return Container(
                            width: 100,
                            margin: EdgeInsets.only(
                              left: 15,
                              bottom: 10,
                              top: 10,
                            ),
                            decoration: BoxDecoration(
                              color: (i == 0)
                                  ? AppColors.WEATHERBACKGROUND
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "15ºC",
                                      style: GoogleFonts.rajdhani(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22,
                                        color: (i != 0)
                                            ? AppColors.WEATHERBACKGROUND
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AppIcons.WEATHER,
                                      width: 50,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Segunda",
                                      style: GoogleFonts.rajdhani(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: (i != 0)
                                            ? AppColors.WEATHERBACKGROUND
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
