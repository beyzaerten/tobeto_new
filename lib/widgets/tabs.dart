import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;
    return Wrap(
      // alignment: WrapAlignment.start,
      // spacing: 30.0, // Aralardaki boşluk
      runSpacing: 8.0, // Satırlar arası boşluk
      children: [
        // SizedBox(height: phoneHeight / 30),
        InkWell(
          onTap: () {
            setState(() {
              tabIndex = 0;
            });
          },
          child: tabIndex == 0
              ? Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2),
                    ),
                  ),
                  child: Text(
                    "Başvurularım",
                    style: TextStyle(
                        fontSize: phoneWidth / 23, fontFamily: "Raleway"),
                  ),
                )
              : Text(
                  "Başvurularım",
                  style: TextStyle(
                      fontSize: phoneWidth / 23, fontFamily: "Raleway"),
                ),
        ),
        SizedBox(
          width: phoneWidth / 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              tabIndex = 1;
            });
          },
          child: tabIndex == 1
              ? Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2),
                    ),
                  ),
                  child: Text(
                    "Eğitimlerim",
                    style: TextStyle(
                        fontSize: phoneWidth / 23, fontFamily: "Raleway"),
                  ),
                )
              : Text(
                  "Eğitimlerim",
                  style: TextStyle(
                      fontSize: phoneWidth / 23, fontFamily: "Raleway"),
                ),
        ),
        SizedBox(
          width: phoneWidth / 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              tabIndex = 2;
            });
          },
          child: tabIndex == 2
              ? Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2),
                    ),
                  ),
                  child: Text(
                    "Duyuru ve Haberlerim",
                    style: TextStyle(
                        fontSize: phoneWidth / 23, fontFamily: "Raleway"),
                  ),
                )
              : Text(
                  "Duyuru ve Haberlerim",
                  style: TextStyle(
                      fontSize: phoneWidth / 23, fontFamily: "Raleway"),
                ),
        ),
        SizedBox(
          width: phoneWidth / 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              tabIndex = 3;
            });
          },
          child: tabIndex == 3
              ? Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2),
                    ),
                  ),
                  child: Text(
                    "Anketlerim",
                    style: TextStyle(
                        fontSize: phoneWidth / 23, fontFamily: "Raleway"),
                  ),
                )
              : Text(
                  "Anketlerim",
                  style: TextStyle(
                      fontSize: phoneWidth / 23, fontFamily: "Raleway"),
                ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: buildContent(tabIndex),
        ),
      ],
    );
  }

  Widget buildContent(int tabIndex) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;
    switch (tabIndex) {
      case 0:
        return Container(
          width: phoneWidth / 1.5,
          height: phoneHeight / 10,
          child: Text("Başvurularım"),
        );
      case 1:
        return Container(
          width: phoneWidth / 1.5,
          height: phoneHeight / 10,
          child: Text("Eğitimlerim"),
        );
      case 2:
        return Container(
          width: phoneWidth / 1.5,
          height: phoneHeight / 10,
          child: Text("Duyuru ve Haberlerim"),
        );
      case 3:
        return Container(
          width: phoneWidth / 1.5,
          height: phoneHeight / 10,
          child: Text("Anketlerim"),
        );
      default:
        return Container();
    }
  }
}
