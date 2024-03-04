import 'package:amitproject/views/onBoardingScreen/onBoardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:amitproject/controllers/cubits/ApplyJobCubit/ApplyCubit.dart';
import 'package:amitproject/controllers/cubits/AuthCubit/cubit.dart';
import 'package:amitproject/theme.dart';
import 'package:amitproject/views/appliedScreen/appliedScreen.dart';
import 'package:amitproject/views/completeProfile/completeProfile.dart';
import 'package:amitproject/views/completeProfile/education.dart';
import 'package:amitproject/views/completeProfile/experience.dart';
import 'package:amitproject/views/homeScreen/homeScreen.dart';
import 'package:amitproject/views/jobDetails/jobDetails.dart';
import 'package:amitproject/views/messageScreen/messageScreen.dart';
import 'package:amitproject/views/profileScreen/Email.dart';
import 'package:amitproject/views/profileScreen/Notification.dart';
import 'package:amitproject/views/profileScreen/TwoStepVerification.dart';
import 'package:amitproject/views/profileScreen/changePassword.dart';
import 'package:amitproject/views/profileScreen/editProfile.dart';
import 'package:amitproject/views/profileScreen/frthTwoStepVerr.dart';
import 'package:amitproject/views/profileScreen/language.dart';
import 'package:amitproject/views/profileScreen/login%20and%20security.dart';
import 'package:amitproject/views/profileScreen/phoneNumScreen.dart';
import 'package:amitproject/views/profileScreen/portfolio.dart';
import 'package:amitproject/views/profileScreen/profileScreen.dart';
import 'package:amitproject/views/profileScreen/thrdTwoStepVerification.dart';
import 'package:amitproject/views/profileScreen/twoStepVer.dart';
import 'package:amitproject/views/savedScreen/savedScreen.dart';
import 'package:amitproject/views/signInScreen/signInScreen.dart';
import 'package:amitproject/views/signUpScreen/signUpScreen.dart';
import 'package:amitproject/views/splashScreen/splashScreen.dart';
import 'controllers/widgets/bottomNavigationBar.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    ScreenUtil.ensureScreenSize(),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit()..GettingUserData(),
          ),
          BlocProvider(
            create: (context) => ApplyCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'JobFinder',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          home: const OnBoarding(),
        ),
      ),
    );
  }
}
