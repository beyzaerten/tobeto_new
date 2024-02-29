import 'package:flutter/material.dart';
import 'package:tobeto_new/models/catalog_model.dart';
import 'package:tobeto_new/widgets/home_screen_widget/lesson_video.dart';
import 'package:url_launcher/url_launcher.dart';

class CatalogContinue2 extends StatefulWidget {
  CatalogContinue2({Key? key, required this.catalogCard}) : super(key: key);
  CatalogCardModel catalogCard;

  @override
  _CatalogContinue2State createState() => _CatalogContinue2State();
}

class _CatalogContinue2State extends State<CatalogContinue2> {
  String currentImage = "lib/assets/katalog.jpg";
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
        title: Text(widget.catalogCard.videoName),
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
                                  _launchURL();
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
        'https://lms.tobeto.com/tobeto/eep/scorm_player.aspx?pageID=1149&kk=10224&ek=670&ebk=1149';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
