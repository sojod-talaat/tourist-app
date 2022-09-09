import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weather_project/data/news_helper.dart';

import 'package:weather_project/firabase/Authhelper.dart';
import 'package:weather_project/firabase/firestore.dart';

import 'package:weather_project/models/categories.dart';
import 'package:weather_project/models/daily_weather.dart';
import 'package:weather_project/models/news_model.dart';

import 'package:weather_project/models/weathermodel.dart';
import '../firabase/storage.dart';
import '../services/weather_helper.dart';
import '../utils/Approuat.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel w = WeatherModel();
  DailyWeather dailyWeather = DailyWeather();
  List<item>? favorite;

  WeatherProvider() {
    GetLocation();
    getNewsData();
    getAllCategory();

    getallfavorit();
  }

  List<item> favoriteList = [];

  addfavorite(item Item, String userid) async {
    favorite =
        await FireStoreHelper.fireStoreHelper.Addtofavorite(Item, userid);
    getallfavorit();
    notifyListeners();
  }

  getallfavorit() async {
    favoriteList = await FireStoreHelper.fireStoreHelper
        .getfromfavorite(AuthFirebaseHelper.authhelper.getCurrentUse());
    notifyListeners();
  }

  removefavorite(item Item, String userid) async {
    favorite =
        await FireStoreHelper.fireStoreHelper.Removefavorite(Item, userid);
    getallfavorit();
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.calendar_today_rounded,
    Icons.explore,
    Icons.person_rounded,
  ];

  TextEditingController categoryname = TextEditingController();
  TextEditingController itemName = TextEditingController();
  TextEditingController itemlocation = TextEditingController();
  TextEditingController itemdescrpation = TextEditingController();
  TextEditingController itemreate = TextEditingController();

  File? selectedImage;
  List<Category> categories = [];
  List<item> products = [];
  selectImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(xfile!.path);
    notifyListeners();
  }

  addNewCategory() async {
    if (selectedImage != null) {
      String imageUrl =
          await StorageHelper.storageHelper.uploadImage(selectedImage!);
      Category category = Category(
        imageurl: imageUrl,
        name: categoryname.text,
      );
      FireStoreHelper.fireStoreHelper.addCategoryToFireStore(category);
      category.catId = category.catId;
      categories.add(category);
      notifyListeners();
      getAllCategory();
      categoryname.clear();
      selectedImage = null;
    }
  }

  getAllCategory() async {
    categories =
        await FireStoreHelper.fireStoreHelper.getCategoryFromFireStore();
    notifyListeners();
  }

  deleteCategory(Category category) async {
    await FireStoreHelper.fireStoreHelper.deleteCategory(category);
    getAllCategory();
    notifyListeners();
  }

  getAllProduct(String ctid) async {
    products = await FireStoreHelper.fireStoreHelper.getAlProduct(ctid);
    notifyListeners();
  }

  addNewProduct(String catId) async {
    if (selectedImage != null) {
      String imageUrl2 =
          await StorageHelper.storageHelper.uploadImage(selectedImage!);
      item product = item(
        Location: itemlocation.text,
        ItemName: itemName.text,
        description: itemdescrpation.text,
        reate: itemreate.text,
        imageUrl: imageUrl2,
        //quantity: int.parse(ProductquantityController.text),
      );
      item aNewProduct =
          await FireStoreHelper.fireStoreHelper.addNewProduct(product, catId);

      //ProductquantityController.clear();
      products.add(aNewProduct);
      selectedImage = null;

      notifyListeners();
      getAllProduct(catId);
    }
  }

  // ignore: non_constant_identifier_names

  int currentIndex = 0;
  selection(BuildContext context) {
    switch (currentIndex) {
      case 0:
        Navigator.pushNamed(context, AppRouat.home);
        notifyListeners();
        break;

      case 1:
        Navigator.pushNamed(context, AppRouat.calender);

        break;
      case 2:
        Navigator.pushNamed(context, AppRouat.tourist);

        break;
      case 3:
        Navigator.pushNamed(context, AppRouat.profile2);

        break;
    }
    notifyListeners();
  }

  int? selectionindex;

  NewsModel? news;
  getNewsData() async {
    news = await NewsHelper.newsHelper.GetNewsDate();
  }

  DatePickerController controller = DatePickerController();
  DateTime selectedValue = DateTime.now();
  String d = '13';
  // ignore: non_constant_identifier_names
  Selection() async {
    switch (selectedValue.day) {
      case 8:
        d = dailyWeather.data![8].maxTemp.toString();
        notifyListeners();
        break;
      case 9:
        d = dailyWeather.data![9].maxTemp.toString();
        notifyListeners();
        break;
      case 10:
        d = dailyWeather.data![10].maxTemp.toString();
        notifyListeners();
        break;
      case 11:
        d = dailyWeather.data![11].maxTemp.toString();
        notifyListeners();
        break;
    }
  }

  getdata([double lat = 36.0, double long = 40.0]) async {
    w = await WeatherDioHelper.weatherDioHelper.getWids(lat, long);
    notifyListeners();
  }

  getdaily([double lat = 36.0, double long = 40.0]) async {
    dailyWeather =
        await WeatherDioHelper.weatherDioHelper.getdaiyweather(lat, long);
    notifyListeners();
  }

  double? long;
  double? lat;
  Position? position;
  // ignore: non_constant_identifier_names
  GetLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition();
    getdata(position!.latitude, position!.longitude);
    getdaily(position!.latitude, position!.longitude);
  }
}
