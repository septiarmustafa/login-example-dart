import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widget/button.dart';
import '../../../widget/form.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController loginC = Get.put(LoginController());

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 28, 0, 92),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                FormInput(
                  hintText: "Your Email",
                  textEditing: loginC.emailC,
                ),
                const SizedBox(
                  height: 20,
                ),
                FormPassword(
                  hintText: 'Your Password',
                  textEditing: loginC.passwordC,
                ),
                const SizedBox(
                  height: 40,
                ),
                button(
                  title: "Login",
                  colorTitle: Colors.white,
                  action: () async {
                    await controller.login(
                        loginC.emailC.text, loginC.passwordC.text);
                  },
                ),
                const SizedBox(
                  height: 300,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have an Account? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Get.toNamed(Routes.SIGN_UP);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
