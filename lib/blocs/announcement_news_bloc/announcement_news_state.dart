import 'package:tobeto_new/models/announcement_news_model.dart';

abstract class AnnouncementNewsState {}

class AnnouncementInitial extends AnnouncementNewsState {}

class AnnouncementLoading extends AnnouncementNewsState {}

class AnnouncementLoaded extends AnnouncementNewsState {
  final List<AnnouncementNewsModel> announcementInfo;

  AnnouncementLoaded({required this.announcementInfo});
}

class AnnouncementError extends AnnouncementNewsState {}
