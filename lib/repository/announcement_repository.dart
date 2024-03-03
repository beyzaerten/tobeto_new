import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/constants/collection_name.dart';
import 'package:tobeto_new/models/announcement_news_model.dart';

class AnnouncementRepository {
  Future<AnnouncementModel> getAnnouncementInfoFromFirebase() async {
    final announcementFromDb = await firebaseFirestore
        .collection(Collections.ANNOUNCEMENT)
        .doc(DocumentId.ANNOUNCEMENT_DOC_ID)
        .get();

    final announcementNewsInfo =
        AnnouncementModel.fromAnnouncementFireStore(announcementFromDb);
    return announcementNewsInfo;
  }
}
