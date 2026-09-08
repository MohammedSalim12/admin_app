import 'package:admen_app/controller/auth/login_controller.dart';
import 'package:admen_app/core/class/handlingdataview.dart';
import 'package:admen_app/core/function/alertexitapp.dart';
import 'package:admen_app/core/function/validinput.dart';
import 'package:admen_app/view/widget/auth/Coustembuttomauth.dart';
import 'package:admen_app/view/widget/auth/Coustemtextauthtitle.dart';
import 'package:admen_app/view/widget/auth/Coustemtextbodyauth.dart';
import 'package:admen_app/view/widget/auth/CustomTextFormAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Login',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color:Colors.white),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          bool exit = await alertExitApp(); // نفس دالتك القديمة
          if (exit) {
            Navigator.pop(context);
          }
        },
        child: GetBuilder<LoginController>(
          builder: (controller) => Handingdataview(
            statusRequest: controller.statusrequest,
            widget: Container(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: Form(
                child: ListView(
                  children: [
                    // Logoauth(),
                    Coustemtextauthtitle(text: "9".tr),
                    SizedBox(height: 10),
                    Coustemtextbodyauth(textbody: "8".tr),
                    SizedBox(height: 10),
                    CustomTextFormAuth(
                      isNumber: false,
                      hintxt: "Enter your email",
                      iconData: Icons.email_outlined,
                      labeltext: "Email",
                      mycontroller: controller.email,
                      validator: (val) {
                        return validInput(val!, 5, 100, "email");
                      },
                    ),
                    CustomTextFormAuth(
                      onTap: () {
                        controller.showPassword();
                      },
                      isNumber: false,
                      hintxt: "Enter your password",
                      iconData: Icons.lock_outline,
                      labeltext: "Password",
                      mycontroller: controller.password,
                      validator: (val) {
                        return validInput(val!, 5, 100, "password");
                      },
                    ),
                    SizedBox(height: 10),
                    Coustembuttomauth( 
                      text: "Login",
                      onPressed: controller.login,
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
