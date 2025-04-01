import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:job_circular/app/widgets/app_loader.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/reusable_text.dart';
import '../controllers/note_details_controller.dart';

class NoteDetailsView extends GetView<NoteDetailsController> {
  const NoteDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      body: Column(
        children: [
          CustomAppBar(title: 'Note Details',showBackButton: true,),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return AppLoader.defaultLoader(context);
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 20.h,
                      ),
                      child: HtmlWidget(_buildHtmlContent()),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 20.h,
                      ),
                      child: _buildPdf(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 20.h,
                      ),
                      child: _downloadButton(),
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

  String _buildHtmlContent() => '''
    <div style="font-family: 'ferdoka' 'bn';">
      <h2 style="font-size: 16px; font-weight: bold;">
        ${controller.note.value!.title}
      </h2>
      ${controller.note.value!.description}
      <p style="font-size: 12px; font-weight: 600; color: blue;">
        Published: <span style="color: black;">
          ${DateFormat('MMMM d, y').format(controller.note.value!.createdAt!)}
        </span>
      </p>
    </div>
  ''';

  Material _buildPdf() => Material(
    borderRadius: BorderRadius.circular(12),
    color: Colors.white,
    elevation: 8.2,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 680,
        child:
            controller.note.value!.document != null
                ? _pdfViewer()
                : ReusableText('empty'),
      ),
    ),
  );

  Widget _pdfViewer() => SfPdfViewerTheme(
    data: SfPdfViewerThemeData(
      backgroundColor: Colors.white,
      progressBarColor: const Color(0xFF1d9279),
    ),
    child: SfPdfViewer.network(
      "https://jobcircularlive.com/backend/api/note/direct/pdf/${Get.arguments['id']}",
      key: controller.pdfViewerKey,
      scrollDirection: PdfScrollDirection.horizontal,
    ),
  );

  CupertinoButton _downloadButton() {
    return CupertinoButton(
      onPressed: () => controller.downloadFile(Get.arguments['id'] ?? ''),
      color: const Color(0xFF1d9279),
      sizeStyle: CupertinoButtonSize.medium,
      child: ReusableText('  Download  ', size: 15, color: Colors.white),
    );
  }
}
