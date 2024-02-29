import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/blocs/auth/auth_event.dart';
import 'package:tobeto_new/blocs/auth/auth_state.dart';
import 'package:tobeto_new/screens/profile_edit_screen.dart';
import 'package:tobeto_new/screens/profile_screen.dart';
import 'package:tobeto_new/screens/reviews_screen.dart';
import 'package:tobeto_new/widgets/contact_icons.dart';
import 'package:tobeto_new/widgets/exams_container.dart';
import 'package:tobeto_new/widgets/first_container.dart';
import 'package:tobeto_new/widgets/footer.dart';
import 'package:tobeto_new/widgets/home_screen_widget/education_widget.dart';
import 'package:tobeto_new/widgets/profile_edit_widget/education.dart';
import 'package:tobeto_new/widgets/tobeto_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? textColor = isDarkMode
        ? Theme.of(context).textTheme.bodyMedium!.color
        : Theme.of(context).textTheme.bodyMedium!.color;

    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AspectRatio(
          aspectRatio: 8 / 1,
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
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          print("state durumu $state");
          print(state);
          if (state is Authenticated) {
            context.read<AuthBloc>().add(GetInformation());
          }
          if (state is InformationState) {
            print(state.userName);
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: phoneHeight / 100,
                    ),
                    Divider(
                        color: isDarkMode
                            ? Color.fromARGB(255, 158, 158, 158)
                            : Color.fromARGB(91, 200, 200, 200)),
                    SizedBox(
                      height: phoneHeight / 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "TOBETO",
                          style: TextStyle(
                            color: isDarkMode
                                ? Color.fromRGBO(181, 116, 250, 0.965)
                                : Color.fromRGBO(136, 80, 196, 10),
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            // fontFamily: "Raleway"
                          ),
                        ),
                        Text(
                          "'ya hoş geldin",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Text(
                      state.userName,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FirstContainer(),
                    SizedBox(
                      height: 20,
                    ),
                    ExamsContainer(
                        examName: "Herkes İçin Kodlama 1B Değerlendirme Sınavı",
                        examClass: "Herkes İçin Kodlama 1A",
                        examTime: "45 Dakika"),
                    SizedBox(
                      height: phoneHeight / 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: phoneWidth / 15,
                          ),
                          Container(
                            width: phoneWidth / 1.4,
                            height: phoneHeight / 5.5,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.1, 1.0],
                                colors: [
                                  Color(0xFF1D0B8C),
                                  Color(0xFFBDA6FE),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.13),
                                  blurRadius: 29.0,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                  bottomLeft: Radius.circular(35)),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: phoneHeight / 25,
                                ),
                                Text(
                                  "Profilini Oluştur",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: phoneHeight / 40),
                                ),
                                SizedBox(
                                  height: phoneHeight / 40,
                                ),
                                SizedBox(
                                  width: phoneWidth / 1.6,
                                  height: phoneHeight / 22,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            Color.fromRGBO(136, 80, 196, 10),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileScreen()));
                                      },
                                      child: const Text(
                                        "Başla",
                                      )),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth / 15,
                          ),
                          Container(
                            width: phoneWidth / 1.4,
                            height: phoneHeight / 5.5,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.1, 1.0],
                                colors: [
                                  Color(0xFF0E0B93),
                                  Color(0xFF5EB6CA),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.13),
                                  blurRadius: 29.0,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                  bottomLeft: Radius.circular(35)),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: phoneHeight / 25,
                                ),
                                Text(
                                  "Kendini Değerlendir",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: phoneHeight / 40),
                                ),
                                SizedBox(
                                  height: phoneHeight / 40,
                                ),
                                SizedBox(
                                  width: phoneWidth / 1.6,
                                  height: phoneHeight / 22,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            Color.fromRGBO(136, 80, 196, 10),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ReviewsScreen()));
                                      },
                                      child: const Text(
                                        "Başla",
                                      )),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth / 15,
                          ),
                          Container(
                            width: phoneWidth / 1.4,
                            height: phoneHeight / 5.5,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.1, 1.0],
                                colors: [
                                  Color(0xFF3C0B8C),
                                  Color(0xFFE3A6FE),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.13),
                                  blurRadius: 29.0,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                  bottomLeft: Radius.circular(35)),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: phoneHeight / 25,
                                ),
                                Text(
                                  "Öğrenmeye Başla",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: phoneHeight / 40),
                                ),
                                SizedBox(
                                  height: phoneHeight / 40,
                                ),
                                SizedBox(
                                  width: phoneWidth / 1.6,
                                  height: phoneHeight / 22,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            Color.fromRGBO(136, 80, 196, 10),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Educations()));
                                      },
                                      child: const Text(
                                        "Başla",
                                      )),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth / 15,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: phoneHeight / 20,
                    ),
                    Footer()
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
