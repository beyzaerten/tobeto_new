import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: phoneHeight / 5,
      decoration: BoxDecoration(color: Color(0xFF9933FF)),
      child: Column(children: [
        SizedBox(
          height: phoneHeight / 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: phoneWidth / 4, child: Image.asset("lib/assets/tb.png")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    textStyle: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () {
                  launch('https://tobeto.com/iletisim');
                },
                child: Text("Bize Ulaşın")),
          ],
        ),
        SizedBox(
          height: phoneHeight / 40,
        ),
        const Text(
          "© 2022 Tobeto",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
