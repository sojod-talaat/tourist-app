import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:weather_project/firabase/firestore.dart';
import 'package:weather_project/providers/weather_provider.dart';

import 'package:weather_project/view/shared/bootom_nav.dart';

import '../../utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) => Scaffold(
        bottomNavigationBar: const BottomNav(),
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Keep Tracking!',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: DatePicker(
                DateTime.now(),
                width: 60,
                height: 100,
                controller: value.controller,
                initialSelectedDate: DateTime.now(),
                selectionColor: HexColore.fromHex('#EEA47FFF'),
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  value.Selection();
                  setState(() {
                    value.selectedValue = date;
                  });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: daily(),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'News over the World',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      //color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(90),
                  )),
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      itemCount: value.news!.articles!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              // ignore: deprecated_member_use
                              launch(value.news!.articles![index].url!);
                            },
                            child: Container(
                              height: 100,
                              margin: const EdgeInsets.all(8),
                              child: Row(
                                children: <Widget>[
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: AspectRatio(
                                        aspectRatio: 1,
                                        child: value.news!.articles![index]
                                                    .urlToImage ==
                                                null
                                            ? Image.asset(
                                                'assets/images/cal.jpg')
                                            : Image.network(
                                                value.news!.articles![index]
                                                    .urlToImage!,
                                                fit: BoxFit.cover,
                                              )),
                                  ),
                                  const SizedBox(width: 16),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          value.news!.articles![index].title
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(height: 8,),
                                        Text(
                                          value.news!.articles![index]
                                              .description
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        // SizedBox(
                                        //   height: 5,
                                        // ),
                                        Text(
                                          value.news!.articles![index]
                                              .publishedAt
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.blueGrey),
                                        ),
                                        const Divider(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      })),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class daily extends StatelessWidget {
  const daily({Key? key}) : super(key: key);
// Color(0xffABCFF2), Color(0xff9AC6F3)
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) => Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              HexColore.fromHex('#EEA47FFF'),
              HexColore.fromHex('#00539cff'),
              HexColore.fromHex('#EEA47FFF'),
            ]),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                offset: Offset(0, 25),
                blurRadius: 10,
                spreadRadius: -12,
              )
            ]),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -70,
              left: 6,
              child: Image.asset(
                'assets/images/sun4.png',
                width: 200,
              ),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    '${value.dailyWeather.cityName} City',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      '27',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        // foreground: Paint()..shader = linearGradient,
                      ),
                    ),
                  ),
                  Text(
                    'o',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      // foreground: Paint()..shader = linearGradient,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
