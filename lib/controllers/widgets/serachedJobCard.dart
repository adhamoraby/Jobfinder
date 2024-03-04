import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:amitproject/controllers/widgets/components/spectrumLogo.dart';
import 'package:amitproject/controllers/widgets/components/twitterLogo.dart';

class SearchedJobCard extends StatelessWidget {
  final String img;
  const SearchedJobCard({Key? key,required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 103.h,
      width: 327.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               img=="Twitter"?TwitterIcon(
                backGroundWidth: 32,
                backGroundHeight: 40,
                birdHeight: 23,
                birdWidth: 28,
              ):img=="Spectrum"?SpectrumIcon(
                 backGroundWidth: 32,
                 backGroundHeight: 40,
                 birdHeight: 23,
                 birdWidth: 28,
               ):Container(),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 95.w),
                child: Column(
                  children: [
                    const Text(
                      "Senior UI Designer",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    const Text(
                      "Twitter • Jakarta, Indonesia ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  // right: 24.w,
                  top: 10.5.h,
                ),
                child: SvgPicture.asset(
                  'assets/Icons/savedBlue.svg',
                  height: 24.h,
                  width: 24.w,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 73.w,
                height: 26.h,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(214, 228, 255, 1),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Center(
                  child: Text(
                    "Fulltime",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(51, 102, 255, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 6.5.w, left: 6.5.w),
                child: Container(
                  width: 73.w,
                  height: 26.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(214, 228, 255, 1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Text(
                      "Remote",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(51, 102, 255, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 110),
                child: const Text(
                  "\$15K",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(46, 142, 24, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
              ),
              const Text(
                "/Month",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF Pro Display',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
