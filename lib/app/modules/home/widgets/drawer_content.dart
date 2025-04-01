import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_circular/app/modules/home/controllers/home_controller.dart';
import 'package:job_circular/app/widgets/app_snack.dart';
import 'package:job_circular/app/widgets/reusable_text.dart';

import '../../../routes/app_pages.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    final baseMenuItems = [
      ['About Us', 'assets/images/svg/info.svg'],
      ['Contact Us', 'assets/images/svg/at.svg'],
      ['Data Deletion', 'assets/images/svg/delete-document.svg'],
      ['Disclaimer', 'assets/images/svg/warning.svg'],
      ['Privacy Policy', 'assets/images/svg/shield.svg'],
    ];

    final menuItems = homeController.box.hasData('token')
            ? [
              ['Profile', 'assets/images/svg/profile.svg'],
              ['Logout', 'assets/images/svg/sign-out-alt.svg'],
            ]
            : [
              ['Login', 'assets/images/svg/login.svg'],
              ['Register', 'assets/images/svg/sign-up.svg'],
            ];

    return Column(
      children: [
        Container(
          height: 160.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: const Color(0xff128d70),
            image: const DecorationImage(
              image: AssetImage('assets/images/png/top_cover.png'),
              colorFilter: ColorFilter.mode(Color(0xff21836c), BlendMode.srcIn),
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
                color: CupertinoColors.white,
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
        Gap(30.h),
        ...List.generate(
          menuItems.length,
          (i) => GestureDetector(
            onTap: () {
              Get.back();
              _drawerActions(menuItems[i][0],homeController);
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
                    ),
                    Gap(15.w),
                    ReusableText(menuItems[i][0], size: 17.6,
                        weight: FontWeight.w600, family: 'ferdoka'),
                  ],
                ),
                Gap(30.h),
              ],
            ),
          ),
        ),

        if (homeController.categories.isNotEmpty) ...[
          // Gap(30.h),
          Divider(color: CupertinoColors.systemGrey3, height: 1.h),
          Gap(30.h),
          ...List.generate(
            homeController.categories.length,
            (i) => GestureDetector(
              onTap: () {
                Get.back();
                var filteredPosts = homeController.postLists.where((post) => post.category!.id == homeController.categories[i].id).toList();
                Get.toNamed(Routes.SHARED_POSTS,arguments: {
                  'title': homeController.categories[i].name.toString(),
                  'posts': filteredPosts
                });
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Gap(25.w),
                      CircleAvatar(
                        radius: 12.r,
                        backgroundColor: Colors.black,
                        child: Center(
                          child: ReusableText(
                            homeController.categories[i].name![0].toString(),
                            family: 'ferdoka',
                            size: 14.7,
                            weight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Gap(15.w),
                      ReusableText(
                        homeController.categories[i].name!,
                        size: 16.5,
                        weight: FontWeight.w600,
                        family: 'ferdoka',
                      ),
                    ],
                  ),
                  Gap(30.h),
                ],
              ),
            ),
          ),
        ],
        Divider(color: CupertinoColors.systemGrey3, height: 1.h),
        Gap(30.h),
        ...List.generate(
          baseMenuItems.length,
          (i) => GestureDetector(
            onTap: () {
              Get.back();
              _drawerActions(baseMenuItems[i][0],homeController);
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Gap(25.w),
                    SvgPicture.asset(
                      baseMenuItems[i][1],
                      height: 18.h,
                      width: 18.w,
                    ),
                    Gap(15.w),
                    ReusableText(
                      baseMenuItems[i][0],
                      size: 17.6,
                        weight: FontWeight.w600,
                      family: 'ferdoka',
                    ),
                  ],
                ),
                Gap(30.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _drawerActions(String title, HomeController controller) {
    switch (title) {
      // case 'Profile':
      //   Get.toNamed(Routes.PROFILE);
      //   break;
      case 'Data Deletion':
        Get.toNamed(Routes.DATA_DELETION);
        break;
      case 'Logout':
        controller.logout();
        break;
      case 'Login':
        Get.toNamed(Routes.LOGIN);
        break;
      case 'Register':
        Get.toNamed(Routes.REGISTER);
        break;
      case 'About Us':
        Get.toNamed(Routes.ADDITIONAL_INFO, arguments: 'About Us');
        break;
      case 'Contact Us':
        Get.toNamed(Routes.CONTACT_US);
        break;
      case 'Disclaimer':
        Get.toNamed(Routes.ADDITIONAL_INFO, arguments: 'Disclaimer');
        break;
      case 'Privacy Policy':
        Get.toNamed(Routes.ADDITIONAL_INFO, arguments: 'Privacy Policy');
        break;
      default:
        // Get.toNamed(Routes.ADDITIONAL_INFO, arguments: 'Privacy Policy');
        AppSnack.warningSnack('default');
    }
  }
}
