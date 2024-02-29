import 'package:cloud_firestore/cloud_firestore.dart';

class AnnouncementModel {
  final List<AnnouncementNewsModel> announcementlist;

  AnnouncementModel({required this.announcementlist});

  factory AnnouncementModel.fromAnnouncementFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final List<dynamic>? newsList = snapshot.data()?['news'];
    if (newsList == null) {
      return AnnouncementModel(announcementlist: []);
    }
    List<AnnouncementNewsModel> news = newsList.map((newsMap) {
      return AnnouncementNewsModel(
        title: newsMap['title'] as String,
        date: newsMap['date'] as String,
      );
    }).toList();
    return AnnouncementModel(announcementlist: news);
  }
}

class AnnouncementNewsModel {
  final String date;
  final String title;

  AnnouncementNewsModel({
    required this.date,
    required this.title,
  });
}
