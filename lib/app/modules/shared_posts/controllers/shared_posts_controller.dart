import 'package:get/get.dart';

import '../../../data/model/posts.dart';

class SharedPostsController extends GetxController {

  List<Posts> posts = [];

  @override
  void onInit() {
    posts.assignAll(Get.arguments['posts']);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
