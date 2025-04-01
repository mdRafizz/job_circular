import 'package:get/get.dart';
import 'package:job_circular/app/modules/home/controllers/bookmark_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BookmarkController>(
      () => BookmarkController(),
    );
  }
}
