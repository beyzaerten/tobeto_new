import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/announcement_news_bloc/announcement_news_bloc.dart';
import 'package:tobeto_new/blocs/announcement_news_bloc/announcement_news_event.dart';
import 'package:tobeto_new/blocs/announcement_news_bloc/announcement_news_state.dart';
import 'package:tobeto_new/widgets/home_screen_widget/announcement/announcement_news_card.dart';

class AnnouncementNewsWidget extends StatelessWidget {
  const AnnouncementNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Duyuru ve Haberlerim"),
      ),
      body: BlocBuilder<AnnouncementBloc, AnnouncementNewsState>(
          builder: (context, state) {
        print("AnnouncementNewsState---  $state");
        if (state is AnnouncementInitial) {
          print("Announcement  $state");

          context.read<AnnouncementBloc>().add(GetAnnouncementInformation());
        }
        if (state is AnnouncementLoaded) {
          print(state.announcementInfo.length);
          return ListView.builder(
              itemCount: state.announcementInfo.length,
              itemBuilder: (context, index) => AnnouncementNewsCard(
                    news: state.announcementInfo[index],
                  ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
