import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login/app/routes/app_pages.dart';

import '../../../network/rest_client.dart';
import '../../../shared/url.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  RxBool isHidden = true.obs;
  RxString token = "".obs;

  final restClient = RestClient();
  final url = BaseUrl().baseUrl + ApiUrl().loginUrl;
  RxBool isLoading = false.obs;

  Future<void> login(String name, String pass) async {
    try {
      isLoading(true);

      var payload = {"username": name, "password": pass};
      var response = await restClient.postData(url: url, payload: payload);
      token.value = response['token'];
      print(token.value);

      Get.toNamed(Routes.HOME);
      isLoading(false);
      // log(response);
    } catch (e) {
      Get.defaultDialog(
          title: "Login Gagal", middleText: "Username atau Password Salah");
      print(e);
    }
  }
}
