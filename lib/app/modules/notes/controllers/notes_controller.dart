import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/model/notes.dart';
import '../../../data/model/subject.dart';
import '../../../data/providers/api_service.dart';

class NotesController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final textEditingController = TextEditingController();
  final ApiService _apiService = ApiService();
  final GetStorage box = GetStorage();

  final notes = <Notes>[].obs;
  final categories = <SubjectCategory>[].obs;

  final isLoading = false.obs;
  var errorMessage = ''.obs;
  final selectedCategory = 'All'.obs;

  @override
  void onInit() {
    fetchAllPosts();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  Future<void> fetchAllPosts() async {
    isLoading(true);
    try {
      notes.value = await _apiService.fetchNotes();
      categories.value = await _apiService.fetchSubjectCategory();
    } on DioException catch (e) {
      errorMessage('Failed to load data: ${e.message}');
    } catch (e) {
      errorMessage('Failed to load data: $e');
    } finally {
      isLoading(false);
    }
  }

  List<Notes> filterCirculars(String val) {
    return notes.where((post) {
      return post.status == 'Approved' &&
          (val == 'All' || post.subjectCategory?.name == val);
    }).toList();
  }
}
