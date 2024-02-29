import 'package:flutter/material.dart';
import 'package:tobeto_new/models/catalog_model.dart';
import 'package:tobeto_new/widgets/home_screen_widget/lesson_video.dart';
import 'package:url_launcher/url_launcher.dart';

class CatalogContinue extends StatefulWidget {
  CatalogContinue({Key? key, required this.catalogCard}) : super(key: key);
  CatalogCardModel catalogCard;

  @override
  _CatalogContinueState createState() => _CatalogContinueState();
}

class _CatalogContinueState extends State<CatalogContinue> {
  String currentImage = "lib/assets/18456.jpg";
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;

    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? textColor = isDarkMode
        ? Theme.of(context).textTheme.bodyMedium!.color
        : Theme.of(context).textTheme.bodyMedium!.color;

    BoxShadow shadow = isDarkMode
        ? const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.332),
            blurRadius: 10.0,
            offset: Offset(0, 1),
          )
        : const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.13),
            blurRadius: 29.0,
            offset: Offset(0, 1),
          );

    Color? containerColor = isDarkMode
        ? Theme.of(context).appBarTheme.backgroundColor
        : Theme.of(context).appBarTheme.backgroundColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.catalogCard.videoName,
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: phoneWidth / 1.1,
            decoration: BoxDecoration(
              color: containerColor,
              boxShadow: [shadow],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: phoneHeight / 70,
                  ),
                  Container(
                    width: phoneWidth / 1.2,
                    height: phoneHeight / 3,
                    decoration: BoxDecoration(
                      color: containerColor,
                      boxShadow: [shadow],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            // fotoğrafın kenarlarına radius verdim
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            child: AspectRatio(
                              aspectRatio: 4 / 2,
                              child: Image.asset(
                                currentImage,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          SizedBox(height: phoneHeight / 80),
                          Padding(
                            padding: EdgeInsets.only(left: phoneWidth / 40),
                            child: Text(
                              currentText.isEmpty
                                  ? widget.catalogCard.videoName
                                  : currentText,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: phoneHeight / 40,
                          ),
                          Center(
                            child: Container(
                              width: phoneWidth / 1.3,
                              height: 30,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: [0.005, 1.0],
                                  colors: [
                                    Color(0xFF0E0B93),
                                    Color(0xFF5EB6CA),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (currentText ==
                                      "İletişimde Sorun Çıkartmanın Garantili Yolları") {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (ctx) => const LessonVideo(
                                          videoUrl:
                                              "lib/assets/videos/beyz.mp4"),
                                    ));
                                  }
                                  if (currentImage == "lib/assets/18456.jpg") {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) => LessonVideo(
                                                videoUrl: widget
                                                    .catalogCard.videoUrl)));
                                  }
                                  if (currentText ==
                                      "İletişimin Temelleri ve İletişim Tipleri") {
                                    _launchURL();
                                  }
                                },
                                child: Text("Eğitime Git"),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  minimumSize: Size(
                                    phoneWidth / 1.3,
                                    30,
                                  ), //////// HERE
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: phoneHeight / 40,
                  ),
                  MyAccordionTile(
                    title: 'Başlamadan Önce',
                    content: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentImage = "lib/assets/18456.jpg";
                            currentText = widget.catalogCard.videoName;
                          });
                        },
                        child: Text(
                          widget.catalogCard.videoName,
                          style: TextStyle(
                            color: isDarkMode
                                ? Color.fromARGB(255, 155, 101, 230)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  MyAccordionTile(
                    title: '1. Modül: Bilgilen',
                    content: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentImage = "lib/assets/8702.jpg";
                            currentText =
                                "İletişimin Temelleri ve İletişim Tipleri";
                          });
                        },
                        child: Text(
                          'İletişimin Temelleri ve İletişim Tipleri',
                          style: TextStyle(
                            color: isDarkMode
                                ? Color.fromARGB(255, 155, 101, 230)
                                : Colors.black,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentImage = "lib/assets/8722.jpg";
                            currentText =
                                "İletişim Engelleri Sizi Engellemesin";
                          });
                        },
                        child: Text(
                          'İletişim Engelleri Sizi Engellemesin',
                          style: TextStyle(
                            color: isDarkMode
                                ? Color.fromARGB(255, 155, 101, 230)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  MyAccordionTile(
                    title: '2. Modül: Uzmanına Kulak Ver',
                    content: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentImage = "lib/assets/11439.jpg";
                            currentText =
                                "İletişimde Sorun Çıkartmanın Garantili Yolları";
                          });
                        },
                        child: Text(
                          'İletişimde Sorun Çıkartmanın Garantili Yolları',
                          style: TextStyle(
                            color: isDarkMode
                                ? Color.fromARGB(255, 155, 101, 230)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url =
        'https://lms.tobeto.com/tobeto/eep/content/cdn-enocta/8702/start.html?project_path=https://lms.tobeto.com/tobeto/eep/content/cdn-enocta/8702/&compability=AICC&config_path=&AICC_URL=https://lms.tobeto.com/tobeto/eep/aicc2.aspx&pageID=&secParamLMS=C6S9SWH4r3LwryhSUcz6CZlioAAYKcdsLdpj1KZDxQQ%3d&AICC_SID=1826820&isSubtitle=0';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class MyAccordionTile extends StatefulWidget {
  final String title;
  final List<Widget> content;

  MyAccordionTile({
    required this.title,
    required this.content,
  });

  @override
  _MyAccordionTileState createState() => _MyAccordionTileState();
}

class _MyAccordionTileState extends State<MyAccordionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
      child: Theme(
        // ExpansionTile'ın temasını değiştirmek için
        data: ThemeData(
          dividerColor: Colors.white,
          unselectedWidgetColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Text(
            widget.title,
          ),
          collapsedTextColor: isDarkMode
              ? Colors.white
              : Colors.black, // Açılmamış durumdaki metin rengi
          textColor: isDarkMode
              ? Colors.white
              : Colors.black, // Açık durumdaki metin rengi
          iconColor: isDarkMode
              ? Colors.white
              : Colors.black, // Açılmamış durumdaki simge rengi
          collapsedIconColor: isDarkMode ? Colors.white : Colors.black,
          onExpansionChanged: (isExpanded) {
            setState(() {
              _isExpanded = isExpanded;
            });
          },
          initiallyExpanded: _isExpanded,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
