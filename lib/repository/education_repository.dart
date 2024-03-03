import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/constants/collection_name.dart';
import 'package:tobeto_new/models/announcement_news_model.dart';
import 'package:tobeto_new/models/education_model.dart';

class EducationRepository {
  Future<EducationtModel> getDepartmentInfoFromFirebase() async {
    final educationsFromDb = await firebaseFirestore
        .collection(Collections.EDUCATIONS)
        .doc(DocumentId.EDUCATIONS_DOC_ID)
        .get();

    final departmentEducationsInfo =
        EducationtModel.fromEducationFireStore(educationsFromDb);
    return departmentEducationsInfo;
  }
}
