import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_circular/app/modules/notes/controllers/notes_controller.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/app_snack.dart';
import '../../../widgets/reusable_text.dart';

class NotesDrawerContent extends GetView<NotesController> {
  const NotesDrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems =
        controller.box.hasData('token')
            ? [
              ['Profile', 'assets/images/svg/profile.svg'],
              ['Logout', 'assets/images/svg/sign-out-alt.svg'],
            ]
            : [
              ['Login', 'assets/images/svg/login.svg'],
              ['Register', 'assets/images/svg/sign-up.svg'],
            ];

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
      child: Container(
        color: Colors.black26,
        child: Drawer(
          backgroundColor: Colors.white12,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: Column(
            children: [
              Container(
                height: 160.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/png/top_cover.png'),
                    colorFilter: ColorFilter.mode(
                      Colors.black38,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                padding: EdgeInsets.only(left: 20.w, bottom: 15.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      'Job Circular',
                      color: Colors.white,
                      weight: FontWeight.bold,
                      size: 25,
                      family: 'ferdoka',
                    ),
                    ReusableText(
                      'Version: 1.0.0',
                      color: Colors.white24,
                      weight: FontWeight.bold,
                      size: 14,
                      family: 'bn',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Gap(20.h),
                      ...List.generate(
                        menuItems.length,
                        (i) => GestureDetector(
                          onTap: () {
                            Get.back();
                            _drawerActions(menuItems[i][0]);
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Gap(25.w),
                                  SvgPicture.asset(
                                    menuItems[i][1],
                                    height: 18.h,
                                    width: 18.w,
                                    colorFilter: ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  Gap(15.w),
                                  ReusableText(
                                    menuItems[i][0],
                                    size: 17.6,
                                    family: 'ferdoka',
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Gap(30.h),
                            ],
                          ),
                        ),
                      ),
                      // Gap(20.h),
                      _namedDivider('Filter Notes'),
                      Gap(12.h),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return Center(
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
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 11.w),
                            child: Column(
                              children: [
                                Obx(() {
                                  return _categoryButton(
                                    'All',
                                    controller.selectedCategory.value,
                                    (_) => controller.selectedCategory('All'),
                                  );
                                }),
                                Obx(() {
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: controller.categories.length,
                                    itemBuilder: (_, i) {
                                      return Obx(() {
                                        return _categoryButton(
                                          controller.categories[i].name!,
                                          controller.selectedCategory.value,
                                          (val) =>
                                              controller.selectedCategory(val),
                                        );
                                      });
                                    },
                                  );
                                }),
                              ],
                            ),
                          );
                        }
                      }),
                      Gap(12.h),
                      _namedDivider('Others'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _drawerActions(String title) {
    switch (title) {
      // case 'Profile':
      //   Get.toNamed(Routes.PROFILE);
      //   break;
      case 'Data Deletion':
        Get.toNamed(Routes.DATA_DELETION);
        break;
      case 'Logout':
        // controller.logout();
        break;
      case 'Login':
        Get.toNamed(Routes.LOGIN);
        break;
      case 'Register':
        Get.toNamed(Routes.REGISTER);
        break;
      // case 'About Us':
      //   Get.toNamed(Routes.ADDITIONAL_INFO, arguments: 'About Us');
      //   break;
      case 'Contact Us':
        Get.toNamed(Routes.CONTACT_US);
      //   break;
      // case 'Disclaimer':
      //   Get.toNamed(Routes.ADDITIONAL_INFO, arguments: 'Disclaimer');
      //   break;
      default:
        // Get.toNamed(Routes.ADDITIONAL_INFO, arguments: 'Privacy Policy');
        AppSnack.warningSnack('default');
    }
  }

  Row _namedDivider(String title) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: const Color(0xffEDE8E8),
            indent: 10.w,
            endIndent: 10.w,
          ),
        ),
        ReusableText(
          title,
          size: 12,
          family: 'ferdoka',
          color: const Color(0xffEDE8E8),
        ),
        Expanded(
          child: Divider(
            color: const Color(0xffEDE8E8),
            indent: 10.w,
            endIndent: 10.w,
          ),
        ),
      ],
    );
  }

  Widget _categoryButton(
    final String categoryName,
    final String selectedCategory,
    final Function(String) onCategorySelected,
  ) {
    final isSelected = categoryName == selectedCategory;

    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: MaterialButton(
        onPressed: () {
          Get.back();
          onCategorySelected(categoryName);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        height: 47.h,
        elevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        splashColor: Colors.transparent,
        color: isSelected ? const Color(0xFFffffff) : Colors.transparent,
        hoverColor: const Color(0xFF1d9279).withValues(alpha: .15),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          spacing: 15.w,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.black : Colors.white,
              ),
              padding: const EdgeInsets.all(8),
              child: ReusableText(
                categoryName[0].toUpperCase(),
                size: 12.r,
                color: isSelected ? Colors.white : Colors.black,
                family: 'ferdoka',
                weight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            ReusableText(
              categoryName,
              color: isSelected ? Colors.black : Colors.white,
              size: 16,
              family: 'ferdoka',
              weight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}
