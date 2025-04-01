import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_circular/app/widgets/custom_app_bar2.dart';

import '../../../widgets/auth_warning_dialogue.dart';
import '../controllers/data_deletion_controller.dart';

class DataDeletionView extends GetView<DataDeletionController> {
  const DataDeletionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      body: CustomScrollView(
        slivers: [
          CustomAppBar2(title: 'Data Deletion'),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: HtmlWidget('''
<p class="justify"">
    We respect your privacy and provide you with the option to request the deletion of your account and all associated data from our platform. If you wish to remove your personal information, including your name, email, uploaded notes, and any other stored data, please fill out the form below.
</p>

<h3 class="justify">Important Notes:</h3>
<ul class="justify">
    <li>Once your data is deleted, it cannot be recovered.</li>
    <li>Your uploaded notes and any related records will also be permanently removed.</li>
    <li>This process may take up to <strong>[mention time, e.g., 7 days]</strong> to complete.</li>
</ul>

<p class="justify">
    After submitting your request, our team will review and process it as soon as possible. If we need further verification, we may contact you via the provided email.
</p>
''', textStyle: TextStyle(fontSize: 16.5.sp),
                  customStylesBuilder: (element) {
                    if (element.classes.contains('justify')) {
                      return {
                        'text-align': 'justify',
                        'font-family': 'ferdoka',
                      };
                    }
                    return null;
                  },),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  spacing: 19.w,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        child: TextField(
                          minLines: 1,
                          maxLines: 5,
                          controller: controller.reason,
                          style: TextStyle(fontFamily: 'bn'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: CupertinoColors.systemGrey5,
                            hintStyle: TextStyle(fontFamily: 'bn'),
                            hintText: 'Why you want to delete the account?',
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controller.box.hasData('token')) {
                          controller.deleteAccount();
                        } else {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AuthWarningDialogue(
                                  title:
                                      'ডেটা মুছে ফেলার জন্য, অনুগ্রহ করে প্রথমে আপনার অ্যাকাউন্টে লগ ইন করুন।',
                                ),
                          );
                        }
                      },
                      child: Obx(() {
                        if (controller.isLoading.value) {
                          return CupertinoActivityIndicator();
                        }
                        return Icon(
                          Icons.send_rounded,
                          color: const Color(0xFF1d9279),
                          size: 24.sp,
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Gap(20.h),
            ]),
          ),
        ],
      ),
    );
  }
}
