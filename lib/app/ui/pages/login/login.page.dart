import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/login.controller.dart';
import 'package:flutter_application_1/app/ui/pages/login/widgets/button.dart';
import 'package:flutter_application_1/app/ui/pages/login/widgets/text.field.dart';
import 'package:flutter_application_1/app/ui/pages/login/widgets/text.pass.dart';
import 'package:flutter_application_1/app/utils/global.colors.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: GetBuilder<LoginController>(builder: (loginCL) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
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
            }),
          ),
        ),
      ),
    );
  }
}
