import 'package:get/get.dart';

import '../controllers/shared_posts_controller.dart';

class SharedPostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SharedPostsController>(
      () => SharedPostsController(),
    );
  }
}
