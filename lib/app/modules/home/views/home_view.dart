import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_circular/app/modules/home/controllers/home_controller.dart';
import 'package:job_circular/app/modules/home/views/bookmark_view.dart';
import 'package:job_circular/app/modules/home/views/circular_view.dart';
import 'package:job_circular/app/modules/home/views/results_view.dart';
import 'package:job_circular/app/modules/home/views/shortcut_view.dart';
import 'package:job_circular/app/modules/home/widgets/drawer_content.dart';
import 'package:job_circular/app/modules/home/widgets/exit_dialogue.dart';
import 'package:job_circular/app/widgets/app_icons.dart';

import '../../notes/views/notes_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          return;
        } else if (controller.tabController.index != 0) {
          controller.tabController.animateTo(0);
        } else {
          showDialog(context: context, builder: (_) => const ExitDialog());
        }
      },
      child: Scaffold(
        // key: controller.scaffoldKey,
        drawer: Drawer(backgroundColor: Colors.white, child: DrawerContent()),
        backgroundColor: const Color(0xfff4f4f4),
        body: TabBarView(
          controller: controller.tabController,
          children: const [
            ShortcutView(),
            CircularView(),
            ResultsView(),
            BookmarkView(),
          ],
        ),
        bottomNavigationBar: Container(
          alignment: AlignmentDirectional.center,
          height: 52.h,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: TabBar(
            controller: controller.tabController,
            dividerColor: Colors.transparent,
            dividerHeight: 0,
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: const Color(0xff128d70),
            indicator: const BoxDecoration(color: Colors.transparent),
            tabs: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .4,
                child: Icon(AppIcon.home, size: 26.5.sp),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .4,
                child: Icon(AppIcon.job, size: 20.1.sp),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .4,
                child: Icon(AppIcon.result, size: 20.sp),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .4,
                child: Icon(AppIcon.bookmark, size: 19.1.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
