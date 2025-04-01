import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../controllers/register_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    // Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController());
    // Get.lazyPut(() => ResetPasswordController());
  }
}
