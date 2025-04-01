import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:job_circular/app/data/model/notes.dart';
import 'package:job_circular/app/routes/app_pages.dart';

import '../../../widgets/reusable_text.dart';

class NoteTile extends StatelessWidget {
  final Notes note;

  const NoteTile({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.NOTE_DETAILS,
          arguments: {'id': note.id.toString(), 'slug': note.slug},
        );
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.h),
        child: Material(
          elevation: 1,
          shadowColor: Colors.grey.withValues(alpha: .05),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  note.title ?? "No Title",
                  maxLines: 1,
                  weight: FontWeight.w600,
                  size: 16,
                ),
                SizedBox(height: 10.h),
                ReusableText(
                  _parseHtmlString(note.description ?? ""),
                  size: 14,
                  weight: FontWeight.normal,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.h),
                RichText(
                  text: TextSpan(
                    text: "Uploader: ",
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'ferdoka',
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                    ),
                    children: [
                      TextSpan(
                        text: note.user!.name.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: "Published: ",
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'ferdoka',
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
                          children: [
                            TextSpan(
                              text: _formatDate(note.createdAt),
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: RichText(
                        text: TextSpan(
                          text: '👁   ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: note.totalViewed.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'ferdoka',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _parseHtmlString(String htmlString) {
    return parse(htmlString).documentElement?.text ?? "";
  }

  String _formatDate(DateTime? date) {
    return date != null ? DateFormat('MMMM d, y').format(date) : 'N/A';
  }
}
