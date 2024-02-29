import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_event.dart';
import 'package:tobeto_new/blocs/profile/profile_state.dart';
import 'package:tobeto_new/screens/profile_edit_screen.dart';
import 'package:tobeto_new/widgets/footer.dart';
import 'package:tobeto_new/widgets/tobeto_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSaveSuccess = false;

  String name = "";
  String surname = "";
  String phone = "";
  String birthday = "";
  String eposta = "";
  String country = "";
  String city = "";
  String aboutmyself = "";

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetProfileInformation());
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Bağlantıyı açarken hata oluştu: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? textColor = isDarkMode
        ? Theme.of(context).textTheme.bodyMedium!.color
        : Theme.of(context).textTheme.bodyMedium!.color;
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          print("state durumu $state");
          // if (state is ProfileInitial) {
          //   context.read<ProfileBloc>().add(GetProfileInformation());
          // }
          if (state is ProfileSaveSuccess) {
            // print(state.aboutmyself);
            print("selectedAbilitiesList ${state.selectedAbilitiesList}");
            return SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProfileEditScreen()));
                          },
                          icon: Icon(
                            Icons.edit,
                            color: isDarkMode
                                ? textColor
                                : Color.fromARGB(193, 111, 111, 111),
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share_outlined,
                              color: isDarkMode
                                  ? textColor
                                  : Color.fromARGB(193, 111, 111, 111)))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Color.fromARGB(255, 81, 81, 81)
                          : Colors.white,
                      boxShadow: isDarkMode
                          ? [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.332),
                                blurRadius: 10.0,
                                offset: Offset(0, 1),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.13),
                                blurRadius: 29.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF8F94FB), // #8f94fb rengi
                                Color(0xFF4E54C8), // #4e54c8 rengi
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                AspectRatio(
                                    aspectRatio: 16 / 7,
                                    child:
                                        Image.asset("lib/assets/images.png")),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: phoneHeight / 40,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: phoneWidth / 20,
                              vertical: phoneHeight / 140),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? Color.fromARGB(255, 81, 81, 81)
                                      : Color.fromARGB(255, 255, 255, 255),
                                  boxShadow: isDarkMode
                                      ? [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.332),
                                            blurRadius: 10.0,
                                            offset: Offset(0, 1),
                                          ),
                                        ]
                                      : [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.14),
                                            blurRadius: 10.0,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("lib/assets/cv-name.png"),
                                ),
                              ),
                              SizedBox(
                                width: phoneWidth / 35,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Ad Soyad",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text("${state.name} ${state.surname}")
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: phoneWidth / 20,
                              vertical: phoneHeight / 130),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? Color.fromARGB(255, 81, 81, 81)
                                      : Color.fromARGB(255, 246, 246, 246),
                                  boxShadow: isDarkMode
                                      ? [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.332),
                                            blurRadius: 10.0,
                                            offset: Offset(0, 1),
                                          ),
                                        ]
                                      : [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.185),
                                            blurRadius: 29.0,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("lib/assets/cv-date.png"),
                                ),
                              ),
                              SizedBox(
                                width: phoneWidth / 35,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Doğum Tarihi",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(state.birthday)
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: phoneWidth / 20,
                              vertical: phoneHeight / 130),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? Color.fromARGB(255, 81, 81, 81)
                                      : Color.fromARGB(255, 246, 246, 246),
                                  boxShadow: isDarkMode
                                      ? [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.332),
                                            blurRadius: 10.0,
                                            offset: Offset(0, 1),
                                          ),
                                        ]
                                      : [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.185),
                                            blurRadius: 29.0,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("lib/assets/cv-mail.png"),
                                ),
                              ),
                              SizedBox(
                                width: phoneWidth / 35,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "E-Posta Adresi",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(state.eposta)
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: phoneWidth / 20,
                              vertical: phoneHeight / 130),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? Color.fromARGB(255, 81, 81, 81)
                                      : Color.fromARGB(255, 246, 246, 246),
                                  boxShadow: isDarkMode
                                      ? [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.332),
                                            blurRadius: 10.0,
                                            offset: Offset(0, 1),
                                          ),
                                        ]
                                      : [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.185),
                                            blurRadius: 29.0,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("lib/assets/cv-phone.png"),
                                ),
                              ),
                              SizedBox(
                                width: phoneWidth / 35,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Telefon Numarası",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(state.phone)
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: phoneHeight / 40,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: phoneWidth,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Color.fromARGB(255, 81, 81, 81)
                          : Colors.white,
                      boxShadow: isDarkMode
                          ? [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.332),
                                blurRadius: 10.0,
                                offset: Offset(0, 1),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.13),
                                blurRadius: 29.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hakkımda",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            Text(state.aboutmyself)
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: phoneWidth,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Color.fromARGB(255, 81, 81, 81)
                          : Colors.white,
                      boxShadow: isDarkMode
                          ? [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.332),
                                blurRadius: 10.0,
                                offset: Offset(0, 1),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.13),
                                blurRadius: 29.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Yetkinliklerim",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            Container(
                              height: 40,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.selectedAbilitiesList.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: 100,
                                    child: Card(
                                      color: isDarkMode
                                          ? Color.fromARGB(255, 72, 72, 72)
                                          : Colors.white,
                                      child: Center(
                                        child: Text(
                                          state.selectedAbilitiesList[index],
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: phoneWidth,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Color.fromARGB(255, 81, 81, 81)
                          : Colors.white,
                      boxShadow: isDarkMode
                          ? [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.332),
                                blurRadius: 10.0,
                                offset: Offset(0, 1),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.13),
                                blurRadius: 29.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Yabancı Dillerim",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            Container(
                              height: 80,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.languages.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: phoneWidth / 1.9,
                                    child: Card(
                                        color: isDarkMode
                                            ? Color.fromARGB(255, 72, 72, 72)
                                            : Colors.white,
                                        child: ListTile(
                                          title: Text(
                                            "${state.languages[index]['language']}",
                                            style: TextStyle(color: textColor),
                                          ),
                                          subtitle: Text(
                                              " ${state.languages[index]['level']}",
                                              style:
                                                  TextStyle(color: textColor)),
                                        )),
                                  );
                                },
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: phoneWidth,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Color.fromARGB(255, 81, 81, 81)
                          : Colors.white,
                      boxShadow: isDarkMode
                          ? [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.332),
                                blurRadius: 10.0,
                                offset: Offset(0, 1),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.13),
                                blurRadius: 29.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Medya Hesaplarım",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Container(
                              height: 70,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.socialMediaLinks.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: phoneWidth / 5.2,
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchURL(state.socialMediaLinks[index]
                                            ['link']!);
                                      },
                                      child: Card(
                                        color: isDarkMode
                                            ? Color.fromARGB(255, 72, 72, 72)
                                            : Colors.white,
                                        child: Center(
                                          child: ListTile(
                                            title: buildSocialMediaIcon(
                                                state.socialMediaLinks[index]
                                                    ['socialMedia']!),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: phoneWidth,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Color.fromARGB(255, 81, 81, 81)
                          : Colors.white,
                      boxShadow: isDarkMode
                          ? [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.332),
                                blurRadius: 10.0,
                                offset: Offset(0, 1),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.13),
                                blurRadius: 29.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tobeto Seviye Testlerim",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: phoneWidth,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Color.fromARGB(255, 81, 81, 81)
                          : Colors.white,
                      boxShadow: isDarkMode
                          ? [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.332),
                                blurRadius: 10.0,
                                offset: Offset(0, 1),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.13),
                                blurRadius: 29.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Yetkinlik Rozetlerim",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: phoneWidth,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Color.fromARGB(255, 81, 81, 81)
                          : Colors.white,
                      boxShadow: isDarkMode
                          ? [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.332),
                                blurRadius: 10.0,
                                offset: Offset(0, 1),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.13),
                                blurRadius: 29.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Eğitim Hayatım ve Deneyimlerim",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            Container(
                              height: 80,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.selectedEducationInfo.length,
                                  itemBuilder: (context, index) {
                                    // 'graduation' içindeki tarihi al

                                    return SizedBox(
                                      width: phoneWidth / 1.5,
                                      child: Card(
                                          color: isDarkMode
                                              ? Color.fromARGB(255, 72, 72, 72)
                                              : Colors.white,
                                          child: ListTile(
                                            leading: Text(
                                                "${state.selectedEducationInfo[index]['yearOfStart']} - ${state.selectedEducationInfo[index]['graduation']}",
                                                style: TextStyle(
                                                    color: textColor)),
                                            title: Text(
                                                "${state.selectedEducationInfo[index]['education']}",
                                                style: TextStyle(
                                                    color: textColor)),
                                            subtitle: Text(
                                                "${state.selectedEducationInfo[index]['school']} - ${state.selectedEducationInfo[index]['department']}",
                                                style: TextStyle(
                                                    color: textColor)),
                                          )),
                                    );
                                  }),
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: phoneHeight / 20,
                ),
                Footer(),
              ],
            ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildSocialMediaIcon(String socialMedia) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    IconData? iconData;
    switch (socialMedia) {
      case 'Instagram':
        iconData = FontAwesomeIcons.instagram;
        break;
      case 'Twitter':
        iconData = FontAwesomeIcons.twitter;
        break;
      case 'Github':
        iconData = FontAwesomeIcons.github;
        break;
      // Diğer sosyal medya platformları için gerekli case'leri ekleyebilirsiniz
      default:
    }

    return FaIcon(
      iconData,
      size: 40,
      color: isDarkMode
          ? Color.fromARGB(255, 255, 248, 248)
          : const Color.fromARGB(255, 46, 46, 46),
    );
  }
}
