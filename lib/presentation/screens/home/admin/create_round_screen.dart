import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grs/presentation/screens/home/admin/widgets/round_widget.dart';
import 'package:grs/presentation/screens/home/admin/widgets/admin_info_widget.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';

class CreateRoundScreen extends StatefulWidget {
  const CreateRoundScreen({super.key});

  @override
  State<CreateRoundScreen> createState() => _CreateRoundScreenState();
}

class _CreateRoundScreenState extends State<CreateRoundScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BODY_BACKGROUND,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColors.MAIN_COLOR,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.MAIN_LOGO),
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  width: 50,
                  child: SvgPicture.asset(
                    AppIcons.SIREN,
                    color: Colors.white,
                    width: 35,
                  ),
                ),
                Container(
                  child: Positioned(
                    right: 0,
                    child: Container(
                      width: 25,
                      height: 25,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            "10",
                            style: GoogleFonts.russoOne(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.ANGOLA,
                  width: 30,
                ),
                SvgPicture.asset(
                  AppIcons.LOGOUT,
                  color: Colors.white,
                  width: 40,
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImages.BACKGROUND,
              ),
              fit: BoxFit.fill,
              opacity: .5,
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.CONTENT_CONTAINER,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 2),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                  )
                                ],
                                color: Colors.black45,
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
                        SizedBox(
                          width: 10,
                        ),
                        AdminInfoWidget(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 6,
                                  color: AppColors.MAIN_COLOR,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      8), // Adicione o espaço à esquerda desejado
                              child: Text(
                                "CRIAR RONDAS",
                                style: GoogleFonts.russoOne(
                                  fontSize: 16,
                                  color: AppColors.CONTENT_COLOR,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: 200,
                        // ),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      8), // Adicione o espaço à esquerda desejado
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "PESQUISAR",
                                    style: GoogleFonts.russoOne(
                                      fontSize: 16,
                                      color: AppColors.MAIN_COLOR,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    AppIcons.SEARCH,
                                    color: AppColors.MAIN_COLOR,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "RONDA NORMAL",
                          style: GoogleFonts.russoOne(
                            color: AppColors.MAIN_COLOR,
                          ),
                        ),
                        Text(
                          "RONDA EXPONTÂNEA",
                          style: GoogleFonts.russoOne(
                            color: AppColors.CONTENT_COLOR,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            height: 40,
                            child: FormBuilderDateTimePicker(
                              name: "Data de início",
                              inputType: InputType.date,
                              initialDate: DateTime(DateTime.now().year - 18),
                              lastDate: DateTime(DateTime.now().year - 18),
                              firstDate: DateTime(DateTime.now().year - 60),
                              decoration: InputDecoration(
                                labelText: 'Data de Início',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(FontAwesomeIcons.calendarDay),
                                hintStyle: GoogleFonts.rajdhani(
                                  fontWeight: FontWeight.w600,
                                ),
                                labelStyle: GoogleFonts.rajdhani(
                                  fontWeight: FontWeight.w600,
                                ),
                                helperStyle: GoogleFonts.rajdhani(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                DateTime currentDate = DateTime.now();
                                Duration? ageDifference;
                                int ageInYears = 0;
                                // authController.dataNascimento.value = value;
                                // authController.nascimento!.value.text =
                                //     value.toString().substring(0, 11);

                                // if (authController.dataNascimento.value != null) {
                                //   Duration? ageDifference = currentDate
                                //       .difference(authController.dataNascimento.value!);
                                //   ageInYears = (ageDifference.inDays / 365).floor();

                                //   if (ageInYears < 18) {
                                //     return "${ageInYears} ano(s) Idade inferior a 18, Registe o seu responsável.";
                                //   }
                                // } else {
                                //   return "Data de nascimento inválida";
                                // }
                                return null; // Retorna null se a validação for bem-sucedida
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            color: Colors.white,
                            height: 40,
                            child: FormBuilderDateTimePicker(
                              name: "Data de fim",
                              inputType: InputType.date,
                              initialDate: DateTime(DateTime.now().year - 18),
                              lastDate: DateTime(DateTime.now().year - 18),
                              firstDate: DateTime(DateTime.now().year - 60),
                              decoration: InputDecoration(
                                labelText: 'Data de fim',
                                border: OutlineInputBorder(),
                                prefixIcon:
                                    Icon(FontAwesomeIcons.calendarCheck),
                                hintStyle: GoogleFonts.rajdhani(
                                  fontWeight: FontWeight.w600,
                                ),
                                labelStyle: GoogleFonts.rajdhani(
                                  fontWeight: FontWeight.w600,
                                ),
                                helperStyle: GoogleFonts.rajdhani(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                DateTime currentDate = DateTime.now();
                                Duration? ageDifference;
                                int ageInYears = 0;
                                // authController.dataNascimento.value = value;
                                // authController.nascimento!.value.text =
                                //     value.toString().substring(0, 11);

                                // if (authController.dataNascimento.value != null) {
                                //   Duration? ageDifference = currentDate
                                //       .difference(authController.dataNascimento.value!);
                                //   ageInYears = (ageDifference.inDays / 365).floor();

                                //   if (ageInYears < 18) {
                                //     return "${ageInYears} ano(s) Idade inferior a 18, Registe o seu responsável.";
                                //   }
                                // } else {
                                //   return "Data de nascimento inválida";
                                // }
                                return null; // Retorna null se a validação for bem-sucedida
                              },
                            ),
                          ),
                          FormBuilderRadioGroup(
                            name: 'Opções',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // validator: FormBuilderValidators.required(
                            //   errorText: "Selecione um gênero",
                            // ),

                            options: [
                              'DISPOSITIVO ESPECÍFICO',
                              'TODOS OS DISPOSITIVOS DO SITE',
                            ].map(
                              (option) {
                                return FormBuilderFieldOption(
                                  value: option,
                                  child: Text(
                                    '$option',
                                    style: GoogleFonts.russoOne(
                                      fontSize: 14,
                                      color: AppColors.CONTENT_COLOR,
                                    ),
                                  ),
                                );
                              },
                            ).toList(growable: false),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              //authController.genero.value = value.toString();
                            },
                          ),
                          Container(
                            height: 40,
                            child: FormBuilderDropdown(
                              name: 'Dispositivos',
                              decoration: InputDecoration(
                                labelText: 'Dispositivos',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(FontAwesomeIcons.mobile),
                                hintStyle: GoogleFonts.rajdhani(
                                  fontWeight: FontWeight.w600,
                                ),
                                labelStyle: GoogleFonts.rajdhani(
                                  fontWeight: FontWeight.w600,
                                ),
                                helperStyle: GoogleFonts.rajdhani(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              items: []
                                  .map(
                                    (divice) => DropdownMenuItem(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      value: divice,
                                      child: Text(divice.toString()),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                // authController.provincia.value = value!.nome.toString();
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // validator: FormBuilderValidators.compose([
                              //   FormBuilderValidators.required(
                              //       errorText: "Campo obrigatório"),
                              // ]),
                            ),
                          ),
                          FormBuilderRadioGroup(
                            name: 'Opções',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // validator: FormBuilderValidators.required(
                            //   errorText: "Selecione um gênero",
                            // ),

                            options: [
                              'RECORRENTE',
                              'NÃO RECORRENTE',
                            ].map(
                              (option) {
                                return FormBuilderFieldOption(
                                  value: option,
                                  child: Text(
                                    '$option',
                                    style: GoogleFonts.russoOne(
                                      fontSize: 14,
                                      color: AppColors.CONTENT_COLOR,
                                    ),
                                  ),
                                );
                              },
                            ).toList(growable: false),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              //authController.genero.value = value.toString();
                            },
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
