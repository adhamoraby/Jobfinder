import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../controllers/constants/constants.dart';
import '../../controllers/widgets/primaryButton.dart';
import '../uploadOfWork/uploadOfWork.dart';
class Portfolio extends StatefulWidget {
  const Portfolio({super.key});


  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  PlatformFile? pdfFile;

  void uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        pdfFile = result.files.first;
      });
    } else {
      // User canceled the picker
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: 24.w,right: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 60.h),
              child: Container(
                width: 327.w,
                height: 24.h,
                child: Row(
                  children: [
                    Icon(Icons.arrow_back,size: 24,),
                    Padding(
                      padding:  EdgeInsets.only(left: 102.w),
                      child: Text("Portfolio",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36),
              child: Text("Add portfolio here"),
            ),
            SizedBox(height: 16,),
            GestureDetector(
              onTap: () {
                uploadFile();
              },
              child: SizedBox(
                height: 250.h,
                width: double.infinity,
                child: CustomPaint(
                  painter: DashedBorderPainter(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: const Color.fromRGBO(236, 242, 255, 1),
                      border: Border.all(
                        width: 1,
                        style: BorderStyle.none,
                        color: const Color.fromRGBO(102, 144, 255, 1),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 16.0.h),
                            child: Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(
                                    214, 228, 255, 1),
                                borderRadius: BorderRadius.circular(1000),
                              ),
                              child: SvgPicture.asset(
                                JobFinderConstants.fileLogo,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          const Text(
                            "Upload your other file",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "SF Pro Display",
                                color: Color.fromRGBO(17, 24, 39, 1)),
                          ),
                          SizedBox(height: 8.h),
                          const Text(
                            "Max. file size 10 MB",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "SF Pro Display",
                                color: Color.fromRGBO(107, 114, 128, 1)),
                          ),
                          SizedBox(height: 24.h),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 16.0.w, right: 16.w),
                            child: GestureDetector(
                              onTap: () {
                                uploadFile();
                              },
                              child: Container(
                                width: double.infinity,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(
                                      214, 228, 255, 1),
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          51, 102, 255, 1)),
                                  borderRadius:
                                  BorderRadius.circular(1000),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          JobFinderConstants.uploadLogo),
                                      SizedBox(width: 10.w),
                                      const Text(
                                        "Add file",
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                              51, 102, 255, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "SF Pro Display",
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 26.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 13,),
            Container(
              width: 327,
              height: 254,
             child: Column(
               children: [
                 Padding(
                    padding: EdgeInsets.only(
                        left: 16.w, top: 16, bottom: 16, right: 16.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(JobFinderConstants.pdfIcon),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 140.w,
                              child: Text(
                                pdfFile == null
                                    ? "UI/UX Designer"
                                    : pdfFile!.name.toString(),
                                maxLines:
                                1, // Set the maximum number of lines
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(17, 24, 39, 1)),
                              ),
                            ),
                            SizedBox(height: 7.h),
                            const Text(
                              "CV.pdf 300KB",
                              style: TextStyle(
                                  fontFamily: "SF Pro Display",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(107, 114, 128, 1)),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child:
                          SvgPicture.asset(JobFinderConstants.editIcon),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child:
                          SvgPicture.asset(JobFinderConstants.exitIcon),
                        ),
                      ],
                    ),
                  ),
                 Padding(
                   padding: EdgeInsets.only(
                       left: 16.w, top: 16, bottom: 16, right: 16.w),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       SvgPicture.asset(JobFinderConstants.pdfIcon),
                       SizedBox(
                         width: 8.w,
                       ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(
                             width: 140.w,
                             child: Text(
                               pdfFile == null
                                   ? "3D Designer"
                                   : pdfFile!.name.toString(),
                               maxLines:
                               1, // Set the maximum number of lines
                               overflow: TextOverflow.ellipsis,
                               style: const TextStyle(
                                   fontFamily: "SF Pro Display",
                                   fontSize: 14,
                                   fontWeight: FontWeight.w500,
                                   color: Color.fromRGBO(17, 24, 39, 1)),
                             ),
                           ),
                           SizedBox(height: 7.h),
                           const Text(
                             "CV.pdf 300KB",
                             style: TextStyle(
                                 fontFamily: "SF Pro Display",
                                 fontSize: 12,
                                 fontWeight: FontWeight.w400,
                                 color: Color.fromRGBO(107, 114, 128, 1)),
                           ),
                         ],
                       ),
                       const Spacer(),
                       Padding(
                         padding: const EdgeInsets.only(top: 8.0),
                         child:
                         SvgPicture.asset(JobFinderConstants.editIcon),
                       ),
                       SizedBox(
                         width: 8.w,
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 8.0),
                         child:
                         SvgPicture.asset(JobFinderConstants.exitIcon),
                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(
                       left: 16.w, top: 16, bottom: 16, right: 16.w),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       SvgPicture.asset(JobFinderConstants.pdfIcon),
                       SizedBox(
                         width: 8.w,
                       ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(
                             width: 140.w,
                             child: Text(
                               pdfFile == null
                                   ? "Graphik Designer"
                                   : pdfFile!.name.toString(),
                               maxLines:
                               1, // Set the maximum number of lines
                               overflow: TextOverflow.ellipsis,
                               style: const TextStyle(
                                   fontFamily: "SF Pro Display",
                                   fontSize: 14,
                                   fontWeight: FontWeight.w500,
                                   color: Color.fromRGBO(17, 24, 39, 1)),
                             ),
                           ),
                           SizedBox(height: 7.h),
                           const Text(
                             "CV.pdf 300KB",
                             style: TextStyle(
                                 fontFamily: "SF Pro Display",
                                 fontSize: 12,
                                 fontWeight: FontWeight.w400,
                                 color: Color.fromRGBO(107, 114, 128, 1)),
                           ),
                         ],
                       ),
                       const Spacer(),
                       Padding(
                         padding: const EdgeInsets.only(top: 8.0),
                         child:
                         SvgPicture.asset(JobFinderConstants.editIcon),
                       ),
                       SizedBox(
                         width: 8.w,
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 8.0),
                         child:
                         SvgPicture.asset(JobFinderConstants.exitIcon),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
            ),

          ],
        ),
      ),
    );
  }
}