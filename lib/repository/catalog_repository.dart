import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/models/catalog_model.dart';

class CatalogRepository {
  Future<CatalogModel> getDepartmentInfoFromFirebase() async {
    final catalogsFromDb = await firebaseFirestore
        .collection('catalog')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    final catalogCardInfo = CatalogModel.fromEducationFireStore(catalogsFromDb);
    return catalogCardInfo;
  }
}
