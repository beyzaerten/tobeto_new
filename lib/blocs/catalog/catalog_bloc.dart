import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/catalog/catalog_event.dart';
import 'package:tobeto_new/blocs/catalog/catalog_state.dart';
import 'package:tobeto_new/repository/catalog_repository.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitial()) {
    on<FetchCatalogRequested>((event, emit) async {
      try {
        final catalogCardInfo =
            await CatalogRepository().getDepartmentInfoFromFirebase();
        print(catalogCardInfo.catalogList);
        emit(CatalogLoaded(catalogInfo: catalogCardInfo.catalogList));
      } catch (e) {
        emit(CatalogError());
        print("Hata");
        print(e);
      }
    });

    on<ResetCatalogEvent>((event, emit) async {
      try {
        emit(CatalogInitial());
      } catch (e) {
        emit(CatalogError());
        print("Hata");
        print(e);
      }
    });
  }
}
