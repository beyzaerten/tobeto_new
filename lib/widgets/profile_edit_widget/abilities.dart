import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_event.dart';
import 'package:tobeto_new/blocs/profile/profile_state.dart';

import 'package:tobeto_new/screens/profile_screen.dart';
import 'package:tobeto_new/widgets/footer.dart';

class Abilities extends StatefulWidget {
  const Abilities({Key? key}) : super(key: key);

  @override
  _AbilitiesState createState() => _AbilitiesState();
}

class _AbilitiesState extends State<Abilities> {
  final _formKey = GlobalKey<FormState>();
  List<String> selectedAbilitiesList = [];

  submitForm() {
    BlocProvider.of<ProfileBloc>(context).add(SaveProfileDataAbilitiesEvent(
        selectedAbilitiesList: selectedAbilitiesList));
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

    List<String> abilitiesList = [
      "",
      "dart",
      "flutter",
      "sql",
      "javascript",
      "muhasebe",
      "pazarlama"
    ];

    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      print("state durumu $state");
      if (state is ProfileInitial) {
        context.read<ProfileBloc>().add(GetProfileInformation());
      }
      if (state is ProfileSaveSuccess) {
        print("liste verisi ${state.selectedAbilitiesList}");
        if (selectedAbilitiesList.isEmpty) {
          selectedAbilitiesList = state.selectedAbilitiesList;
        }
        return Stack(
          children: [
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
                        Text(
                          "Yetkinlik",
                          style: TextStyle(
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        DropdownButtonFormField(
                          // style: ,
                          items: abilitiesList.map((ability) {
                            return DropdownMenuItem(
                                value: ability,
                                child: Text(
                                  ability,
                                ));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedAbilitiesList.add(value.toString());
                              print(selectedAbilitiesList);
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Seçiniz",
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
                  SizedBox(
                    height: phoneHeight / 60,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: phoneWidth / 12),
                    child: ElevatedButton(
                      onPressed: () {
                        submitForm();
                      },
                      child: Text("Kaydet",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(left: 0, right: 0, bottom: 0, child: Footer()),
            // Seçilen yetkinlikleri gösteren kartlar
            Positioned(
              bottom: phoneHeight / 5 + 40,
              left: 20,
              right: 20,
              child: Container(
                height: phoneHeight / 3,
                child: ListView.builder(
                  itemCount: state.selectedAbilitiesList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: isDarkMode
                          ? Color.fromARGB(255, 63, 63, 63)
                          : Colors.white,
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(state.selectedAbilitiesList[index]),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  String deletedAbility =
                                      state.selectedAbilitiesList[index];
                                  state.selectedAbilitiesList.removeAt(index);

                                  // Firebase'den de silme işlemi
                                  String uid =
                                      FirebaseAuth.instance.currentUser!.uid;
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(uid)
                                      .update({
                                    'selectedAbilitiesList':
                                        FieldValue.arrayRemove(
                                            [deletedAbility]),
                                  });
                                });
                              },
                              icon: Icon(Icons.delete_outline_outlined))
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }
      return Center(
        child: Text("data"),
      );
    });
  }
}
