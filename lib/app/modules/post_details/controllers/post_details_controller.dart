import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../data/model/posts.dart';
import '../../../data/providers/api_service.dart';

class PostDetailsController extends GetxController {
  final Rx<Posts?> post = Rx<Posts?>(null);
  final isLoading = true.obs;
  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();

  final ApiService _apiService = ApiService();

  var pdfUrl = ''.obs;

  @override
  void onInit() {
    _fetchPostAndLoadPdf();
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

  Future<void> _fetchPostAndLoadPdf() async {
    final postId = Get.arguments['id'].toString() ?? '';
    final postSlug = Get.arguments['slug'] ?? '';

    if (postId.isEmpty || postSlug.isEmpty) {
      debugPrint('empty id and slug');
      return;
    }

    await fetchPostDetails(postSlug, postId);
    await loadPdfUrl(postId);
    // await _loadPdf(postId);
  }

  Future<void> fetchPostDetails(String slug, String id) async {
    try {
      final fetchedPost = await _apiService.fetchDataBySlug(slug, id);
      if (fetchedPost != null) {
        post.value = fetchedPost;
        if (kDebugMode) {
          print('Post Loaded: ${fetchedPost.title}');
        }
      }
    } catch (e) {
      if (kDebugMode) print('Failed to load post details: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> loadPdfUrl(String postId) async {
    final convertedUrl =
        "https://jobcircularlive.com/backend/api/direct/converted_circular/pdf/$postId";
    final directUrl =
        "https://jobcircularlive.com/backend/api/direct/circular/pdf/$postId";
    try {
      pdfUrl.value =
          await _checkPdfExists(convertedUrl) ? convertedUrl : directUrl;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> _checkPdfExists(String url) async {
    try {
      final response = await Dio().head(url);
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  void downloadFile(String postId) async {
    final convertedUrl =
        "https://jobcircularlive.com/backend/api/direct/converted_circular/pdf/$postId";
    final directUrl =
        "https://jobcircularlive.com/backend/api/direct/circular/pdf/$postId";

    try {
      final pdfUrl =
          await _checkPdfExists(convertedUrl) ? convertedUrl : directUrl;
      _apiService.downloadFileWeb(
        pdfUrl,
        "${post.value!.title ?? DateTime.now().millisecondsSinceEpoch}.pdf", // ফাইল নাম
      );
    } catch (e) {
      if (kDebugMode) print("Failed to load PDF: $e");
    }
  }
}
