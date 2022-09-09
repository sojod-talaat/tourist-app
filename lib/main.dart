import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/firebase_options.dart';
import 'package:weather_project/providers/auth_provider.dart';
import 'package:weather_project/providers/weather_provider.dart';
import 'package:weather_project/utils/Approuat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return WeatherProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return AuthProvider();
        }),
      ],
      child: MyApp(
        appRouat: AppRouat(),
      )));
}

class MyApp extends StatelessWidget {
  AppRouat appRouat;
  MyApp({Key? key, required this.appRouat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),

      onGenerateRoute: appRouat.generatedRoute,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRouat.initial,
      // home: Onbording()
    );
  }
}
