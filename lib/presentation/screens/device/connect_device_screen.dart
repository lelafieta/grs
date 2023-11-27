import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class ConnectDeviceScreen extends StatefulWidget {
  const ConnectDeviceScreen({super.key});

  @override
  State<ConnectDeviceScreen> createState() => _ConnectDeviceScreenState();
}

class _ConnectDeviceScreenState extends State<ConnectDeviceScreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.SVG_NEW_DEVICE),
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    "ASSOCIAR DISPOSITIVO",
                    style: GoogleFonts.russoOne(
                      color: AppColors.MAIN_COLOR,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    "Este dispositivo não está associado a nenhuma entidade.",
                    style: GoogleFonts.rajdhani(
                      color: AppColors.CONTENT_COLOR,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: IntlPhoneField(
                    controller:
                        phoneController, // Use o controller para vincular o valor do campo
                    languageCode: "pt_BR",
                    searchText: "Pesquise país",
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                      labelText: 'XXXXXXXXXXXXXXX',
                      contentPadding: EdgeInsets.all(12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: AppColors.MAIN_COLOR,
                          width: 3.0,
                        ),
                      ),
                    ),
                    initialCountryCode: 'AO',
                    onChanged: (phone) {
                      
                      print(phone.completeNumber);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          AppIcons.CALL_PHONE,
                          width: 45,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Suporte Técnico",
                          style: GoogleFonts.rajdhani(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 2,
                      height: 40,
                      color: AppColors.CONTENT_COLOR.withOpacity(.3),
                      margin: EdgeInsets.all(25),
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          AppIcons.INFO,
                          width: 45,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Dispositivo",
                          style: GoogleFonts.rajdhani(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                NumericKeyboard(
                  onKeyboardTap: (value) {
                    final currentText = phoneController.text;
                    final newText = currentText +
                        value; // Adicionar o valor do botão pressionado
                    phoneController.text = newText;
                    phoneController.selection = TextSelection.fromPosition(
                        TextPosition(offset: newText.length));
                  },
                  textColor: AppColors.MAIN_COLOR,
                  rightButtonFn: () {
                    // Ação a ser realizada quando o botão "Voltar" é pressionado
                    final currentText = phoneController.text;
                    if (currentText.isNotEmpty) {
                      final newText =
                          currentText.substring(0, currentText.length - 1);
                      phoneController.text = newText;
                      phoneController.selection = TextSelection.fromPosition(
                          TextPosition(offset: newText.length));
                    }
                  },
                  rightIcon: Icon(
                    Icons.backspace,
                    color: AppColors.MAIN_COLOR,
                  ),
                  leftButtonFn: () {
                    // Ação a ser realizada quando o botão "Verificar" é pressionado
                    print('left button clicked');
                  },
                  leftIcon: Icon(
                    Icons.check,
                    color: AppColors.MAIN_COLOR,
                  ),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
