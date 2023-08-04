import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_project/utils/Approuat.dart';
import 'package:weather_project/utils/colors.dart';
import 'package:weather_project/view/screens/onbordingcontant.dart';

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
    // AuthFirebaseHelper.authhelper.checkUser(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Color.fromARGB(255, 213, 220, 224),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 50, left: 17, right: 19),
                          height: 480,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(27),
                                bottomRight: Radius.circular(27),
                                topLeft: Radius.circular(27),
                                topRight: Radius.circular(27),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                    contents[i].image,
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(children: [
                            Row(
                              children: [
                                Text(
                                  contents[i].title,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          const  SizedBox(
                              height: 20,
                            ),
                            Text(
                              contents[i].discription,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.oswald(
                                fontSize: 18,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                            //left: 280,
                            //right: 200,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AppRouat.login);
                                  },
                                  child: const Text('Skip')),
                              Padding(
                                padding: const EdgeInsets.only(left: 200.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: List.generate(
                                    contents.length,
                                    (index) => buildDot(index, context),
                                  ),
                                ),
                              ),
                              currentIndex == contents.length - 1
                                  ? TextButton(
                                      onPressed: () {
                                        if (currentIndex ==
                                            contents.length - 1) {
                                          Navigator.pushNamed(
                                              context, AppRouat.login);
                                        }
                                      },
                                      child: const Text('Start'))
                                  : TextButton(
                                      onPressed: () {
                                        if (currentIndex ==
                                            contents.length - 1) {
                                          Navigator.pushNamed(
                                              context, AppRouat.login);
                                        }
                                        _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 2),
                                          curve: Curves.bounceIn,
                                        );
                                      },
                                      child: const Text('Next')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          HexColore.fromHex('#00539cff'),
        const  Color(0xFF2661FA),
          HexColore.fromHex('#EEA47FFF'),
        ]),
      ),
    );
  }
}
