import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather_project/providers/weather_provider.dart';
import 'package:weather_project/utils/Approuat.dart';
import 'package:weather_project/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:weather_project/view/shared/bootom_nav.dart';

class WeatherUi extends StatefulWidget {
  const WeatherUi({Key? key}) : super(key: key);

  @override
  State<WeatherUi> createState() => _WeatherUiState();
}

class _WeatherUiState extends State<WeatherUi> {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
            bottomNavigationBar: const BottomNav(),
            body: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Today, $formatted',
                            style: const TextStyle(fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          value.w.name == null
                              ? const CircularProgressIndicator()
                              : Text(
                                  value.w.name.toString(),
                                  style: const TextStyle(
                                      fontSize: 29,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            const Color(0xFF2661FA),
                            HexColore.fromHex('#EEA47FFF'),
                          ]),
                        ),
                        child: Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.map_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, AppRouat.map);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/mainpg.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    value.w.base.toString(),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontWeight: FontWeight.w600,
                        fontSize: 48),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Humidity',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        value.w.main == null
                            ? const CircularProgressIndicator()
                            : Text(value.w.main!.humidity.toString()),
                        Image.asset(
                          'assets/images/hu.png',
                          width: 30,
                          height: 30,
                        )
                      ],
                    ),
                    const VerticalDivider(
                      width: 20,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        const Text(
                          'Wind Speed',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        value.w.wind == null
                            ? const CircularProgressIndicator()
                            : Text(value.w.wind!.speed.toString()),
                        Image.asset(
                          'assets/images/h.png',
                          width: 30,
                          height: 30,
                        )
                      ],
                    ),
                    const VerticalDivider(
                      thickness: 4,
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        const Text(
                          'Clouds',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        value.w.main == null
                            ? const CircularProgressIndicator()
                            : Text(value.w.main!.humidity.toString()),
                        Image.asset(
                          'assets/images/clouds.png',
                          width: 35,
                          height: 35,
                        )
                      ],
                    ),
                    const VerticalDivider(
                      thickness: 4,
                      color: Colors.black,
                    ),
                  ],
                )
              ]),
            )),
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class weatherWidget extends StatelessWidget {
  String type;
  String rang;
  String image;
  weatherWidget(this.image, this.type, this.rang, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) => Container(
        margin: const EdgeInsets.only(left: 12),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(type),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Text('${rang}C'),
            ),
            SizedBox(
              height: 6.0.wp,
            ),
            Image.asset(
              image,
              width: 50,
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
