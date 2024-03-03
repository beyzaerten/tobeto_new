import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/constants/collection_name.dart';
import 'package:tobeto_new/models/catalog_model.dart';

class CatalogRepository {
  Future<CatalogModel> getDepartmentInfoFromFirebase() async {
    final catalogsFromDb = await firebaseFirestore
        .collection(Collections.CATALOG)
        .doc(DocumentId.CATALOG_DOC_ID)
        .get();

    final catalogCardInfo = CatalogModel.fromEducationFireStore(catalogsFromDb);
    return catalogCardInfo;
  }
}
