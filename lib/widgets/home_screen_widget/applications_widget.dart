import 'package:flutter/material.dart';

class ApplicationsWidget extends StatefulWidget {
  const ApplicationsWidget({Key? key}) : super(key: key);

  @override
  _ApplicationsWidgetState createState() => _ApplicationsWidgetState();
}

class _ApplicationsWidgetState extends State<ApplicationsWidget> {
  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

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

    return Scaffold(
      appBar: AppBar(title: Text("Başvurularım")),
      body: Align(
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
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "İstanbul Kodluyor",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Bilgilendirme",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check,
                            size: 20,
                            color: Color.fromARGB(255, 65, 160, 68),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "İstanbul Kodluyor Başvuru Formu \nonaylandı",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check,
                            size: 20,
                            color: Color.fromARGB(255, 65, 160, 68),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "İstanbul Kodluyor Belge Yükleme \nFormu onaylandı",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: 0,
                    top: 10,
                    child: Container(
                      child: Card(
                        color: Color.fromARGB(255, 24, 112, 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0),
                            topRight: Radius.zero,
                            bottomRight: Radius.zero,
                          ),
                        ),
                        elevation: 5, // Kartın gölge efekti
                        child: Container(
                          width: 120,
                          height: 25,
                          child: Center(
                            child: Text(
                              'Kabul Edildi',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
