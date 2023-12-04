import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login/app/routes/app_pages.dart';

import '../../../network/rest_client.dart';
import '../../../shared/url.dart';

class RegisterController extends GetxController {
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController roleC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  final restClient = RestClient();
  final url = BaseUrl().baseUrl + ApiUrl().registerUrl;
  RxBool isLoading = false.obs;

  Future<void> register(
    String username,
    String email,
    String name,
    String role,
    String pass,
  ) async {
    try {
      isLoading(true);

      var payload = {
        "username": username,
        "email": email,
        "name": name,
        "role": role,
        "password": pass,
      };
      var response = await restClient.postData(url: url, payload: payload);
      print(response['name']);

      isLoading(false);
      Get.toNamed(Routes.HOME);

      log(response);
    } catch (e) {
      Get.defaultDialog(title: "Register Gagal", middleText: "$e");
    }
  }
}
