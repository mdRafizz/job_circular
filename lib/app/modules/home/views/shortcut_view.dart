import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_circular/app/data/model/posts.dart';
import 'package:job_circular/app/modules/home/controllers/home_controller.dart';
import 'package:job_circular/app/modules/home/widgets/shortcut_top.dart';
import 'package:job_circular/app/widgets/post_tile.dart';
import 'package:job_circular/app/widgets/reusable_text.dart';
import 'package:like_button/like_button.dart';

class ShortcutView extends GetView<HomeController> {
  const ShortcutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            color: const Color(0xff128d70),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShortcutTop(controller: controller),
              Container(
                color: const Color(0xfff4f4f4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 18.h,
                      ),
                      child: ReusableText(
                        'সাম্প্রতিক পোস্ট',
                        size: 17,
                        weight: FontWeight.w600,
                      ),
                    ),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return SizedBox(
                          height:
                              MediaQuery.sizeOf(context).height * .47 - 36.h,
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF1d9279),
                              ),
                              backgroundColor: const Color(
                                0xFF1d9279,
                              ).withValues(alpha: .2),
                              strokeWidth: 6.5,
                              strokeAlign: 2.5,
                              strokeCap: StrokeCap.round,
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, i) {
                          var post = controller.postLists[i];
                          return PostTile(
                            post: post,
                          );
                        },
                        itemCount: controller.postLists.length,
                        shrinkWrap: true,
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
        Obx(() {
          if (controller.isLoggingOut.value) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black45,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      const Color(0xffffffff),
                    ),
                    backgroundColor: const Color(
                      0xFFffffff,
                    ).withValues(alpha: .2),
                    strokeWidth: 6.5,
                    strokeAlign: 2.5,
                    strokeCap: StrokeCap.round,
                  ),
                ),
              ),
            );
          }
          else {
            return SizedBox.shrink();
          }
        }),

      ],
    );
  }

  // 🔹 নেভিগেশনের জন্য আলাদা ফাংশন
  // void _navigateToPost(Posts post, BuildContext context) {
  //   if (note.slug != null && note.slug!.isNotEmpty && note.id != null) {
  //     String route;
  //     switch (note.type) {
  //       case 1:
  //         route = '/circular/${note.id}/${Uri.encodeComponent(note.slug!)}';
  //         break;
  //       case 2:
  //         route = '/result/${note.id}/${Uri.encodeComponent(note.slug!)}';
  //         break;
  //       default:
  //         route = '/notice/${note.id}/${Uri.encodeComponent(note.slug!)}';
  //     }
  //     Get.delete<PostDetailsController>();
  //     context.go(route);
  //   } else {
  //     debugPrint('Slug is null or empty');
  //   }
  // }

  // 🔹 পোস্ট টাইপ লেবেল তৈরি করার ফাংশন
  Widget _buildPostTypeLabel(Posts post) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
          ),
          color: Colors.black45,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: ReusableText(
          post.type == 1
              ? 'Circular'
              : post.type == 2
              ? 'Result'
              : 'Notice',
          size: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}
