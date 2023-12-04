import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/login/controllers/login_controller.dart';

// ignore: camel_case_types
class FormInput extends StatelessWidget {
  // ignore: non_constant_identifier_names

  FormInput({
    super.key,
    required this.hintText,
    required this.textEditing,
    this.hide,
  });

  final String hintText;
  final TextEditingController textEditing;
  final IconButton? hide;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditing,
      autocorrect: false,
      cursorColor: const Color.fromARGB(255, 0, 0, 0),
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      decoration: InputDecoration(
        suffixIcon: hide,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Color.fromARGB(255, 58, 150, 211),
          ),
        ),
        helperStyle: const TextStyle(color: Colors.white),
        counterStyle: const TextStyle(color: Colors.white),
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 58, 150, 211),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class FormPassword extends StatelessWidget {
  final LoginController LoginC = Get.put(LoginController());

  FormPassword({
    super.key,
    required this.hintText,
    required this.textEditing,
    this.hide,
  });

  final String hintText;
  final TextEditingController textEditing;
  final IconButton? hide;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditing,
      autocorrect: false,
      cursorColor: const Color.fromARGB(255, 0, 0, 0),
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      obscureText: LoginC.isHidden.value,
      decoration: InputDecoration(
        suffixIcon: hide,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Color.fromARGB(255, 58, 150, 211),
          ),
        ),
        helperStyle: const TextStyle(color: Colors.white),
        counterStyle: const TextStyle(color: Colors.white),
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 58, 150, 211),
        ),
      ),
    );
  }
}
