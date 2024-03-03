import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/constants/collection_name.dart';
import 'package:tobeto_new/models/test.dart';

class TestRepository {
  Future<TestModel> getTestInfoFromFirebase() async {
    final testFromDb = await firebaseFirestore
        .collection(Collections.QUESTIONS)
        .doc(DocumentId.QUESTIONS_DOC_ID)
        .get();

    final testInfo = TestModel.fromTestFirestore(testFromDb);
    return testInfo;
  }
}
