import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_new/widgets/profile_edit_widget/settings.dart';
import 'package:tobeto_new/widgets/profile_edit_widget/abilities.dart';
import 'package:tobeto_new/widgets/profile_edit_widget/education.dart';
import 'package:tobeto_new/widgets/profile_edit_widget/language.dart';
import 'package:tobeto_new/widgets/profile_edit_widget/social_media.dart';
import 'package:tobeto_new/widgets/profile_edit_widget/user.dart';
import 'package:tobeto_new/widgets/profile_edit_widget/work.dart';
import 'package:tobeto_new/widgets/tobeto_drawer.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;

    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? textColor = isDarkMode
        ? Theme.of(context).textTheme.bodyMedium!.color
        : Theme.of(context).textTheme.bodyMedium!.color;

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: AspectRatio(
            aspectRatio: 18 / 2,
            child: isDarkMode
                ? Image.asset(
                    "lib/assets/tobeto-logo-dark.png",
                    alignment: Alignment.centerLeft,
                  )
                : Image.asset(
                    "lib/assets/tobeto.png",
                    alignment: Alignment.centerLeft,
                  ),
          ),
        ),
        endDrawer: TobetoDrawer(),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.person_outline,
                        color: textColor,
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.work_outline, color: textColor),
                    ),
                    Tab(
                      icon: Icon(Icons.book_outlined, color: textColor),
                    ),
                    Tab(
                      icon: Icon(Icons.workspace_premium_outlined,
                          color: textColor),
                    ),
                    Tab(
                      icon: Icon(
                        FontAwesomeIcons.globe,
                        size: 20,
                        color: isDarkMode
                            ? Colors.white
                            : Color.fromARGB(255, 83, 83, 83),
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        FontAwesomeIcons.language,
                        size: 23,
                        color: isDarkMode
                            ? Colors.white
                            : Color.fromARGB(255, 83, 83, 83),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.settings, color: textColor),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  User(),
                  Work(),
                  Education(),
                  Abilities(),
                  SocialMedia(),
                  Language(),
                  Settings(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
