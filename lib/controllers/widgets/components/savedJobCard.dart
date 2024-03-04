import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:amitproject/controllers/widgets/components/savedJobPopUpCard.dart';
import 'package:amitproject/controllers/widgets/components/twitterLogo.dart';

class SavedJobCard extends StatelessWidget {
  const SavedJobCard({Key? key}) : super(key: key);

  void _jobDetailsApplyingBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return const SavedJobPopUpCard();
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _jobDetailsApplyingBottomSheet(context);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: SizedBox(
          height: 79.h,
          width: 327.w,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TwitterIcon(
                    backGroundWidth: 40,
                    backGroundHeight: 40,
                    birdHeight: 23,
                    birdWidth: 28,
                  ),
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
                      'assets/Icons/more.svg',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Posted 2 days ago",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(55, 65, 81, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 6.0.w),
                        child: SvgPicture.asset(
                          'assets/Icons/clock.svg',
                          height: 12.h,
                          width: 12.w,
                        ),
                      ),
                      const Text(
                        "Be an early applicant",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(55, 65, 81, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
