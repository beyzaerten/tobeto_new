import 'package:flutter/material.dart';

class Report {
  String report;
  String point;
  Color color;
  Report({
    required this.report,
    required this.point,
    required this.color,
  });
}

List<Report> reports = [
  Report(
      report: "Yeni dünyaya hazırlanıyorum",
      point: "4.3",
      color: Color.fromARGB(255, 133, 160, 169)),
  Report(
      report: "Profesyonel duruşumu geliştiriyorum",
      point: "4.7",
      color: Color.fromARGB(255, 33, 121, 37)),
  Report(
      report: "Kendimi tanıyor ve yönetiyorum",
      point: "4.2",
      color: Color.fromARGB(255, 238, 195, 114)),
  Report(
      report: "Yaratıcı ve doğru çözümler geliştiriyorum",
      point: "4.1",
      color: Color.fromARGB(255, 102, 103, 171)),
  Report(
      report: "Kendimi sürekli geliştiriyorum",
      point: "4.7",
      color: Color.fromARGB(255, 226, 136, 182)),
  Report(
      report: "Başkaları ile birlikte çalışıyorum",
      point: "4.9",
      color: Color.fromARGB(255, 179, 142, 106)),
  Report(
      report: "Sonuç ve başarı odaklıyım",
      point: "4.3",
      color: Color.fromARGB(255, 215, 80, 120)),
  Report(
      report: "Anlıyorum ve anlaşılıyorum",
      point: "4.5",
      color: Color.fromARGB(255, 215, 127, 111)),
];
