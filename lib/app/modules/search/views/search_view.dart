import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_circular/app/widgets/post_tile.dart';

import '../../../widgets/reusable_text.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchAController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      body: Column(
        children: [
          Container(
            color: const Color(0xff128d70),
            child: Column(
              children: [
                SafeArea(
                  child: SizedBox(
                    height: 65.h,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 30.w),
                            child: SvgPicture.asset(
                              'assets/images/svg/back.svg',
                              height: 15.h,
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        ReusableText(
                          "Search",
                          family: 'ferdoka',
                          size: 22.22,
                          weight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 12.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(9.r)),
                    child: TextField(
                      onChanged: controller.filterPosts,
                      style: TextStyle(fontFamily: 'bn'),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: const Color(0xffF2F2F7),
                        filled: true,
                        hintText: 'Enter search keyword',
                        prefixIcon: Icon(CupertinoIcons.search_circle),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.h)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.filteredPosts.isEmpty) {
                return Center(
                  child: ReusableText(
                    'No post found!',
                    size: 18,
                    weight: FontWeight.w600,
                    family: 'ferdoka',
                  ),
                );
              }
              return ListView.builder(
                itemBuilder:
                    (_, i) => PostTile(post: controller.filteredPosts[i]),
                itemCount: controller.filteredPosts.length,
              );
            }),
          ),
        ],
      ),
    );
  }
}
