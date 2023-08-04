import 'package:flutter/material.dart';
import 'package:weather_project/view/screens/profile_screen.dart';
import 'package:weather_project/view/screens/calender_screen.dart';

import 'package:weather_project/view/screens/login_screen.dart';
import 'package:weather_project/view/screens/map_location_screen.dart';
import 'package:weather_project/view/screens/onbording.dart';
import 'package:weather_project/view/screens/signup_screen.dart';
import 'package:weather_project/view/screens/touristscreen.dart';
import 'package:weather_project/view/screens/weather_screen.dart';

class AppRouat {
  static const String login = '/Login';
  static const String signup = '/signup';
  static const String initial = '/';
  static const String home = '/home';
  static const String map = '/mapscreen';
  static const String calender = '/calender';
  static const String tourist = '/tourist';
  static const String deatils = '/details';
  static const String items = '/items';
  static const String profile2 = '/profile';
  Route? generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(
          builder: (_) => const Onbording(),
        );

      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case map:
        return MaterialPageRoute(builder: (_) => MapLocationScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const WeatherUi());
      case calender:
        return MaterialPageRoute(builder: (_) => const CalendarScreen());
      case tourist:
        return MaterialPageRoute(builder: (_) => TouristScreen());
      case profile2:
        return MaterialPageRoute(builder: (_) => const Profile());
    }

    return null;
  }
}
