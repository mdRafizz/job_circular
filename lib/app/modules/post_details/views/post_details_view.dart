import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../widgets/app_loader.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/reusable_text.dart';
import '../controllers/post_details_controller.dart';

class PostDetailsView extends GetView<PostDetailsController> {
  const PostDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      body: Column(
        children: [
          CustomAppBar(title: Get.arguments['title'],showBackButton: true,),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Obx(
                  () =>
                      controller.isLoading.value
                          ? SizedBox(
                            height: MediaQuery.of(context).size.height * .5,
                            child: AppLoader.defaultLoader(context),
                          )
                          : _mainContent(_buildHtmlContent(), context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _mainContent(String htmlContent, BuildContext context) => Container(
    margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
    child: Column(
      spacing: 30.h,
      children: [HtmlWidget(htmlContent), _buildPdf(context), _download()],
    ),
  );

  String _buildHtmlContent() => '''
  <div style="font-family: ferdoka bn;">
    <h2 style="font-size: 16px; font-weight: bold;">
      ${controller.post.value!.title}
    </h2>
    ${controller.post.value!.description}
    
    ${controller.post.value!.type == 1 ? '''
        <p style="font-size: 12px; font-family: 'ferdoka'; font-weight: 600; color: green;">
          Application Starts: 
          <span style="color: black;">
            ${DateFormat('MMMM d, y').format(controller.post.value!.startingDate!)}
          </span>
        </p>
        <p style="font-size: 12px; font-family: 'ferdoka'; font-weight: 600; color: red;">
          Deadline: 
          <span style="color: black;">
            ${DateFormat('MMMM d, y').format(controller.post.value!.endingDate!)}
          </span>
        </p>
        <div style="height: 12px;"></div>
      ''' : '''
        <p style="font-size: 12px; font-family: 'ferdoka'; font-weight: 600; color: blue;">
          Published: 
          <span style="color: black;">
            ${DateFormat('MMMM d, y').format(controller.post.value!.publishDate!)}
          </span>
        </p>
        <div style="height: 12px;"></div>
      '''}
  </div>
''';

  CupertinoButton _download() {
    return CupertinoButton(
      onPressed: () {},
      color: const Color(0xFF1d9279),
      sizeStyle: CupertinoButtonSize.medium,
      child: ReusableText('  Download  ', size: 15, color: Colors.white),
    );
  }

  Material _buildPdf(BuildContext context) => Material(
    borderRadius: BorderRadius.circular(12),
    color: Colors.white,
    elevation: 8.2,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 590.h,
        child:
            controller.post.value!.document != null ||
                    controller.post.value!.convertedDocument != null
                ? _pdfViewer(context)
                : ReusableText('empty'),
      ),
    ),
  );

  Widget _pdfViewer(BuildContext context) =>
      controller.pdfUrl.value == ''
          ? AppLoader.defaultLoader(context)
          : SfPdfViewerTheme(
            data: SfPdfViewerThemeData(
              backgroundColor: Colors.white,
              progressBarColor: const Color(0xFF1d9279),
            ),
            child: SfPdfViewer.network(
              controller.pdfUrl.value,
              key: controller.pdfViewerKey,
              scrollDirection: PdfScrollDirection.horizontal,
            ),
          );
}
