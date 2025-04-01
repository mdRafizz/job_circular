import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:job_circular/app/widgets/custom_app_bar2.dart';

import '../../../widgets/reusable_text.dart';
import '../../../widgets/user_info_field.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      body: CustomScrollView(
        slivers: [
          CustomAppBar2(title: 'Contact Us'),
          SliverList(delegate: SliverChildListDelegate([
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
              child: ReusableText(
                  '''We value your feedback and are here to assist you with any questions, concerns, or support you may need regarding our website. Whether you need help with job circulars, exam schedules, results, uploading or downloading notes, or have any other inquiries, feel free to reach out to us.
                  
Additionally, if you wish to request the deletion of your account and associated data, you can submit a request using this form.
                  
Please fill out the form below with your details, and our support team will get back to you as soon as possible.'''),),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30.h,
              children: [
                UserInfoField(
                  controller: controller.name,
                  hintText: 'Your name',
                  prefixIcon: Icons.person_rounded,
                  keyboardType: TextInputType.name,
                  iconSize: 19,
                  filledColor: CupertinoColors.systemGrey5,
                ),
                UserInfoField(
                  controller: controller.email,
                  hintText: 'Your email',
                  prefixIcon: Icons.email_rounded,
                  keyboardType:
                  TextInputType.emailAddress,
                  filledColor: CupertinoColors.systemGrey5,
                ),
                UserInfoField(
                  controller: controller.subject,
                  hintText: 'Enter the subject',
                  prefixIcon: Icons.subject_rounded,
                  keyboardType:
                  TextInputType.text,
                  filledColor: CupertinoColors.systemGrey5,
                ),
                UserInfoField(
                  controller: controller.message,
                  hintText: 'Enter your message here',
                  prefixIcon: Icons.message_rounded,
                  keyboardType:
                  TextInputType.text,
                  filledColor: CupertinoColors.systemGrey5,
                ),
                CupertinoButton(
                  onPressed: () {
                    controller.contactUs();
                  },
                  color: const Color(0xFF1d9279),
                  sizeStyle: CupertinoButtonSize.large,
                  child: Obx(
                        () => controller.isLoading.value
                        ? CupertinoActivityIndicator(
                      color: Colors.white,
                    )
                        : Row(
                      mainAxisSize:
                      MainAxisSize.min,
                      children: [
                        Gap(10.h),
                        ReusableText(
                          'Send Mail',
                          size: 15.5,
                          family: 'ferdoka',
                          color: Colors.white,
                          weight: FontWeight.normal,
                        ),
                        Gap(10.h),
                        Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 19.sp,
                        ),
                        Gap(10.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),),
            Gap(30.h),
          ]))
        ],
      ),
    );
  }
}
