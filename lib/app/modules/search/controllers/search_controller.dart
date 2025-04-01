import 'package:get/get.dart';

import '../../../data/model/posts.dart';

class SearchAController extends GetxController {

  var postLists = <Posts>[].obs;
  var filteredPosts = <Posts>[].obs;

  @override
  void onInit() {
    setPosts(Get.arguments['posts']);
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

  void setPosts(List<Posts> posts) {
    postLists.assignAll(posts);
    filteredPosts.assignAll(posts);
  }

  void filterPosts(String query) {
    if (query.isEmpty) {
      filteredPosts.assignAll(postLists);
    } else {
      filteredPosts.assignAll(
        postLists.where((post) =>
        post.title?.toLowerCase().contains(query.toLowerCase()) ?? false),
      );
    }
  }
}
