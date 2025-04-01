import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/model/posts.dart';
import '../../../data/providers/bookmark_helper.dart';

class BookmarkController extends GetxController {
  final _storage = GetStorage();
  final String _bookmarkKey = 'bookmarks';
  RxList<Posts> bookmarks = <Posts>[].obs;
  final BookmarkHelper bookmarkHelper = BookmarkHelper();

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }

  void loadBookmarks() {
    bookmarks.value = bookmarkHelper.getBookmarks();
  }

  void toggleBookmark(Posts post) {
    bookmarkHelper.toggleBookmark(post);
    loadBookmarks();
  }

  bool isBookmarked(Posts post) {
    return bookmarkHelper.isBookmarked(post);
  }

  Future<bool> onLikeButtonTapped(bool isLiked, Posts post) async {
    toggleBookmark(post);
    return !isLiked;
  }
}