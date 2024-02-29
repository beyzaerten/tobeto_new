import 'package:flutter/material.dart';
import 'package:tobeto_new/models/announcement_news_model.dart';

class AnnouncementContinue2 extends StatelessWidget {
  const AnnouncementContinue2({Key? key, required this.newsContinue})
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
              Text(
                "Tercih formunu bekleyen adaylarımızın discorddaki duyuruyu takip etmesini rica ederiz.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: phoneHeight / 18,
              ),
              Text(
                "Formu ulaşanların bugün saat 18.00'e kadar tercih formunu göndermeleri gerekmektedir. ",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: phoneHeight / 18,
              ),
              Text(
                  "Form ulaşmayan kişiler discord üzerinden gerekli bilgilendirmeyi ekibe ulaştırabilir."),
              SizedBox(
                height: phoneHeight / 18,
              ),
              Text("Sevgiler,"),
            ]),
      ),
    );
  }
}
