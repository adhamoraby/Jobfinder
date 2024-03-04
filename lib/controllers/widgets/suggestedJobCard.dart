import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:amitproject/controllers/widgets/components/zoomLogo.dart';
import 'package:amitproject/views/jobDetails/jobDetails.dart';

class SuggestedJobCard extends StatelessWidget {
  const SuggestedJobCard({Key? key,required this.jobName,required this.img,required this.jobTime,required this.jobType,required this.salary,required this.compEmail,required this.compInfo,required this.compName,required this.compWeb,required this.jobDesc,required this.jobLvl,required this.jobSkill}) : super(key: key);
  final String jobName;
  final String img;
  final String jobTime;
  final String jobType;
  final String salary;
  final String compEmail;
  final String compInfo;
  final String compName;
  final String compWeb;
  final String jobDesc;
  final String jobLvl;
  final String jobSkill;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  JobDetails(
              jobName: jobName,
              jobTime: jobTime,
              jobType: jobType,
              compEmail: compEmail,
              compInfo: compInfo,
              compName: compName,
              compWeb: compWeb,
              jobDesc: jobDesc,
              jobImg: img,
              jobLvl: jobLvl,
              jobSkill: jobSkill,

            )));
      },
      child: Container(
        height: 183.h,
        width: 320.w,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(9, 26, 122, 1),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Padding(
                  padding:  EdgeInsets.only(left: 16.w,top: 18.h),
                  child: Image.network(
                      img,
                    width: 32.w,
                    height: 32.h,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 18.h, left: 16.w),
                      child:  Text(
                        jobName,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Test Engineers • Egypt",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.w, top: 28.5.h,left: 100.w),
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: SvgPicture.asset(
                      'assets/Icons/savedWhite.svg',
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                  ),
                  child: Container(
                    width: 87.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.14),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child:  Center(
                      child: Text(
                        jobTime,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 6.5.w, left: 6.5.w),
                  child: Container(
                    width: 87.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.14),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child:  Center(
                      child: Text(
                        jobType,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child:  Text(
                    "\$$salary",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.h, right: 60.w),
                  child: const Text(
                    "/Month",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 16.w,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 96.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(51, 102, 255, 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.r))),
                      child: const Center(
                          child: Text('Apply',
                              style: TextStyle(color: Colors.white))),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
