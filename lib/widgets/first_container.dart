import 'package:flutter/material.dart';

import 'package:tobeto_new/screens/catalog_screen.dart';
import 'package:tobeto_new/screens/home_screen.dart';
import 'package:tobeto_new/screens/profile_screen.dart';
import 'package:tobeto_new/screens/reviews_screen.dart';
import 'package:tobeto_new/widgets/home_screen_widget/announcement/announcement_news_widget.dart';
import 'package:tobeto_new/widgets/home_screen_widget/applications_widget.dart';
import 'package:tobeto_new/widgets/home_screen_widget/education_widget.dart';
import 'package:tobeto_new/widgets/home_screen_widget/questionnaire_widget.dart';
import 'package:tobeto_new/widgets/tabs.dart';

class FirstContainer extends StatefulWidget {
  const FirstContainer({Key? key}) : super(key: key);

  @override
  _FirstContainerState createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer> {
  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.13),
            blurRadius: 29.0,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(children: [
        SizedBox(
          height: phoneHeight / 30,
        ),
        AspectRatio(
            aspectRatio: 10 / 2, child: Image.asset("lib/assets/ik.png")),
        SizedBox(
          height: phoneHeight / 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: phoneWidth / 5),
          child: Text(
            "Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: phoneWidth / 25, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: phoneHeight / 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Aradığın",
              style: TextStyle(
                fontSize: phoneWidth / 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: phoneWidth / 70,
            ),
            Text(
              "\"",
              style: TextStyle(
                  fontSize: phoneWidth / 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 24, 253, 127)),
            ),
            Text(
              "İş",
              style: TextStyle(
                fontSize: phoneWidth / 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "\"",
              style: TextStyle(
                  fontSize: phoneWidth / 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 24, 253, 127)),
            ),
          ],
        ),
        Text(
          "Burada!",
          style: TextStyle(
            fontSize: phoneWidth / 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: phoneHeight / 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard("Başvurularım", [Colors.orange, Colors.red],
                ApplicationsWidget()),
            // SizedBox
            //   width: phoneWidth / 30,
            // ),
            CustomCard(
                "Eğitimlerim", [Colors.blue, Colors.indigo], Educations()),
          ],
        ),
        // SizedBox(
        //   height: phoneWidth / 30,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard("Duyuru ve Haberlerim", [Colors.pink, Colors.purple],
                AnnouncementNewsWidget()),
            // SizedBox(
            //   width: phoneWidth / 30,
            // ),
            CustomCard(
                "Anketlerim",
                [Color.fromARGB(255, 160, 224, 111), Colors.green],
                QuestionnaireWidget()),
          ],
        ),
        SizedBox(
          height: phoneHeight / 30,
        ),
      ]),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final List<Color> gradientColors;
  final Widget page;

  CustomCard(this.title, this.gradientColors, this.page);

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Container(
          width: phoneWidth / 2.3,
          height: phoneHeight / 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors,
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
