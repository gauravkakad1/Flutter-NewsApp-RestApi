


import 'package:news_app/Models/category_model.dart';

import '../Models/NewsChannelHeadLinesModel.dart';
import '../repository/news_repository.dart';

class NewsViewModel{

  var _myRepo = NewsRepository();

  Future <NewsChannelHeadLinesModel> fetchNewsHeadLineApi(String Url)async{
    try{
      var response = await _myRepo.fetchNewsHeadLineApi(Url);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future <CategoryModel> fetchNewsCategoryApi(String cat)async{
    try{
      var response = await _myRepo.fetchNewsCategoryApi(cat);
      return response;
    }catch(e){
      rethrow;
    }
  }
}