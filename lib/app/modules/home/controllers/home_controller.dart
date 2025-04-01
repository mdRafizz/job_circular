import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_circular/app/data/providers/api_service.dart';

import '../../../data/model/posts.dart';
import '../../../data/model/category.dart' as ct;
import '../../../data/providers/bookmark_helper.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/app_snack.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController tabController;

  late PageController pageController;
  late int currentIndex;
  late Timer? timer;

  var isLoading = false.obs;
  var isLoggingOut = false.obs;
  final postLists = <Posts>[].obs;
  final categories = <ct.Category>[].obs;

  final box = GetStorage();
  final _apiService = ApiService();
  // final scaffoldKey = GlobalKey<ScaffoldState>();


  RxList<Posts> bookmarks = <Posts>[].obs;
  final BookmarkHelper bookmarkHelper = BookmarkHelper();


  @override
  void onInit() {
    fetchAllPosts();
    tabController = TabController(length: 4, vsync: this);
    currentIndex = Random().nextInt(43);
    pageController = PageController(initialPage: currentIndex);

    timer = Timer.periodic(
      const Duration(seconds: 10),
          (timer) {
        if (pageController.hasClients) {
          if (currentIndex == 43 - 1) {
            // Move to first quote without animation
            pageController.jumpToPage(0);
            currentIndex = 0;
          } else {
            currentIndex++;
          }
          pageController.animateToPage(
            currentIndex,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
          );
        }
      },
    );

    // loadBookmarks();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    pageController.dispose();
    timer?.cancel();
    super.onClose();
  }

  void fetchAllPosts() async {
    try {
      isLoading(true);
      final fetchedPosts = await _apiService.fetchPosts();
      final ctg = await _apiService.fetchCategory();
      postLists.value = fetchedPosts;
      categories.value = ctg;
      if (kDebugMode) {
        print(categories);
      }

    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    } finally {
      isLoading(false);
    }
  }

  List<Posts> getOnlyNotices() => postLists.where((post) => post.type == 3).toList();
  List<Posts> getOnlyCirculars() => postLists.where((post) => post.type == 1).toList();
  List<Posts> getOnlyResults() => postLists.where((post) => post.type == 2).toList();


  // void loadBookmarks() {
  //   bookmarks.value = bookmarkHelper.getBookmarks();
  // }
  //
  // void toggleBookmark(Posts post) {
  //   bookmarkHelper.toggleBookmark(post);
  //   loadBookmarks();
  // }
  //
  // bool isBookmarked(Posts post) {
  //   return bookmarkHelper.isBookmarked(post);
  // }
  //
  // Future<bool> onLikeButtonTapped(bool isLiked, Posts post) async {
  //   toggleBookmark(post);
  //   return !isLiked;
  // }

  void logout() async {
    try {
      isLoggingOut(true);
      final response = await _apiService.logout(box.read('token'));

      if (response == null) {
        return;
      }
      if (response.statusCode == 200) {
        box.remove("token");
        Get.offAllNamed(Routes.HOME);
        AppSnack.successSnack('Logout successful!');
      } else {
        AppSnack.errorSnack(response.statusMessage.toString());
      }
    } catch (e) {
      AppSnack.errorSnack(e.toString());
      debugPrint('logout error: $e');
    }
    finally{
      isLoggingOut(false);
    }
  }

}
