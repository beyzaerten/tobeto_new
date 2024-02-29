import 'package:flutter/material.dart';
import 'package:tobeto_new/screens/login_screen/start_screen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: isDarkMode
                          ? const DecorationImage(
                              alignment: Alignment.topCenter,
                              image: AssetImage("lib/assets/d-entry.jpg"))
                          : const DecorationImage(
                              alignment: Alignment.topCenter,
                              image: AssetImage("lib/assets/2208183.jpg"))),
                  child: Column(children: [
                    SizedBox(
                      height: phoneHeight / 1.45,
                    ),
                    isDarkMode
                        ? Image.asset(
                            "lib/assets/tobeto-logo-dark.png",
                            width: phoneWidth / 2,
                          )
                        : Image.asset(
                            "lib/assets/tobeto.png",
                            width: phoneWidth / 2,
                          ),
                    SizedBox(
                      height: phoneHeight / 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "TOBETO",
                          style: TextStyle(
                            color: isDarkMode
                                ? Color.fromRGBO(181, 116, 250, 0.965)
                                : Theme.of(context).primaryColor,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "'ya hoş geldin!",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ]),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: isDarkMode
                          ? const DecorationImage(
                              alignment: Alignment.topCenter,
                              image: AssetImage("lib/assets/entry-dark.jpg"))
                          : const DecorationImage(
                              alignment: Alignment.topCenter,
                              image: AssetImage("lib/assets/entry-light.jpg"))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: phoneHeight / 1.45,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Yeni nesil öğrenme deneyimi ile ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color),
                            children: <TextSpan>[
                              TextSpan(
                                text: "TOBETO ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                              ),
                              TextSpan(
                                text: "kariyer yolculuğunda senin yanında!",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7))),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => StartScreen()));
                              },
                              child: Text(
                                "Hadi Başlayalım!",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  width: 12.0,
                  height: 12.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? const Color.fromARGB(255, 145, 33, 243)
                        : Colors.grey,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
