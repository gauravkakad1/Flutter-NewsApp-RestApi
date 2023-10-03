class ApiUrls{
  static const String everthingApi = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b70f2ff12df84e6c8361c8ab249c4b1c";
  static const String topHeadLineApi = "https://newsapi.org/v2/top-headlines?country=us&apiKey=b70f2ff12df84e6c8361c8ab249c4b1c";

  static String getChannelApi(String name){
    return "https://newsapi.org/v2/top-headlines?sources=$name&apiKey=b70f2ff12df84e6c8361c8ab249c4b1c";
  }
  static String getCategoryApi(String name){
    return "https://newsapi.org/v2/everything?q=$name&apiKey=b70f2ff12df84e6c8361c8ab249c4b1c";
  }
}