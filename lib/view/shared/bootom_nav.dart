import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/providers/weather_provider.dart';

import 'package:weather_project/utils/colors.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) => Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 1),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              value.currentIndex = index;
              value.selection(context);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == value.currentIndex ? 0 : 29,
                    right: 22,
                    left: 22,
                  ),
                  width: 28,
                  height: index == value.currentIndex ? 5 : 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color(0xFF2661FA),
                      HexColore.fromHex('#EEA47FFF'),
                    ]),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Icon(
                  value.listOfIcons[index],
                  size: 30,
                  color: index == value.currentIndex
                      ? HexColore.fromHex('#EEA47FFF')
                      : Colors.black38,
                ),
                const SizedBox(height: 03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
