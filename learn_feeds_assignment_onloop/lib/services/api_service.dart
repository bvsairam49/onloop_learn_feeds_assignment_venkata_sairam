import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learn_feeds_assignment_onloop/app/home_screen/model/learn_feed_model.dart';

import '../app/home_screen/model/filter_model.dart';
import 'config.dart';

class ApiService {
  /// The dio provider.
  static final Dio _dio = Dio();

  /// Fetches the filter tag.
  Future<dynamic> fetchFilterTags() async {
    try {
      // Call the api.
      Response response = await _dio.get(
        Config.filterTagBaseURL,
      );

      // Check response code and convert to model, if success.
      if (response.statusCode == 200) {
        return FilterModel.fromJson(response.data);
      } else {
        throw 'Unknown error';
      }
    } on DioError catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  /// Fetches the feeds.
  Future<LearnFeedModel>? fetchLearnContentFeeds() async {
    try {
      // Call the api.
      Response response = await _dio.get(Config.learnFeedsBaseURL);

      // Check response code and convert to model, if success.
      if (response.statusCode == 200) {
        return LearnFeedModel.fromJson(response.data);
      } else {
        throw 'Unknown error';
      }
    } on DioError catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }
}
