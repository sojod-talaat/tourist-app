import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/firabase/Authhelper.dart';
import 'package:weather_project/models/places_model.dart';

import 'package:weather_project/providers/weather_provider.dart';
import 'package:weather_project/utils/colors.dart';

// ignore: must_be_immutable
class CookieDetail extends StatefulWidget {
  // ignore: non_constant_identifier_names
  item Item;
  // ignore: non_constant_identifier_names
  CookieDetail({Key? key, required this.Item}) : super(key: key);

  @override
  State<CookieDetail> createState() => _CookieDetailState();
}

class _CookieDetailState extends State<CookieDetail> {
  Color buttoncolor = const Color(0xFF545D68);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('PiceUp',
              style: GoogleFonts.dancingScript(
                  // fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: const Color(0xFF545D68))),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite, color: buttoncolor),
              onPressed: () {
                setState(() {
                  buttoncolor = Colors.red;
                });
                value.addfavorite(
                    widget.Item, AuthFirebaseHelper.authhelper.getCurrentUse());
              },
            ),
          ],
        ),
        body: ListView(children: [
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(widget.Item.Location!,
                style: GoogleFonts.dancingScript(
                  //fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: HexColore.fromHex('#f8e3e2'),
                )),
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 7, right: 20),
            child: Container(
              height: 500,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.Item.imageUrl!
                          // product.imageUrl!,
                          ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text('lOCATION: ${widget.Item.Location}',
                    style: const TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      // color: HexColore.fromHex('#f8e3e2'),
                    )),
              ],
            ),
          ),
          const Center(
            child: Text('Location description',
                style: TextStyle(
                    color: Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 24.0)),
          ),
          const SizedBox(height: 20.0),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(widget.Item.description!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                      color: Color(0xFFB4B8B9))),
            ),
          ),
          const SizedBox(height: 20.0),
          const SizedBox(
            height: 60,
          ),
        ]),
      ),
    );
  }
}
