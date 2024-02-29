import 'package:flutter/material.dart';
import 'package:tobeto_new/models/test.dart';
import 'package:tobeto_new/widgets/footer.dart';
import 'package:tobeto_new/widgets/reviews_screen_widget/report_widget.dart';
import 'package:tobeto_new/widgets/reviews_screen_widget/sofware_test.dart';
import 'package:tobeto_new/widgets/tobeto_drawer.dart';

List<Test> tests = [
  Test(title: "Front End"),
  Test(title: "Full Stack"),
  Test(title: "Back End"),
  Test(title: "Microsoft SQL Server"),
  Test(title: "Masaüstü Programlama"),
];

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
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
          child: isDarkMode
              ? Image.asset(
                  "lib/assets/tobeto-logo-dark.png",
                  alignment: Alignment.centerLeft,
                )
              : Image.asset(
                  "lib/assets/tobeto.png",
                  alignment: Alignment.centerLeft,
                ),
        ),
      ),
      endDrawer: TobetoDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: phoneHeight / 100,
            ),
            Divider(color: Color.fromARGB(91, 200, 200, 200)),
            SizedBox(
              height: phoneHeight / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Yetkinlik",
                  style: TextStyle(
                      color: isDarkMode
                          ? Color.fromRGBO(181, 116, 250, 0.965)
                          : Color(0xFF9833FF),
                      fontSize: 1.35 * 14 + 1.2 * phoneWidth * 0.01),
                ),
                Text(
                  "lerini ücretsiz ölç,",
                  style:
                      TextStyle(fontSize: 1.35 * 14 + 1.2 * phoneWidth * 0.01),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "bilgi",
                  style: TextStyle(
                      color: isDarkMode
                          ? Color.fromRGBO(181, 116, 250, 0.965)
                          : Color(0xFF9833FF),
                      fontSize: 1.35 * 14 + 1.2 * phoneWidth * 0.01),
                ),
                Text(
                  "lerini test et.",
                  style:
                      TextStyle(fontSize: 1.35 * 14 + 1.2 * phoneWidth * 0.01),
                ),
              ],
            ),
            SizedBox(
              height: phoneHeight / 15,
            ),
            Container(
              width: phoneWidth / 1.1,
              height: phoneHeight / 3,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1357, 0.9838],
                  // transform: GradientRotation(209.21 * (3.14159265359 / 180.0)),
                  colors: [
                    Color(0xFF3C0B8C), // #3c0b8c
                    Color(0xFFE3A6FE), // #e3a6fe
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.13),
                    blurRadius: 29.0,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    topRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: phoneHeight / 25,
                  ),
                  Text(
                    "Tobeto İşte Başarı Modeli",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: phoneHeight / 40),
                  ),
                  SizedBox(
                    height: phoneHeight / 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: phoneWidth / 10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '80 soru ile yetkinliklerini ',
                        style: TextStyle(fontSize: phoneWidth / 20),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'ölç,',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' önerilen eğitimleri ',
                          ),
                          TextSpan(
                            text: 'tamamla,',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' rozetini ',
                          ),
                          TextSpan(
                            text: ' kazan.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // Satır aralarındaki yüksekliği belirle
                      strutStyle: const StrutStyle(
                        height: 2, // Satır aralarını ayarlayabilirsiniz
                      ),
                    ),
                  ),
                  SizedBox(
                    height: phoneHeight / 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ReportWidget()));
                      },
                      child: const Text(
                        "Raporu Görüntüle",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: phoneHeight / 25,
            ),
            Container(
              width: phoneWidth / 1.1,
              height: phoneHeight / 3,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1357, 0.9838],
                  // transform: GradientRotation(209.21 * (3.14159265359 / 180.0)),
                  colors: [
                    Color(0xFF1D0B8C), // #3c0b8c
                    Color(0xFFBDA6FE), // #e3a6fe
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.13),
                    blurRadius: 29.0,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    topRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: phoneHeight / 25,
                  ),
                  Text(
                    "Yazılımda Başarı Testi",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: phoneHeight / 40),
                  ),
                  SizedBox(
                    height: phoneHeight / 18,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: phoneWidth / 10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Çoktan seçmeli sorular ile teknik bilgilerini ',
                        style: TextStyle(fontSize: phoneWidth / 20),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'test et.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // Satır aralarındaki yüksekliği belirle
                      strutStyle: const StrutStyle(
                        height: 2, // Satır aralarını ayarlayabilirsiniz
                      ),
                    ),
                  ),
                  SizedBox(
                    height: phoneHeight / 15,
                  ),
                  const Icon(
                    Icons.arrow_downward_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: phoneHeight / 25,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: tests.length,
              itemBuilder: (ctx, index) => SofwareTest(
                test: tests[index],
              ),
            ),
            SizedBox(
              height: phoneHeight / 20,
            ),
            Container(
              width: phoneWidth / 35,
              height: phoneHeight / 5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                    0.0,
                    0.2708,
                    1.0
                  ],
                      colors: [
                    Color.fromARGB(219, 144, 0, 255), // #0093FF
                    Color(0xFF953DAC),
                    Colors.white,
                  ])),
            ),
            Text(
              " Aboneliğe özel ",
              style: TextStyle(
                  color: isDarkMode
                      ? Color.fromRGBO(181, 116, 250, 0.965)
                      : Color(0xFF9833FF),
                  fontSize: 1.35 * 14 + 1.2 * phoneWidth * 0.01),
            ),
            Text(
              "değerlendirme araçları için",
              style: TextStyle(fontSize: 1.35 * 14 + 1.2 * phoneWidth * 0.01),
            ),
            SizedBox(
              height: phoneHeight / 25,
            ),
            Container(
              width: phoneWidth / 1.1,
              height: phoneHeight / 3.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1357, 0.9838],
                  // transform: GradientRotation(209.21 * (3.14159265359 / 180.0)),
                  colors: [
                    Color(0xFF6E72FC), // #e3a6fe
                    Color(0xFFAD1DEB), // #3c0b8c
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.13),
                    blurRadius: 29.0,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    topRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: phoneHeight / 25,
                  ),
                  Text(
                    "Kazanım Odaklı Testler",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: phoneHeight / 40),
                  ),
                  SizedBox(
                    height: phoneHeight / 40,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: phoneWidth / 12),
                      child: Text(
                        "Dijital gelişim kategorisindeki eğitimlere başlamadan öncekonuyla ilgili bilgin ölçülür ve seviyene göre yönlendirilirsin.",
                        textAlign: TextAlign.center,
                        strutStyle: StrutStyle(height: 1.6),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                  SizedBox(
                    height: phoneHeight / 30,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: phoneHeight / 25,
            ),
            Container(
              width: phoneWidth / 1.1,
              // height: phoneHeight / 3.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1357, 0.9838],
                  // transform: GradientRotation(209.21 * (3.14159265359 / 180.0)),
                  colors: [
                    Color(0xFF6E72FC), // #e3a6fe
                    Color(0xFFAD1DEB), // #3c0b8c
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.13),
                    blurRadius: 29.0,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    topRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: phoneHeight / 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: phoneWidth / 10),
                    child: Text(
                      "Huawei Talent Interview Teknik Bilgi Sınavı*",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: phoneHeight / 40),
                    ),
                  ),
                  SizedBox(
                    height: phoneHeight / 40,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: phoneWidth / 12),
                      child: Column(
                        children: [
                          Text(
                            "Sertifika alabilmen için,",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: phoneWidth / 25,
                                fontStyle: FontStyle.italic),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: phoneWidth / 13),
                            child: const Text(
                              " eğitim yolculuğunun sonunda teknik yetkinliklerin ve kod bilgin ölçülür.",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              strutStyle: StrutStyle(height: 1.6),
                            ),
                          ),
                          SizedBox(
                            height: phoneHeight / 35,
                          ),
                          Text(
                            "4400+  soru | 30+ \nprogramlama dili \n4 zorluk seviyesi",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            strutStyle: StrutStyle(height: 1.6),
                          ),
                          SizedBox(
                            height: phoneHeight / 40,
                          ),
                          Text(
                            "*Türkiye Ar-Ge Merkezi tarafından tasarlanmıştır.",
                            style: TextStyle(
                                fontSize: phoneWidth / 35, color: Colors.white),
                            textAlign: TextAlign.start,
                          )
                        ],
                      )),
                  SizedBox(
                    height: phoneHeight / 30,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: phoneHeight / 20,
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
