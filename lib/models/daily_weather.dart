class DailyWeather {
  List<Data>? data;
  String? cityName;
  double? lon;
  String? timezone;
  double? lat;
  String? countryCode;
  String? stateCode;

  DailyWeather(
      {this.data,
      this.cityName,
      this.lon,
      this.timezone,
      this.lat,
      this.countryCode,
      this.stateCode});

  DailyWeather.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    cityName = json['city_name'];
    lon = json['lon'];
    timezone = json['timezone'];
    lat = json['lat'];
    countryCode = json['country_code'];
    stateCode = json['state_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['city_name'] = this.cityName;
    data['lon'] = this.lon;
    data['timezone'] = this.timezone;
    data['lat'] = this.lat;
    data['country_code'] = this.countryCode;
    data['state_code'] = this.stateCode;
    return data;
  }
}

class Data {
  int? clouds;
  Weather? weather;
  int? windDir;
  Null? maxDhi;
  int? cloudsHi;
  double? maxTemp;
  double? minTemp;
  int? cloudsMid;
  int? cloudsLow;
  Data(
      {this.clouds,
      this.weather,
      this.windDir,
      this.maxDhi,
      this.cloudsHi,
      this.minTemp,
      this.cloudsMid,
      this.cloudsLow});

  Data.fromJson(Map<String, dynamic> json) {
    clouds = json['clouds'];

    weather =
        json['weather'] != null ? new Weather.fromJson(json['weather']) : null;
    windDir = json['wind_dir'];
    maxDhi = json['max_dhi'];
    cloudsHi = json['clouds_hi'];
    // minTemp = json['min_temp'];
    cloudsMid = json['clouds_mid'];
    cloudsLow = json['clouds_low'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['clouds'] = this.clouds;

    if (this.weather != null) {
      data['weather'] = this.weather!.toJson();
    }
    data['wind_dir'] = this.windDir;
    data['max_dhi'] = this.maxDhi;
    data['clouds_hi'] = this.cloudsHi;

    data['max_temp'] = this.maxTemp;

    data['min_temp'] = this.minTemp;
    data['clouds_mid'] = this.cloudsMid;
    data['clouds_low'] = this.cloudsLow;
    return data;
  }
}

class Weather {
  String? icon;
  int? code;
  String? description;

  Weather({this.icon, this.code, this.description});

  Weather.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}
