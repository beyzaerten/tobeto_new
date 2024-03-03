import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/announcement_news_bloc/announcement_news_event.dart';
import 'package:tobeto_new/blocs/announcement_news_bloc/announcement_news_state.dart';
import 'package:tobeto_new/repository/announcement_repository.dart';

class AnnouncementBloc
    extends Bloc<AnnouncementNewsEvent, AnnouncementNewsState> {
  AnnouncementBloc() : super(AnnouncementInitial()) {
    on<GetAnnouncementInformation>((event, emit) async {
      try {
        final announcementNewsInfo =
            await AnnouncementRepository().getAnnouncementInfoFromFirebase();
        print(announcementNewsInfo.announcementlist);
        emit(AnnouncementLoaded(
            announcementInfo: announcementNewsInfo.announcementlist));
      } catch (e) {
        emit(AnnouncementError());
      }
    });
  }
}
