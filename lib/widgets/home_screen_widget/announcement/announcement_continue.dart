import 'package:flutter/material.dart';
import 'package:tobeto_new/models/announcement_news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AnnouncementContinue extends StatelessWidget {
  const AnnouncementContinue({Key? key, required this.newsContinue})
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
                "Sevgili İstanbul Kodluyorlu,",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: phoneHeight / 18,
              ),
              Text(
                "Projemize akademik bakış açılarını da eklemek için aşağıdaki formu doldurmanı rica ederiz.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: phoneHeight / 18,
              ),
              TextButton(
                child: Text(
                  "https://form.jotform.com/232776381646062",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 156, 33, 243),
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  _launchURL('https://form.jotform.com/232776381646062');
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                ),
              ),
              SizedBox(
                height: phoneHeight / 18,
              ),
              Text(
                  "Not: Form sadece 1 kez doldurulabilmektedir. Önceden dolduranların tekrar doldurmasına gerek yoktur."),
              SizedBox(
                height: phoneHeight / 18,
              ),
              Text("Sevgiler,"),
            ]),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
