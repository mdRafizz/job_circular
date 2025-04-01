import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_circular/app/widgets/custom_app_bar2.dart';

import '../../../widgets/reusable_text.dart';
import '../../../widgets/user_info_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      body: CustomScrollView(
        slivers: [
          CustomAppBar2(title: 'Register'),
          SliverList(
            delegate: SliverChildListDelegate([
              Gap(35.h),
              Padding(
                padding: EdgeInsets.only(right: 20.w, left: 10.w),
                child: SizedBox(
                  height: 652.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 620.h,
                          width: MediaQuery.sizeOf(context).width,
                          margin: EdgeInsets.only(left: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(4, 4),
                                color: Colors.grey.shade300,
                                blurRadius: 15,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                offset: Offset(-4, -4),
                                color: const Color(0xfff8f9fa),
                                blurRadius: 15,
                                spreadRadius: 1,
                              ),
                            ],
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.shade200,
                                Colors.grey.shade300,
                                Colors.grey.shade400,
                                // Colors.grey.shade500,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(25.h),
                                UserInfoField(
                                  title: 'Name',
                                  controller: controller.name,
                                  hintText: 'Your name',
                                  prefixIcon: Icons.person_rounded,
                                  keyboardType: TextInputType.name,
                                  iconSize: 19,
                                ),
                                Gap(35.h),
                                UserInfoField(
                                  title: 'Email',
                                  controller: controller.email,
                                  hintText: 'Your email',
                                  prefixIcon: Icons.email_rounded,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                Gap(35.h),
                                Obx(() {
                                  return UserInfoField(
                                    title: 'Password',
                                    obscureText: controller.obscureText.value,
                                    maxLines: 1,
                                    controller: controller.password,
                                    hintText: 'Your password',
                                    prefixIcon: Icons.lock_rounded,
                                    keyboardType: TextInputType.visiblePassword,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        controller.obscureText.value =
                                        !controller.obscureText.value;
                                      },
                                      child: Icon(
                                        controller.obscureText.value ?
                                        Icons.visibility_rounded :
                                        Icons.visibility_off_rounded,
                                        size: 17,
                                      ),
                                    ),
                                  );
                                }),
                                Gap(35.h),
                                UserInfoField(
                                  title: 'Confirm Password',
                                  obscureText: controller.cObscureText.value,
                                  maxLines: 1,
                                  controller: controller.confirmPassword,
                                  hintText: 'Retype password',
                                  prefixIcon: Icons.lock_outline_rounded,
                                  keyboardType: TextInputType.visiblePassword,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      controller.cObscureText.value =
                                      !controller.cObscureText.value;
                                    },
                                    child: Icon(
                                      controller.obscureText.value ?
                                      Icons.visibility_rounded :
                                      Icons.visibility_off_rounded,
                                      size: 17,
                                    ),
                                  ),
                                ),
                                Gap(35.h),
                                Align(
                                  alignment: Alignment.center,
                                  child: CupertinoButton(
                                    onPressed: () {
                                      controller.register();
                                    },
                                    sizeStyle: CupertinoButtonSize.large,
                                    color: const Color(0xFF1d9279),
                                    child: Obx(
                                      () =>
                                          controller.isLoading.value
                                              ? const CupertinoActivityIndicator(
                                                color: Colors.white,
                                              )
                                              : const ReusableText(
                                                'Register',
                                                size: 15.5,
                                                family: 'ferdoka',
                                                color: Colors.white,
                                                weight: FontWeight.normal,
                                              ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              colors: [Color(0xff1f4037), Color(0xff99f2c8)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.srcIn,
                          child: SvgPicture.asset(
                            'assets/images/svg/subscription-user.svg',
                            width: 67.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
