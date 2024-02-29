import 'package:cloud_firestore/cloud_firestore.dart';

class CatalogModel {
  final List<CatalogCardModel> catalogList;

  CatalogModel({required this.catalogList});

  factory CatalogModel.fromEducationFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final List<dynamic>? videosList = snapshot.data()?['catalogCard'];
    print("videosList: $videosList");
    if (videosList == null) {
      return CatalogModel(catalogList: []);
    }
    List<CatalogCardModel> videos = videosList.map((videoMap) {
      return CatalogCardModel(
        videoName: videoMap['videoName'] as String,
        videoUrl: videoMap['videoUrl'] as String,
        time: videoMap['time'] as String,
        imageURL: videoMap['imageUrl'] as String,
      );
    }).toList();

    return CatalogModel(catalogList: videos);
  }
}

class CatalogCardModel {
  final String videoName;
  final String videoUrl;
  final String imageURL;
  final String time;

  CatalogCardModel(
      {required this.videoName,
      required this.videoUrl,
      required this.imageURL,
      required this.time});
}
