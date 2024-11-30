import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/error_extensions.dart';
import 'package:movie_app/core/storage.dart';
import 'package:movie_app/model/news_class_model.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  HiveService? _hiveService;
  Future<HiveService> get hive async {
    _hiveService ??= await HiveService.getInstance();
    return _hiveService!;
  }

  List<NewsClass> articleNews = [];

  Future<void> getNews() async {
    try {
      HiveService hiveService = await hive;
      String url =
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=e2e5db21b1974e8ebc31b23ccb0e73b4";
      var responseData = await http.get(Uri.parse(url));
      var jsonData = jsonDecode(responseData.body);

      if (jsonData['status'] == 'ok') {
        jsonData['articles'].forEach((element) {
          if (element['author'] != null &&
              element['title'] != null &&
              element['url'] != null &&
              element['urlToImage'] != null &&
              element['content'] != null &&
              element['description'] != null) {
            NewsClass newsArticles = NewsClass.fromJson(element);
            articleNews.add(newsArticles);
          }
        });
        hiveService.storeValue("news", articleNews);

      }
    } catch (err) {
      Flushbar(
        title: err.errorTitle,
        titleColor: Colors.white,
        icon: const Icon(Icons.error),
        titleSize: 20,
        backgroundColor: Colors.red,
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        message: err.errorMessage,
      );
    }
  }
}
