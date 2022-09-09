import 'package:dio/dio.dart';
import 'package:weather_project/models/weathermodel.dart';

import '../models/daily_weather.dart';

class WeatherDioHelper {
  WeatherDioHelper._();

  static WeatherDioHelper weatherDioHelper = WeatherDioHelper._();
  Dio dio = Dio();
  Future<WeatherModel> getWids(double lat, double long) async {
    // String url =
    //     'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=56a729dd9b8a0817c535d6df16149021';
    Response response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=56a729dd9b8a0817c535d6df16149021');
    // response.data = Weather.fromJson(response.data);
    print(response.data);
    return WeatherModel.fromJson(response.data);
  }

  Future<DailyWeather> getdaiyweather(double lat, double lon) async {
    Response response = await dio.get(
        'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/daily?lat=$lat&lon=$lon',
        options: Options(headers: {
          "X-RapidAPI-Key":
              "3255484d46mshfefcd47f147d119p1027f2jsnc4aed1820250",
          "X-RapidAPI-Host": "weatherbit-v1-mashape.p.rapidapi.com"
        }));
    // print(response.data);
    DailyWeather w = DailyWeather.fromJson(response.data);
    print(w.data!.first.weather!.description);
    return w;
  }
}
