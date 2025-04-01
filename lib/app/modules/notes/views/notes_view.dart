import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_circular/app/modules/notes/widgets/note_tile.dart';
import 'package:job_circular/app/modules/notes/widgets/notes_drawer_content.dart';
import 'package:job_circular/app/widgets/custom_app_bar.dart';
import 'package:job_circular/app/widgets/reusable_text.dart';

import '../controllers/notes_controller.dart';

class NotesView extends GetView<NotesController> {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: const Color(0xfff4f4f4),
      drawer: NotesDrawerContent(),
      // body: CustomScrollView(
      //   slivers: [
      //     CustomAppBar2(
      //       title: 'Notes',
      //       leading: GestureDetector(
      //         onTap: () {
      //           controller.scaffoldKey.currentState!.openDrawer();
      //         },
      //         child: Row(
      //           children: [
      //             Gap(21.w),
      //             SvgPicture.asset(
      //               'assets/images/svg/menu.svg',
      //               height: 18.h,
      //               colorFilter: ColorFilter.mode(
      //                 Colors.black,
      //                 BlendMode.srcIn,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     SliverToBoxAdapter(child: Gap(20.h)),
      //     Obx(() {
      //       if (controller.isLoading.value) {
      //         return SliverFillRemaining(
      //           child: Center(
      //             child: CircularProgressIndicator(
      //               valueColor: AlwaysStoppedAnimation<Color>(
      //                 Color(0xFF1d9279),
      //               ),
      //               backgroundColor: const Color(
      //                 0xFF1d9279,
      //               ).withValues(alpha: .2),
      //               strokeWidth: 6.5,
      //               strokeAlign: 2.5,
      //               strokeCap: StrokeCap.round,
      //             ),
      //           ),
      //         );
      //       }
      //       if (!controller.isLoading.value &&
      //           controller.notes.isEmpty &&
      //           controller.errorMessage.value != '') {
      //         return SliverFillRemaining(
      //           child: Center(
      //             child: Padding(
      //               padding: EdgeInsets.symmetric(horizontal: 20.w),
      //               child: ReusableText(
      //                 controller.errorMessage.value,
      //                 size: 15,
      //               ),
      //             ),
      //           ),
      //         );
      //       }
      //       return SliverList(
      //         delegate: SliverChildBuilderDelegate(
      //           (context, i) {
      //             var note =
      //                 controller.filterCirculars(
      //                   controller.selectedCategory.value,
      //                 )[i];
      //             return NoteTile(note: note);
      //           },
      //           childCount:
      //               controller
      //                   .filterCirculars(controller.selectedCategory.value)
      //                   .length,
      //         ),
      //       );
      //     }),
      //   ],
      // ),
      body: Column(
        children: [
          CustomAppBar(
            title: 'Notes',
            showBackButton: true,
            trailing: Expanded(
              child: GestureDetector(
                onTap: (){
                  controller.scaffoldKey.currentState!.openDrawer();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 20.w,left: 30.w),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Icon(Icons.widgets_rounded, color: Colors.white,size: 20.sp,),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
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
              }
              if (!controller.isLoading.value &&
                  controller.notes.isEmpty &&
                  controller.errorMessage.value != '') {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ReusableText(
                      controller.errorMessage.value,
                      size: 15,
                    ),
                  ),
                );
              }

              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Gap(12.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.selectedCategory('All');
                            },
                            child: Obx(() {
                              final isSelected =
                                  controller.selectedCategory.value == 'All';
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 555),
                                curve: Curves.easeInOut,
                                // curve যোগ করা হয়েছে
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.r),
                                  ),
                                  color:
                                      !isSelected
                                          ? Colors.grey.shade300
                                          : Color(0xff128d70),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.w,
                                  vertical: 5.5.h,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 6.w),
                                child: ReusableText(
                                  'All',
                                  size: 14,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                ),
                              );
                            }),
                          ),
                          ...List.generate(controller.categories.length, (i) {
                            return GestureDetector(
                              onTap: () {
                                controller.selectedCategory(
                                  controller.categories[i].name.toString(),
                                );
                              },
                              child: Obx(() {
                                final isSelected =
                                    controller.selectedCategory.value ==
                                    controller.categories[i].name;
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 555),
                                  curve: Curves.easeInOut,
                                  // curve যোগ করা হয়েছে
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.r),
                                    ),
                                    color:
                                        !isSelected
                                            ? Colors.grey.shade300
                                            : Color(0xff128d70),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 5.5.h,
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                                  child: ReusableText(
                                    controller.categories[i].name.toString(),
                                    size: 14,
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                );
                              }),
                            );
                          }),
                        ],
                      ),
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 20.w, top: 12.h),
                      itemBuilder: (context, i) {
                        var note =
                            controller.filterCirculars(
                              controller.selectedCategory.value,
                            )[i];
                        return NoteTile(note: note);
                      },
                      itemCount:
                          controller
                              .filterCirculars(
                                controller.selectedCategory.value,
                              )
                              .length,
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
