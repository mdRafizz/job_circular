// import 'package:bcs_preli_preparation/app/data/providers/api_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../../../routes/app_pages.dart';
//
// class ResetPasswordController extends GetxController {
//   final token = Get.arguments['token'];
//   final _apiService = ApiService();
//
//   var isLoading = false.obs;
//
//   final email = TextEditingController();
//   final password = TextEditingController();
//   final confirmPassword = TextEditingController();
//
//
//   @override
//   void onInit() {
//     super.onInit();
//     if (token != null) {
//       print('Token: $token');
//     } else {
//       Get.toNamed(Routes.HOME);
//     }
//   }
//
//   @override
//   void onClose() {
//     email.dispose();
//     password.dispose();
//     confirmPassword.dispose();
//     super.onClose();
//   }
//
// }