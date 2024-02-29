import 'package:tobeto_new/models/catalog_model.dart';

abstract class CatalogState {}

class CatalogInitial extends CatalogState {}

class CatalogLoading extends CatalogState {}

class CatalogLoaded extends CatalogState {
  final List<CatalogCardModel> catalogInfo;

  CatalogLoaded({required this.catalogInfo});
}

class CatalogError extends CatalogState {}
