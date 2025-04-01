import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:job_circular/app/modules/home/controllers/home_controller.dart';

import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/post_tile.dart';
import '../../../widgets/reusable_text.dart';

class ResultsView extends GetView<HomeController> {
  const ResultsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Results'),
        Expanded(
          child:
          controller.getOnlyResults().isEmpty
              ? Center(
            child: ReusableText(
              'Sorry! No results available.',
              family: 'ferdoka',
              size: 18,
              weight: FontWeight.w600,
            ),
          )
              : ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, i) {
              var post = controller.getOnlyResults()[i];
              return PostTile(post: post);
            },
            itemCount: controller.getOnlyResults().length,
            // shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
