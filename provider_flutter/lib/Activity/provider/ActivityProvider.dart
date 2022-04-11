import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider_flutter/Activity/model/ActivityModel.dart';
import 'package:provider_flutter/network/AppUrl.dart';

import 'package:http/http.dart' as http;

import '../../network/NetworkCall.dart';

class ActivityProvider extends ChangeNotifier {
  ActivityModel activityModel = ActivityModel();
  bool isLoading = true;
  List<ActivityModel> activityModelList = [];

  getActivity(context) async {
    isLoading = true;
    await getAllActivity(context).then((value) {
      return activityModel;
    });
    Future.delayed(const Duration(seconds: 5), () {
      isLoading = false;
      notifyListeners();
    });
  }

  Future<ActivityModel> getAllActivity(conetxt) async {
    try {
      http
          .post(
        Uri.parse(AppUrl.GET_ACTIVITY),
      )
          .then((value) {
        if (kDebugMode) {
          activityModel = ActivityModel.fromJson(jsonDecode(value.body));
          return activityModel;
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('$e');
      }
    }
    return activityModel;
  }
}
