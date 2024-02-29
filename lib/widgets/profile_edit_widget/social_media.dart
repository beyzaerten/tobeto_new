import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_event.dart';
import 'package:tobeto_new/blocs/profile/profile_state.dart';
import 'package:tobeto_new/widgets/footer.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({Key? key}) : super(key: key);

  @override
  _SocialMediaState createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  List<Map<String, String>> socialMediaLinks = [];

  final _formKey = GlobalKey<FormState>();
  String selectedSocialMedia = "";
  String link = "";

  submitForm() {
    BlocProvider.of<ProfileBloc>(context).add(
        SaveProfileDataSocialMediaEvent(socialMediaLinks: socialMediaLinks));
  }

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;

    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? textColor = isDarkMode
        ? const Color.fromARGB(255, 221, 221, 221)
        : Color.fromARGB(184, 88, 88, 88);
    Color? containerColor = isDarkMode
        ? Theme.of(context).appBarTheme.backgroundColor
        : Theme.of(context).appBarTheme.backgroundColor;

    List<String> socialMediaList = [
      "Instagram",
      "Twitter",
      "Linledln",
      "Behance",
      "Dribble",
      "Github"
    ];

    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      print("state durumu $state");
      if (state is ProfileInitial) {
        context.read<ProfileBloc>().add(GetProfileInformation());
      }
      if (state is ProfileSaveSuccess) {
        print("liste verisi ${state.socialMediaLinks}");
        if (socialMediaLinks.isEmpty) {
          socialMediaLinks = state.socialMediaLinks;
        }
        return Stack(children: [
          Form(
            key: _formKey,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: phoneHeight / 40,
                      ),
                      DropdownButtonFormField(
                        // value: selectedSocialMedia,
                        items: socialMediaList.map((media) {
                          return DropdownMenuItem(
                              value: media, child: Text(media));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedSocialMedia = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Seçiniz*",
                          contentPadding: EdgeInsets.all(5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(style: BorderStyle.solid),
                          ),
                        ),
                      ),
                      TextFormField(
                        onSaved: (newValue) => link = newValue!,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Lütfen Sosyal Medya Linki Giriniz";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "https://",
                            contentPadding: EdgeInsets.all(5),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(style: BorderStyle.solid))),
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
                        socialMediaLinks.add({
                          'socialMedia': selectedSocialMedia,
                          'link': link,
                        });
                        // Temizleme işlemi
                        _formKey.currentState?.reset();
                        selectedSocialMedia = "";
                        setState(() {});
                        submitForm();
                      }
                    },
                    child: Text("Kaydet",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              child: Container(
                width: phoneWidth,
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: socialMediaLinks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      color: isDarkMode
                          ? Color.fromARGB(255, 63, 63, 63)
                          : Colors.white,
                      child: ListTile(
                        title: Text(
                          "Sosyal Medya: ${state.socialMediaLinks[index]['socialMedia']!}",
                          style: TextStyle(
                              color: isDarkMode
                                  ? const Color.fromARGB(255, 221, 221, 221)
                                  : Colors.black),
                        ),
                        subtitle: Text(
                          "Link: ${state.socialMediaLinks[index]['link']}",
                          style: TextStyle(color: textColor),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: textColor,
                          ),
                          onPressed: () {
                            setState(() {
                              Map<String, String> deletedMedia =
                                  state.socialMediaLinks[index];
                              state.socialMediaLinks.removeAt(index);

                              // Firebase'den de silme işlemi
                              String uid =
                                  FirebaseAuth.instance.currentUser!.uid;
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(uid)
                                  .update({
                                'socialMediaLinks':
                                    FieldValue.arrayRemove([deletedMedia]),
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
