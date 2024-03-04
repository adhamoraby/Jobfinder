import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amitproject/controllers/widgets/components/savedJobCard.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.h, left: 24.w, bottom: 20.h),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/Icons/arrow-left.svg',
                      height: 24.h,
                      width: 24.w,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 16.h, left: 112.w, bottom: 20.h),
                      child: const Text(
                        "Saved",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 36.h,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(244, 244, 245, 1),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(
                      229,
                      231,
                      235,
                      1,
                    ),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "12 Job Saved",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(107, 114, 128, 1),
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              const SavedJobCard(),
              const Divider(),
              const SavedJobCard(),
              const Divider(),
              const SavedJobCard(),
              const Divider(),
              const SavedJobCard(),
              const Divider(),
              const SavedJobCard(),
              const Divider(),
              const SavedJobCard(),
              const Divider(),
              const SavedJobCard(),
            ],
          ),
        ),
      ),
    );
  }
}
