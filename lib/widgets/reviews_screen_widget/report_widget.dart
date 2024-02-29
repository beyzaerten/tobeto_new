import 'package:flutter/material.dart';
import 'package:tobeto_new/models/reviews_model.dart';
import 'package:tobeto_new/widgets/tobeto_drawer.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AspectRatio(
            aspectRatio: 18 / 2,
            child: Image.asset(
              "lib/assets/tobeto.png",
              alignment: Alignment.centerLeft,
            )),
      ),
      endDrawer: TobetoDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: phoneHeight / 35,
            ),
            const Center(
              child: Text(
                'Tobeto "İşte Başarı Modeli"',
                style: TextStyle(
                  color: Color(0xFF9933FF),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: phoneHeight / 120,
            ),
            Text(
              "Analiz Raporum",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: phoneHeight / 30,
            ),
            Container(
                width: phoneWidth / 1.1,
                height: phoneHeight / 1.5,
                decoration: BoxDecoration(
                  boxShadow: isDarkMode
                      ? [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.332),
                            blurRadius: 10.0,
                            offset: Offset(0, 1),
                          ),
                        ]
                      : [],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDarkMode
                        ? Color.fromARGB(255, 81, 81, 81)
                        : Color(0xfff8f3fb),
                    width: 1.0,
                  ),
                  color: isDarkMode
                      ? Color.fromARGB(255, 81, 81, 81)
                      : Color(0xfffbf9fc),
                ),
                child: Column(
                  children: [
                    AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset("lib/assets/degerlendirme.png")),
                    SizedBox(
                      height: phoneHeight / 35,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: reports.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(children: [
                              Row(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          5.0), // Köşe yuvarlama değeri
                                    ),
                                    color: reports[index].color,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                          width: 30.0,
                                          height: 20.0,
                                          child: Center(
                                              child: Text(
                                            reports[index].point,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: phoneWidth / 90,
                                  ),
                                  Expanded(
                                    child: Text(
                                      reports[index].report,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: phoneHeight / 130,
                              )
                            ]),
                          );
                        }),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
