// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tobeto_new/models/education_model.dart';
import 'package:tobeto_new/widgets/home_screen_widget/lesson_video.dart';

class EducationalCard extends StatelessWidget {
  const EducationalCard({Key? key, required this.department}) : super(key: key);

  final EducationtLessonModel department;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? containerColor = isDarkMode
        ? Theme.of(context).appBarTheme.backgroundColor
        : Theme.of(context).appBarTheme.backgroundColor;

    BoxShadow shadow = isDarkMode
        ? BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.332),
            blurRadius: 10.0,
            offset: Offset(0, 1),
          )
        : BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.13),
            blurRadius: 29.0,
            offset: Offset(0, 1),
          );

    Color textColor = isDarkMode
        ? Color.fromARGB(166, 205, 205, 205)
        : Color.fromARGB(166, 26, 26, 26);

    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return Align(
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
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      // fotoğrafın kenarlarına radius verdim
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      child: AspectRatio(
                          aspectRatio: 4 / 2,
                          child: Image.network(
                            department.imageURL,
                            fit: BoxFit.fitWidth,
                          ))),
                  SizedBox(height: phoneHeight / 80),
                  Padding(
                    padding: EdgeInsets.only(left: phoneWidth / 40),
                    child: Text(
                      department.videoName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: phoneWidth / 40),
                    child: Text(
                      department.date!,
                      style: TextStyle(fontSize: 10, color: textColor),
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
                          borderRadius: BorderRadius.circular(32)),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => LessonVideo(
                                    videoUrl: department.videoUrl,
                                  )));
                        },
                        child: Text("Eğitime Git"),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: Size(phoneWidth / 1.3, 30), //////// HERE
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
    );
  }
}
