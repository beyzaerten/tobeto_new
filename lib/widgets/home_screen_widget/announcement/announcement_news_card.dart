import 'package:flutter/material.dart';
import 'package:tobeto_new/models/announcement_news_model.dart';
import 'package:tobeto_new/widgets/home_screen_widget/announcement/announcement_continue.dart';
import 'package:tobeto_new/widgets/home_screen_widget/announcement/announcement_continue2.dart';
import 'package:tobeto_new/widgets/home_screen_widget/announcement/announcement_continue3.dart';

class AnnouncementNewsCard extends StatefulWidget {
  const AnnouncementNewsCard({Key? key, required this.news}) : super(key: key);
  final AnnouncementNewsModel news;

  @override
  _AnnouncementNewsCardState createState() => _AnnouncementNewsCardState();
}

class _AnnouncementNewsCardState extends State<AnnouncementNewsCard> {
  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;

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
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(
            height: phoneHeight / 30,
          ),
          Container(
            width: phoneWidth / 1.2,
            height: phoneHeight / 5.6,
            decoration: BoxDecoration(
              border: const Border(
                left: BorderSide(
                  color: Color.fromARGB(255, 24, 112, 14), // Yeşil renk
                  width: 5.0, // Border kalınlığı
                ),
              ),
              color: containerColor,
              boxShadow: [shadow],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: phoneHeight / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Duyuru",
                        style: TextStyle(
                            fontSize: 9,
                            color: isDarkMode
                                ? Color.fromARGB(255, 91, 214, 95)
                                : Color.fromARGB(255, 49, 127, 51)),
                      ),
                      Text(
                        "İstanbul Kodluyor",
                        style: TextStyle(
                            fontSize: 9,
                            color: isDarkMode
                                ? Color.fromARGB(255, 91, 214, 95)
                                : Color.fromARGB(255, 49, 127, 51)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: phoneHeight * 0.01,
                  ),
                  Text(
                    widget.news.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? Color.fromARGB(255, 239, 239, 239)
                            : Color.fromARGB(162, 49, 49, 49)),
                  ),
                  SizedBox(
                    height: phoneHeight / 21,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 16,
                        color: isDarkMode
                            ? const Color.fromARGB(255, 198, 198, 198)
                            : Color.fromARGB(136, 49, 49, 49),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        widget.news.date,
                        style: TextStyle(
                            fontSize: 11,
                            color: isDarkMode
                                ? const Color.fromARGB(255, 198, 198, 198)
                                : Color.fromARGB(145, 49, 49, 49)),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          if (widget.news.title == 'Mindset Anketi') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnnouncementContinue(
                                        newsContinue: widget.news,
                                      )),
                            );
                          } else if (widget.news.title ==
                              'Ocak Ayı Tercih Formu Bilgilendirmesi') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnnouncementContinue2(
                                        newsContinue: widget.news,
                                      )),
                            );
                          } else if (widget.news.title ==
                              '11 Ocak Kampüs Buluşması') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnnouncementContinue3(
                                        newsContinue: widget.news,
                                      )),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        child: Text(
                          "Devamını Oku",
                          style: TextStyle(
                            fontSize: 12,
                            color: isDarkMode
                                ? const Color.fromARGB(255, 198, 198, 198)
                                : Color.fromARGB(145, 49, 49, 49),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
