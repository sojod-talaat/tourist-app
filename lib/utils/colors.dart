import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension PercentSized on double {
  double get hp => (Get.height * (this / 100));
  double get wp => (Get.width * (this / 100));
}

extension ResponsivText on double {
  double get sp => Get.width / 100 * (this / 3);
}

extension HexColore on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

const primary = Color(0xFF333333);
const secondary = Color(0xFFd9bcff);

const darker = Color(0xFF3E4249);
const cardColor = Colors.white;
const mainColor = Color(0xFF000000);
const appBgColor = Color(0xFFF7F7F7);
const appBarColor = Color(0xFFF7F7F7);
const shadowColor = Colors.black87;
const textBoxColor = Colors.white;
const textColor = Color(0xFF333333);
const labelColor = Color(0xFF8A8989);
const actionColor = Color(0xFFe54140);

const bottomBarColor = Colors.white;
const inActiveColor = Colors.grey;

const yellow = Color(0xFFffcb66);
const green2 = Color(0xFFb2e1b5);
const pink = Color(0xFFf5bde8);
const purple = Color(0xFFd9bcff);
const red2 = Color(0xFFff4b60);
const orange = Color(0xFFFFC8A2);
const sky = Color(0xFFABDEE6);
const blue2 = Color(0xFF509BE4);
const listColors = [
  green2,
  purple,
  yellow,
  orange,
  sky,
  secondary,
  red2,
  blue2,
  pink,
  yellow,
];
