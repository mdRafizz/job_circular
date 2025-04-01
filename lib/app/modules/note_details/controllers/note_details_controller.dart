import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../data/model/notes.dart';
import '../../../data/providers/api_service.dart';

class NoteDetailsController extends GetxController {


  final ApiService _apiService = ApiService();
  Rx<Notes?> note = Rx<Notes?>(null);
  var isLoading = true.obs;
  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();

  @override
  void onInit() {
    fetchNoteDetails(Get.arguments['slug'], Get.arguments['id']);
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

  Future<void> fetchNoteDetails(String slug, String id) async {
    try {
      final p = await _apiService.fetchNoteBySlug(slug, id);
      if (p != null) {
        note.value = p;
      }
    } catch (e) {
      debugPrint('Failed to load note details: $e');
    } finally {
      isLoading(false);
    }
  }

  void downloadFile(String noteId) {
    final directUrl =
        "https://jobcircularlive.com/backend/api/note/direct/pdf/$noteId";

    _apiService.downloadFileWeb(
      directUrl, // ফাইল URL
      "${note.value!.title ?? DateTime.now().millisecondsSinceEpoch}.pdf", // ফাইল নাম
    );
  }

}
