import 'package:cloud_firestore/cloud_firestore.dart';

class EducationtModel {
  final List<EducationtLessonModel> lessonList;

  EducationtModel({required this.lessonList});

  factory EducationtModel.fromEducationFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final List<dynamic>? videosList = snapshot.data()?['cards'];
    print("videosList: $videosList");
    if (videosList == null) {
      return EducationtModel(lessonList: []);
    }
    List<EducationtLessonModel> videos = videosList.map((videoMap) {
      return EducationtLessonModel(
        videoName: videoMap['videoName'] as String,
        videoUrl: videoMap['videoUrl'] as String,
        date: videoMap['date'] as String,
        imageURL: videoMap['imageUrl'] as String,
      );
    }).toList();

    return EducationtModel(lessonList: videos);
  }
}

class EducationtLessonModel {
  final String videoName;
  final String videoUrl;
  final String imageURL;
  final String? date;

  EducationtLessonModel({
    required this.videoName,
    required this.videoUrl,
    required this.imageURL,
    this.date,
  });
}
