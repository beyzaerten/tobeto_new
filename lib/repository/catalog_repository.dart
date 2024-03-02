import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/models/catalog_model.dart';

class CatalogRepository {
  Future<CatalogModel> getDepartmentInfoFromFirebase() async {
    final catalogsFromDb = await firebaseFirestore
        .collection('catalog')
        .doc("0UOMfUT6B1nP0rfyaCYH")
        .get();

    final catalogCardInfo = CatalogModel.fromEducationFireStore(catalogsFromDb);
    return catalogCardInfo;
  }
}
