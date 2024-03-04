// ignore_for_file: non_constant_identifier_names
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amitproject/controllers/constants/constants.dart';
import 'package:amitproject/controllers/cubits/AuthCubit/States.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());
  static AuthCubit get(context) => BlocProvider.of(context);
  static TextEditingController password = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController nameController = TextEditingController();
  static TextEditingController Bio = TextEditingController();
  static TextEditingController Address = TextEditingController();
  static TextEditingController Mobile = TextEditingController();
  static TextEditingController Postion = TextEditingController();
  static TextEditingController TypeOfWork = TextEditingController();
  static TextEditingController CompName = TextEditingController();
  static TextEditingController Location = TextEditingController();
  static TextEditingController StartDate = TextEditingController();
  //--------------- Create Profile Methods-------------//
String? profName;
String? profBio;
String? profAddress;
String? profMobile;
String? profEmail;
String? userID;
String? compname;
String? lastmsg;
String? userMsg;
String? compMsg;
String? postapply;

String? test;
List <String> UserMsgList=[];
List <String> CompMsgList=[];
List<dynamic> suggestedJobs = [];
List <dynamic> allJobs=[];
  Future<void> CreateUser(
    context, {
    String? name,
    String? email,
    String? password,
  }) async {
    try {
      Response response = await Dio()
          .post("${JobFinderConstants.BaseUrl}/auth/register/", data: {
        "password": password,
        "email": email,
        "name": name,
      });

      // Check if the response contains a token
      if (response.data != null && response.data['token'] != null) {
        String token = response.data['token'];
        bool status = response.data['status'];
        int userId = response.data['data']['id'];

        String nameInResponse = response.data['data']['name'];
        profName=nameInResponse;
        profEmail=response.data['data']['email'];
        userID=response.data['data']['id'].toString();

        // Do something with the token, e.g., store it or use it for authentication
        print('Token: $token');
        print('name: $nameInResponse');

        SharedPreferences userSharedPreference =
            await SharedPreferences.getInstance();
        userSharedPreference.setInt('userId', userId);
        userSharedPreference.setString('token', token);
        userSharedPreference.setBool('status', status);
      } else {
        // Handle the case where the token is not present in the response
        print('Token not found in the response');
      }

      emit(RegisterSuccessfulState());
    } catch (error) {
      // Handle errors
      print(error);
    }
  }

  Future<void> loginUser(
    context, {
    String? email,
    String? password,
  }) async {
    try {
      Response response =
          await Dio().post("${JobFinderConstants.BaseUrl}/auth/login", data: {
        "email": email,
        "password": password,
      });

      String token = response.data['token'];
      bool status = response.data['status'];
      int userId = response.data['user']['id'];
      userID=userId.toString();

      SharedPreferences userSharedPreference =
          await SharedPreferences.getInstance();

      userSharedPreference.setInt('userId', userId);
      userSharedPreference.setString('token', token);
      userSharedPreference.setBool('status', status);

      print(response.data['status']);
      print(response.data['user']['email']);
      profEmail=response.data['user']['email'];
      profName=response.data['user']['name'];
      emit(LoginSuccessfulState());
    } catch (error) {
      // Handle errors
      print(error);
      emit(LoginFailedState());
    }
  }

  String? token;
  int? userId;
  bool? status;

  void GettingUserData() async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    token = userData.getString('token');
    status = userData.getBool('status');
    userId = userData.getInt('userId');
    emit(GettingUserDataSuccessfully());
  }


  Future<void> gettingNotification(
    context,
  ) async {

    try {
      Response response = await Dio().get(
        "${JobFinderConstants.BaseUrl}/notification/1",
      );

      String comp_name = response.data['data']['comp_name'];
      bool status = response.data['status'];

      print(comp_name);
      print(status);

      emit(GettingNotificationSuccess());
    } catch (error) {
      // Handle errors

      print(error);
      emit(GettingNotificationFailed());
    }
  }


  Future<void> suggestJob(
      context,
      ) async {
    // Trying to get the token from the storage
    try {
      SharedPreferences userData = await SharedPreferences.getInstance();
      token = userData.getString('token');
      print(token);
      emit(GettingTokenSuccessfully());
      // Getting token successfully, now getting all Jobs
      try {
        Response response = await Dio().get(
          "${JobFinderConstants.BaseUrl}/jobs/sugest/2",
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        Map<String,dynamic> data = response.data['data'];
        suggestedJobs=data.values.toList();
        bool status = response.data['status'];

         print(suggestedJobs);
         print(status);



        emit(GettingSugesstedJobSuccessfully());
      } catch (error) {
        // Handle errors
        print('Error is not in the token');
        print(error);
        emit(GettingSugesstedJobFail());
      }
    } catch (error) {
      print('Getting token failed');
      print(error);
      emit(GettingSugesstedJobFail());
    }
  }

  Future<void> changeName(
      context,{
      String? name
      }
      ) async {
    // Trying to get the token from the storage
    try {
      SharedPreferences userData = await SharedPreferences.getInstance();
      token = userData.getString('token');
      print(token);
      emit(GettingTokenSuccessfully());
      // Getting token successfully, now getting all Jobs
      try {
        Response response = await Dio().post(
          "${JobFinderConstants.BaseUrl}/auth/user/update",data: {
            "name": name
        },
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        bool status = response.data['status'];
        String updatedName=response.data['data']['name'];
        profName=updatedName;
        print(status);
        if(status){
          print("changed");
        }else{
          print("Not changed");
        }



        emit(GettingSugesstedJobSuccessfully());
      } catch (error) {
        // Handle errors
        print('Error is not in the token');
        print(error);
        emit(GettingSugesstedJobFail());
      }
    } catch (error) {
      print('Getting token failed');
      print(error);
      emit(GettingSugesstedJobFail());
    }
  }

  Future<void> profBioAddMob(
      context,{
        String? bio,
        String? add,
        String? mob
      }
      ) async {
    // Trying to get the token from the storage
    try {
      SharedPreferences userData = await SharedPreferences.getInstance();
      token = userData.getString('token');
      print(token);
      emit(GettingTokenSuccessfully());
      // Getting token successfully, now getting all Jobs
      try {
        Response response = await Dio().put(
          "${JobFinderConstants.BaseUrl}/user/profile/edit?bio=$bio&address=$add&mobile=$mob",
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        bool status = response.data['status'];
        profBio=response.data['data']['bio'];
        profAddress=response.data['data']['address'];
        profMobile=response.data['data']['mobile'];
        print(status);
        if(status){
          print("updated");
        }else{
          print("Not updated");
        }



        emit(GettingSugesstedJobSuccessfully());
      } catch (error) {
        // Handle errors
        print('Error is not in the token');
        print(error);
        emit(GettingSugesstedJobFail());
      }
    } catch (error) {
      print('Getting token failed');
      print(error);
      emit(GettingSugesstedJobFail());
    }
  }

  Future<void> addPortfolio(
      context,{
        File? cv,
        File? img
      }
      ) async {
    // Trying to get the token from the storage
    try {
      SharedPreferences userData = await SharedPreferences.getInstance();
      token = userData.getString('token');
      print(token);
      emit(GettingTokenSuccessfully());
      // Getting token successfully, now getting all Jobs
      try {
        Response response = await Dio().post(
          "${JobFinderConstants.BaseUrl}/user/profile/portofolios",data: {
          "cv_file": cv,
          "image": img,
        },
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        bool status = response.data['status'];
        print(status);
        if(status){
          print("uploaded");
        }else{
          print("Not uploaded");
        }



        emit(GettingSugesstedJobSuccessfully());
      } catch (error) {
        // Handle errors
        print('Error is not in the token');
        print(error);
        emit(GettingSugesstedJobFail());
      }
    } catch (error) {
      print('Getting token failed');
      print(error);
      emit(GettingSugesstedJobFail());
    }
  }

  Future<void> profLang(
      context,{
        String? lang,

      }
      ) async {
    // Trying to get the token from the storage
    try {
      SharedPreferences userData = await SharedPreferences.getInstance();
      token = userData.getString('token');
      print(token);
      emit(GettingTokenSuccessfully());
      // Getting token successfully, now getting all Jobs
      try {
        Response response = await Dio().put(
          "${JobFinderConstants.BaseUrl}/user/profile/edit?language=$lang",
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        bool status = response.data['status'];
        print(status);
        if(status){
          print("updated");
        }else{
          print("Not updated");
        }



        emit(GettingSugesstedJobSuccessfully());
      } catch (error) {
        // Handle errors
        print('Error is not in the token');
        print(error);
        emit(GettingSugesstedJobFail());
      }
    } catch (error) {
      print('Getting token failed');
      print(error);
      emit(GettingSugesstedJobFail());
    }
  }
  int? expId;

  Future<void> addExperince(
      context,{
        String? pos,
        String? typeOfWork,
        String? comName,
        String? Location,
        String? startYear
      }
      ) async {
    // Trying to get the token from the storage
    try {
      SharedPreferences userData = await SharedPreferences.getInstance();
      token = userData.getString('token');

      print(token);
      emit(GettingTokenSuccessfully());
      // Getting token successfully, now getting all Jobs
      try {
        Response response = await Dio().post(
          "${JobFinderConstants.BaseUrl}/experince",data: {
          "user_id": userID.toString(),
          "postion": pos,
          "type_work": typeOfWork,
          "comp_name": comName,
          "location": Location,
          "start": startYear,
        },
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        bool status = response.data['status'];
        expId= response.data['data']['id'];
        print(status);
        if(status){
          print("added");
        }else{
          print("Not added");
        }



        emit(GettingSugesstedJobSuccessfully());
      } catch (error) {
        // Handle errors
        print('Error is not in the token');
        print(error);
        emit(GettingSugesstedJobFail());
      }
    } catch (error) {
      print('Getting token failed');
      print(error);
      emit(GettingSugesstedJobFail());
    }
  }

  Future<void> getAllJobs(
      context,
      ) async {
    // Trying to get the token from the storage
    try {
      SharedPreferences userData = await SharedPreferences.getInstance();
      token = userData.getString('token');
      print(token);
      emit(GettingTokenSuccessfully());
      // Getting token successfully, now getting all Jobs
      try {
        Response response = await Dio().get(
          "${JobFinderConstants.BaseUrl}/jobs",
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        List<dynamic> data = response.data['data'];
        bool status = response.data['status'];
        allJobs.add(data);

        if(status){
          print("data received");
        }
        else{
          print("fail");
        }

        emit(GettingAllJobsSuccessfully());
      } catch (error) {
        // Handle errors
        print('Error is not in the token');
        print(error);
        emit(GettingAllJobsFailed());
      }
    } catch (error) {
      print('Getting token failed');
      print(error);
      emit(GettingTokenFailed());
    }
  }

  Future<void> getChatNotification(
      context,
      ) async {
    // Trying to get the token from the storage
    try {
      SharedPreferences userData = await SharedPreferences.getInstance();
      token = userData.getString('token');
      print(token);
      emit(GettingTokenSuccessfully());
      // Getting token successfully, now getting all Jobs
      try {
        Response response = await Dio().get(
          "${JobFinderConstants.BaseUrl}/notification/1",
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        bool status = response.data['status'];
        compname= response.data['data']['comp_name'];
        lastmsg=response.data['data']['last_massage'];
        if(status){
          print("success");
        }
        else {
          print ("failed");
        }
        emit(GettingNotificationSuccess());
      } catch (error) {
        // Handle errors
        print('Error is not in the token');
        print(error);
        emit(GettingNotificationFailed());
      }
    } catch (error) {
      print('Getting token failed');
      print(error);
      emit(GettingTokenFailed());
    }
  }



  Future<void> userSendMsg(
      context,{
        String? Msg,
      }
      ) async {
    // Trying to get the token from the storage
    try {
      SharedPreferences userData = await SharedPreferences.getInstance();
      token = userData.getString('token');
      test=userData.getInt('userId').toString();
      print(token);
      emit(GettingTokenSuccessfully());
      // Getting token successfully, now getting all Jobs
      try {
        Response response = await Dio().post(
          "${JobFinderConstants.BaseUrl}/chat/user?massage=$Msg&user_id=$test&comp_id=1",
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        bool status = response.data['status'];
        print(status);
        if(status){
          print("message sent");
        }else{
          print("message no sent");
        }



        emit(UserPostMessageSuccess());
      } catch (error) {
        // Handle errors
        print('Error is not in the token');
        print(error);
        emit(UserPostMessageFail());
      }
    } catch (error) {
      print('Getting token failed');
      print(error);
      emit(GettingSugesstedJobFail());
    }
  }

  Future<void> getChatContent(
      context,
      ) async {
    // Trying to get the token from the storage
    try {
      SharedPreferences userData = await SharedPreferences.getInstance();
      token = userData.getString('token');
      test=userData.getInt('userId').toString();
      print(token);
      emit(GettingTokenSuccessfully());
      // Getting token successfully, now getting all Jobs
      try {
        Response response = await Dio().get(
          "${JobFinderConstants.BaseUrl}/chat?user_id=$test&comp_id=1",
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        bool status = response.data['status'];
        for(int i=0;i<response.data['data'].length;i++){
          if(response.data['data'][i]['sender_user']=="company"){
            compMsg=response.data['data'][i]['massage'];
            CompMsgList.add(compMsg!);
          }
          else{
            userMsg=response.data['data'][i]['massage'];
            UserMsgList.add(userMsg!);
          }
        }
        if(status){
          print("success");
        }
        else {
          print ("failed");
        }
        emit(GettingNotificationSuccess());
      } catch (error) {
        // Handle errors
        print('Error is not in the token');
        print(error);
        emit(GettingNotificationFailed());
      }
    } catch (error) {
      print('Getting token failed');
      print(error);
      emit(GettingTokenFailed());
    }
  }





}