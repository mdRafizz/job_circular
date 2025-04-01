import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/post_tile.dart';
import '../../../widgets/reusable_text.dart';
import '../controllers/shared_posts_controller.dart';

class SharedPostsView extends GetView<SharedPostsController> {
  const SharedPostsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      body: Column(
        children: [
          CustomAppBar(title: Get.arguments['title'], showBackButton: true),

          Gap(20.h),
          Expanded(
            child:
            controller.posts.isEmpty
                ? Center(
              child: ReusableText(
                'Sorry! No post available.',
                family: 'ferdoka',
                size: 18,
                weight: FontWeight.w600,
              ),
            )
                : ListView.builder(
              padding: EdgeInsets.zero,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                var post = controller.posts[i];
                return PostTile(post: post);
              },
              itemCount: controller.posts.length,
              // shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
