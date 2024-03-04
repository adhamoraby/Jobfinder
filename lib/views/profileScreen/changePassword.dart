import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/widgets/primaryButton.dart';
import 'login and security.dart';


class changepass extends StatefulWidget {
  const changepass({super.key});

  @override
  State<changepass> createState() => _changepassState();

}

class _changepassState extends State<changepass> {
  bool SeePassword=false;
  bool SeePassword2=false;
  bool SeePassword3=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(right: 24.w,left: 24.w),
          child: Column(
            children: [
              Container(
                width: 327.w,
                height: 24.h,
                child: Row(
                  children: [
                    GestureDetector(

                        child: Icon(Icons.arrow_back,size: 24,),
                        onTap: () {
                          Navigator.pop(context);
                        }

                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 59.5.w,right: 83.5.w),
                      child: Text("Change Password",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),),
                    ),

                  ],
                ),

              ),
              Padding(
                padding:  EdgeInsets.only(top: 44.h),
                child: Container(
                  width: 327.w,
                  height: 360.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter your old password",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                        ),

                      ),

                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: SeePassword,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    hintText: ' password',
                                    prefixIcon: Icon(CupertinoIcons.lock),
                                    suffixIcon: GestureDetector(
                                        child: SeePassword ? Icon(CupertinoIcons.eye_slash_fill) : Icon(CupertinoIcons.eye),
                                      onTap: (){
                                          setState(() {
                                            SeePassword = !SeePassword;
                                            print(SeePassword);
                                          });

                                      },

                                    ),

                                  ),

                                ),




                            ],
                          ),
                        ),
                      Padding(
                        padding:  EdgeInsets.only(top: 20.h),
                        child: Container(
                          width: 327.w,
                          height: 100.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Enter your new password",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                ),

                              ),

                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: SeePassword2,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  hintText: ' password',
                                  prefixIcon: Icon(CupertinoIcons.lock),
                                  suffixIcon: GestureDetector(
                                    child: SeePassword2 ? Icon(CupertinoIcons.eye_slash_fill) : Icon(CupertinoIcons.eye),
                                    onTap: (){
                                      setState(() {
                                        SeePassword2= !SeePassword2;
                                        print(SeePassword2);
                                      });

                                    },

                                  ),

                                ),

                              ),
                            ],
                          )
                        ),
                      ),
                      Container(
                          width: 327.w,
                          height: 100.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Confirm your new password",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                ),

                              ),

                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: SeePassword3,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  hintText: ' password',
                                  prefixIcon: Icon(CupertinoIcons.lock),
                                  suffixIcon: GestureDetector(
                                    child: SeePassword3 ? Icon(CupertinoIcons.eye_slash_fill) : Icon(CupertinoIcons.eye),
                                    onTap: (){
                                      setState(() {
                                        SeePassword3= !SeePassword3;
                                        print(SeePassword3);
                                      });

                                    },

                                  ),

                                ),

                              ),
                            ],
                          )
                      ),




                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 250.h),
                child: PrimaryButton(
                    title: 'Save',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const loginandsecurity()));
                    }),
              ),



            ],
          ),
        ),
      ),

    );
  }
}
