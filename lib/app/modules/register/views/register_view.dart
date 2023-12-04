import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widget/button.dart';
import '../../../widget/form.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final RegisterController registerC = Get.put(RegisterController());

  RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "Register",
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
                  hintText: "Username",
                  textEditing: registerC.usernameC,
                ),
                const SizedBox(
                  height: 10,
                ),
                FormInput(
                  hintText: "Email",
                  textEditing: registerC.emailC,
                ),
                const SizedBox(
                  height: 10,
                ),
                FormInput(
                  hintText: "Name",
                  textEditing: registerC.nameC,
                ),
                const SizedBox(
                  height: 10,
                ),
                FormInput(
                  hintText: "Role",
                  textEditing: registerC.roleC,
                ),
                const SizedBox(
                  height: 10,
                ),
                FormPassword(
                  hintText: 'Password',
                  textEditing: registerC.passwordC,
                ),
                const SizedBox(
                  height: 40,
                ),
                button(
                  title: "Register",
                  colorTitle: Colors.white,
                  action: () async {
                    await controller.register(
                      registerC.usernameC.text,
                      registerC.emailC.text,
                      registerC.nameC.text,
                      registerC.roleC.text,
                      registerC.passwordC.text,
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
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
