import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:weather_project/models/places_model.dart';
import 'package:weather_project/providers/weather_provider.dart';
import 'package:weather_project/utils/colors.dart';
import 'package:weather_project/view/screens/detail_screen.dart';
import 'package:weather_project/view/shared/bootom_nav.dart';

// ignore: must_be_immutable
class TouristScreen extends StatelessWidget {
  TouristScreen({Key? key}) : super(key: key);
  List categories = [
    {"name": "Mountain", "icon": Icons.terrain_rounded},
    {"name": "Beach", "icon": Icons.beach_access_rounded},
    {"name": "Park", "icon": Icons.park_rounded},
    {"name": "Temple", "icon": Icons.account_balance_rounded},
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) => Scaffold(
        bottomNavigationBar: const BottomNav(),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: appBarColor,
          title: const Text(
            'See the World!',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.categories.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            value.selectionindex = index;
                          },
                          child: CategoryItem(
                            category: value.categories[index],
                            data: categories[index],
                            color: listColors[index],
                          ),
                        )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: const [
                  Text(
                    'Most Popular :',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: const EdgeInsets.all(2),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                crossAxisCount: 4,
                itemCount: value.products.length,
                itemBuilder: (BuildContext context, int index) =>
                    makeItem(produc: value.products[index]),
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 3 : 2),
                mainAxisSpacing: 4,
                crossAxisSpacing: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  CategoryItem(
      {Key? key,
      required this.data,
      this.onTap,
      this.color = primary,
      required this.category})
      : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final data;
  final Color color;
  final GestureTapCallback? onTap;
  Category category;

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) => GestureDetector(
        onTap: () {
          value.getAllProduct(category.catId!);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 10),
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.1),
                spreadRadius: .5,
                blurRadius: .5,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: color.withOpacity(.2)),
                  child: Icon(data["icon"], size: 25, color: color)),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Text(
                  category.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13, color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class makeItem extends StatelessWidget {
  item produc;
  makeItem({Key? key, required this.produc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) => InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CookieDetail(
                        Item: produc,
                      )));
        },
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(produc.imageUrl!),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Colors.black.withOpacity(.4),
                          Colors.black.withOpacity(.1),
                        ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        produc.Location == null
                            ? const CircularProgressIndicator()
                            : Text(
                                produc.Location!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
