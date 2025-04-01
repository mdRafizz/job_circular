import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:job_circular/app/modules/home/controllers/home_controller.dart';
import 'package:job_circular/app/widgets/custom_app_bar.dart';

import '../../../widgets/post_tile.dart';
import '../../../widgets/reusable_text.dart';

class CircularView extends GetView<HomeController> {
  const CircularView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Circular'),
        Expanded(
          child:
          controller.getOnlyCirculars().isEmpty
              ? Center(
            child: ReusableText(
              'Sorry! No circulars available.',
              family: 'ferdoka',
              size: 18,
              weight: FontWeight.w600,
            ),
          )
              : ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, i) {
              var post = controller.getOnlyCirculars()[i];
              return PostTile(post: post);
            },
            itemCount: controller.getOnlyCirculars().length,
            // shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
