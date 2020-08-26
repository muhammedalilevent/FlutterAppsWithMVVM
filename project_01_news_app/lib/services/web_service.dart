import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_01_news_app/models/news_article.dart';
import 'package:project_01_news_app/utils/constants.dart';

class WebService  {

  Future<List<NewsArticle>>fetchHeadlinesByKeyword(String keyword) async{
    

    final response = await http.get(Constants.headlinesFor(keyword));
    if(response.statusCode==200){
      final result =jsonDecode(response.body);
      Iterable list =result['articles'];
      return list.map((json) => NewsArticle.fromJSON(json)).toList();
    }else
      {
        throw Exception("Failed to get News");
      }

  }




  Future<List<NewsArticle>> fetchLatestTopLines() async {

    final response = await http.get(Constants.TOP_HEADLINES_URL);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception("Failed to get top News");
    }
  }
}
