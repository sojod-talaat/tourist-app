import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/firabase/Authhelper.dart';
import 'package:weather_project/models/places_model.dart';
import 'package:weather_project/providers/auth_provider.dart';
import 'package:weather_project/providers/weather_provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _InstitutePageState();
}

class _InstitutePageState extends State<Profile> with TickerProviderStateMixin {
  User? current;
  @override
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Consumer<AuthProvider>(
      builder: (context, value, child) => SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none,
                          color: Colors.black)),
                ],
                title: const Text(
                  'My profile',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              body: Column(children: [
                Container(
                    height: 300,
                    // color: Colors.blueAccent,
                    padding: const EdgeInsets.all(2.0),
                    child: Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 110,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/pic1.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 50.0, left: 10),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              backgroundImage:
                                  AssetImage('assets/images/pic3.jpg'),
                              radius: 60,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 360, top: 150),
                            child: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 159, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(value.currentuser.name!,
                                    style: GoogleFonts.oswald()),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(value.currentuser.email!,
                                    style: GoogleFonts.oswald()),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(value.currentuser.phone!,
                                    style: GoogleFonts.oswald()),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 250, left: 20, bottom: 3.0),
                              child: TabBar(
                                  controller: tabController,
                                  isScrollable: true,
                                  tabs: const [
                                    Tab(
                                      child: Text(
                                        ' lovley places',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        ' My trip',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ]))
                        ])),
                Expanded(
                  child: TabBarView(controller: tabController, children: [
                    Container(
                        padding: const EdgeInsets.only(right: 15.0),
                        width: MediaQuery.of(context).size.width - 30.0,
                        height: MediaQuery.of(context).size.height - 50.0,
                        child: Consumer<WeatherProvider>(
                          builder: (context, value, child) => GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 15.0,
                                    childAspectRatio: 0.8,
                                    crossAxisCount: 2),
                            // crossAxisCount: 2,
                            primary: false,
                            itemCount: value.favoriteList.length,
                            itemBuilder: (context, index) {
                              return buildCard(value.favoriteList[index]);
                            },
                          ),
                        )),
                    const Text('data'),
                  ]),
                )
              ]))),
    );
  }
}

// ignore: must_be_immutable
class CollectionTile2 extends StatefulWidget {
  item? cateogory;
  CollectionTile2(this.cateogory, {Key? key}) : super(key: key);

  @override
  State<CollectionTile2> createState() => _CollectionTile2State();
}

class _CollectionTile2State extends State<CollectionTile2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(builder: (context, provider, x) {
      Color buttonColor = Colors.redAccent;
      return InkWell(
        onTap: () {},
        child: Padding(
            padding: const EdgeInsets.all(13),
            child: Row(children: <Widget>[
              Container(
                width: 50,
                height: 180,
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: buttonColor,
                      ),
                      onPressed: () {
                        setState(() {
                          buttonColor = Colors.grey;
                        });
                        provider.removefavorite(widget.cateogory!,
                            AuthFirebaseHelper.authhelper.getCurrentUse());
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(widget.cateogory!.imageUrl!),
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
                      Text(
                        widget.cateogory!.Location!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ))
            ])),
      );
    });
  }
}

// ignore: camel_case_types, must_be_immutable
class buildCard extends StatelessWidget {
  item product;

  buildCard(this.product, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) => Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 6.0, left: 9.0, right: 5.0),
          child: InkWell(
              onTap: () {},
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Colors.white),
                  child: Column(children: [
                    Column(children: [
                      Container(
                          margin: const EdgeInsets.only(top: 0.0),
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                              image: DecorationImage(
                                  image: NetworkImage(product.imageUrl!),
                                  fit: BoxFit.cover))),
                      const SizedBox(height: 7.0),
                      Text(product.Location ?? 'flower',
                          style: const TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Varela',
                              fontSize: 14.0)),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              color: const Color(0xFFEBEBEB), height: 1.0)),
                      Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    value.removefavorite(
                                        product,
                                        AuthFirebaseHelper.authhelper
                                            .getCurrentUse());
                                  },
                                ),
                              ]))
                    ])
                  ])))),
    );
  }
}
