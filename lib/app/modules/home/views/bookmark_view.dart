import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_circular/app/modules/home/controllers/bookmark_controller.dart';
import 'package:job_circular/app/widgets/post_tile.dart';
import 'package:job_circular/app/widgets/reusable_text.dart';

import '../../../data/model/posts.dart';
import '../../../widgets/custom_app_bar.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Bookmark'),

        Obx(() {
          if (controller.bookmarks.isEmpty) {
            return Expanded(
              child: Center(
                child: ReusableText(
                  'No bookmarks added.',
                  size: 18,
                  weight: FontWeight.w600,
                  family: 'ferdoka',
                ),
              ),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                itemCount: controller.bookmarks.length,
                itemBuilder: (context, index) {
                  Posts post = controller.bookmarks[index];
                  return PostTile(post: post);
                },
              ),
            );
          }
        }),
      ],
    );
  }
}
