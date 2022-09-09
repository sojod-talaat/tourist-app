import 'package:dio/dio.dart';
import 'package:weather_project/models/news_model.dart';

class NewsHelper {
  NewsHelper._();
  static NewsHelper newsHelper = NewsHelper._();
  Dio dio = Dio();
  Future<NewsModel> GetNewsDate() async {
    Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=509f52c1846f44d59a7ce21d6bcff7b9');
    NewsModel news = NewsModel.fromJson(response.data);
    List<dynamic> result = response.data['articles'];
    print(result);
    return news;
  }
}
