import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Models/NewsChannelHeadLinesModel.dart';
import 'package:news_app/Utils/api_urls.dart';
import 'package:news_app/Models/category_model.dart';

class NewsRepository{

  Future<NewsChannelHeadLinesModel> fetchNewsHeadLineApi(String channel) async {

    final response = await http.get(Uri.parse(ApiUrls.getChannelApi(channel)));
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return NewsChannelHeadLinesModel.fromJson(body);
    }
    throw Exception("error while fetching data");
  }

  Future<CategoryModel> fetchNewsCategoryApi(String cat) async {
    final response = await http.get(Uri.parse(ApiUrls.getCategoryApi(cat)));
    if(response.statusCode == 200){
      print(response.body.toString());
      final body = jsonDecode(response.body);
      return CategoryModel.fromJson(body);
    }
    throw Exception("error while fetching data");
  }

}

