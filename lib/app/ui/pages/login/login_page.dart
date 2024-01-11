import 'package:flutter/material.dart';
import 'package:citvs/app/controllers/login_controller.dart';
import 'package:citvs/app/ui/pages/login/widgets/button.dart';
import 'package:citvs/app/ui/pages/login/widgets/text_field.dart';
import 'package:citvs/app/ui/pages/login/widgets/text_pass.dart';
import 'package:citvs/app/utils/global.colors.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: screenHeight,
            padding: const EdgeInsets.all(20.0),
            child: GetBuilder<LoginController>(
              builder: (loginCL) {
                return Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centra verticalmente
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 220,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Ingrese sus credenciales',
                      style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //// EMAIL INPUT
                    TextFieldWidget(
                      controller: loginCL.username,
                      text: 'Usuario',
                      icon: Icons.person,
                      obscure: false,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //// PASSWORD INPUT
                    TextFieldPass(
                        controller: loginCL.password, obs: loginCL.obscurePass),
                    const SizedBox(
                      height: 15,
                    ),
                    ButtonGlobal(onTap: () {
                      loginCL.validateFields();
                    }),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
