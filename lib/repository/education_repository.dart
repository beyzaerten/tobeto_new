import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/models/announcement_news_model.dart';
import 'package:tobeto_new/models/education_model.dart';
import 'package:tobeto_new/models/test.dart';

class EducationRepository {
  Future<EducationtModel> getDepartmentInfoFromFirebase() async {
    final educationsFromDb = await firebaseFirestore
        .collection('educations')
        .doc("X3wPr5nr55JaF8BYcPFY")
        .get();

    final departmentEducationsInfo =
        EducationtModel.fromEducationFireStore(educationsFromDb);
    return departmentEducationsInfo;
  }
}

class AnnouncementRepository {
  Future<AnnouncementModel> getAnnouncementInfoFromFirebase() async {
    final announcementFromDb = await firebaseFirestore
        .collection('announcement')
        .doc("PYu2RlKFIYeMtHIwPP43")
        .get();

    final announcementNewsInfo =
        AnnouncementModel.fromAnnouncementFireStore(announcementFromDb);
    return announcementNewsInfo;
  }
}

class TestRepository {
  Future<TestModel> getTestInfoFromFirebase() async {
    final testFromDb = await firebaseFirestore
        .collection('questions')
        .doc('kN3uk8M8nGNWHEviKwSF')
        .get();

    final testInfo = TestModel.fromTestFirestore(testFromDb);
    return testInfo;
  }
}
