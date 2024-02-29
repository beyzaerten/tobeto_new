import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_event.dart';
import 'package:tobeto_new/blocs/profile/profile_state.dart';
import 'package:tobeto_new/widgets/footer.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  List<Map<String, String>> languages = [];
  final _formKey = GlobalKey<FormState>();

  List<String> selectedSocialMediaList = [];
  String selectedLanguage = "";
  String selectedLevel = "";

  submitForm() {
    BlocProvider.of<ProfileBloc>(context)
        .add(SaveProfileDataLanguageEvent(languages: languages));
  }

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;

    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? textColor = isDarkMode
        ? Theme.of(context).textTheme.bodyMedium!.color
        : Theme.of(context).textTheme.bodyMedium!.color;

    List<String> languageList = [
      "İngilizce",
      "Almanca",
      "Rusça",
      "Fransızca",
    ];

    List<String> level = [
      "Temel Seviye (A1,A2)",
      "Orta Seviye (B1,B2)",
      "İleri Seviye (C1,C2)",
      "Anadil"
    ];

    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      print("state durumu $state");
      if (state is ProfileInitial) {
        context.read<ProfileBloc>().add(GetProfileInformation());
      }
      if (state is ProfileSaveSuccess) {
        print("liste verisi ${state.languages}");
        if (languages.isEmpty) {
          languages = state.languages;
        }
        return Stack(children: [
          Form(
              key: _formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: phoneHeight / 40,
                        ),
                        DropdownButtonFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Lütfen Dil Seçiniz";
                            }
                            return null;
                          },
                          // value: selectedLanguage,
                          items: languageList.map((language) {
                            return DropdownMenuItem(
                                value: language, child: Text(language));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value.toString();
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Dil Seçiniz",
                            contentPadding: EdgeInsets.all(5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(style: BorderStyle.solid),
                            ),
                          ),
                        ),
                        DropdownButtonFormField(
                          // value: selectedLevel,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Lütfen Seviye Seçiniz";
                            }
                            return null;
                          },
                          items: level.map((level) {
                            return DropdownMenuItem(
                                value: level, child: Text(level));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedLevel = value.toString();
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Seviye Seçiniz",
                            contentPadding: EdgeInsets.all(5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(style: BorderStyle.solid),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: phoneWidth / 12),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState?.save();
                            languages.add({
                              'language': selectedLanguage,
                              'level': selectedLevel,
                            });
                            // Temizleme işlemi
                            _formKey.currentState?.reset();
                            selectedLanguage = "";
                            setState(() {});
                            submitForm();
                          }
                        },
                        child: Text("Kaydet",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ),
                ],
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              child: Container(
                width: phoneWidth,
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: isDarkMode
                          ? Color.fromARGB(255, 63, 63, 63)
                          : Colors.white,
                      child: ListTile(
                        title: Text(
                          "${state.languages[index]['language']}",
                          style: TextStyle(color: textColor),
                        ),
                        subtitle: Text(
                          " ${state.languages[index]['level']}",
                          style: TextStyle(
                              color: isDarkMode
                                  ? const Color.fromARGB(255, 223, 223, 223)
                                  : const Color.fromARGB(255, 43, 43, 43)),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: textColor,
                          ),
                          onPressed: () {
                            setState(() {
                              Map<String, String> deletedLanguage =
                                  state.languages[index];
                              state.languages.removeAt(index);

                              // Firebase'den de silme işlemi
                              String uid =
                                  FirebaseAuth.instance.currentUser!.uid;
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(uid)
                                  .update({
                                'languages':
                                    FieldValue.arrayRemove([deletedLanguage]),
                              });
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              )),
          Positioned(left: 0, right: 0, bottom: 0, child: Footer())
        ]);
      }
      return Center(
        child: Text("data"),
      );
    });
  }
}
