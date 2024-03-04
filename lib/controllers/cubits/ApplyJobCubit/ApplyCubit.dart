import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amitproject/controllers/constants/constants.dart';
import 'package:amitproject/controllers/cubits/ApplyJobCubit/ApplyStates.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplyCubit extends Cubit<ApplyStates> {
  ApplyCubit() : super(SuperApplyStates());
  static ApplyCubit get(context) => BlocProvider.of(context);

  List<dynamic> allJobs = [];
  String? token;

  Future<void> getAllJobs(
    context,
  ) async {
    // Trying to get the token from the storage
    try {
      SharedPreferences userData = await SharedPreferences.getInstance();
      token = "8709|I8sjkix82muQ8UIDLwk9Yfihgqldh4duvGE6WYLk";
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

        // print(data);
        // print(status);

        allJobs.add(data);

        //print('all Jobs are Ready to be Called: $allJobs');


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

  Future<void> getJobById(
    context,
    int? id,
  ) async {
    // Trying to get the token from the storage
    try {
      SharedPreferences userData = await SharedPreferences.getInstance();
      token = userData.getString('token');
      print(token);
      emit(GettingTokenSuccessfully());

      // Getting token successfully, now getting Job by Id
      try {
        Response response = await Dio().get(
          "${JobFinderConstants.BaseUrl}/jobs/$id",
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        String name = response.data['data']['name'];
        bool status = response.data['status'];

        print(name);
        print(status);

        emit(GettingJobByIdSuccessfully());
      } catch (error) {
        // Handle errors
        print('Error is not in the token');
        print(error);
        emit(GettingJobByIdFailed());
      }
    } catch (error) {
      print('Getting token failed');
      print(error);
      emit(GettingTokenFailed());
    }
  }

  Future<void> applyJob(
    context, {
    String? email,
    String? mobile,
    String? workType,
    File? file,
    String? jobId,
    int? userId,
  }) async {
    try {
      Response response =
          await Dio().post("${JobFinderConstants.BaseUrl}/apply", data: {
        'email': email,
        'mobile': mobile,
        'work_type': workType,
        'other_file': file,
        'jobs_id': '1', // Should be gotten from a getEndpoint
        'userId': userId.toString()
      });

      String compName = response.data['data']['comp_name'];
      bool status = response.data['status'];

      print(compName);
      print(status);

      // emit(GettingNotificationSuccess());
    } catch (error) {
      // Handle errors

      print(error);
      // emit(GettingNotificationFailed());
    }
  }
}
