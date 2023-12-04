import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:login/app/modules/login/controllers/login_controller.dart';

import '../../../network/rest_client.dart';
import '../../../shared/url.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // getAllAdmin();
    super.onInit();
  }

  final LoginController c = Get.find();
  final restClient = RestClient();
  final url = BaseUrl().baseUrl + ApiUrl().getAllAdmin;
  RxBool isLoading = false.obs;
  RxString name = "".obs;
  RxList data = [].obs;

  Future getAllAdmin() async {
    try {
      isLoading(true);

      Map<String, dynamic> header = {'Authorization': c.token.value};
      var response = await restClient.getData(url: url, headers: header);
      // final datata = json.decode(response.toString());
      data.value = response['data'];
      print("isi data :  " + data.toString());
      isLoading(false);
    } catch (e) {
      // Get.defaultDialog(title: "Error", middleText: "");
      // print("$e");
    }
    return data;
  }
}
