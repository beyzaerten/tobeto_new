import 'package:flutter/material.dart';
import 'package:tobeto_new/models/announcement_news_model.dart';

class AnnouncementContinue3 extends StatelessWidget {
  const AnnouncementContinue3({Key? key, required this.newsContinue})
      : super(key: key);
  final AnnouncementNewsModel newsContinue;

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: Text(newsContinue.title),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  // Geri dönme işlemi burada gerçekleştirilebilir
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close))
          ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                style: Theme.of(context).textTheme.titleSmall,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Herkes için Kodlama',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  TextSpan(
                    text:
                        ' eğitimini bitiren kişilerin katılabileceği kampüs buluşmamız 11 Ocak 2024 tarihindedir. Discord\'dan form paylaşılmıştır. Bu katılım formunu doldurmayan arkadaşların doldurması önemlidir.',
                  ),
                ],
              )),
              SizedBox(
                height: phoneHeight / 18,
              ),
              Text(
                "Not: Henüz eğitime hiç başlamamış adayların buluşması, eğitimlerini bitirdikten sonra 20 Şubat 2024 tarihinde yapılacaktır.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: phoneHeight / 18,
              ),
              Text("Sevgiler,"),
            ]),
      ),
    );
  }
}
