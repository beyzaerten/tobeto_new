import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_event.dart';
import 'package:tobeto_new/blocs/profile/profile_state.dart';
import 'package:tobeto_new/widgets/footer.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController educationController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController yearOfStartController = TextEditingController();
  TextEditingController graduationController = TextEditingController();

  List<Map<String, String>> selectedEducationInfo = [];
  String education = "";
  String school = "";
  String department = "";
  String yearOfStart = "";
  String graduation = "";

  List<String> educationalStatus = [
    'Lisans',
    'Ön Lisans',
    'Yüksek Lisans',
    'Doktora'
  ];

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      final formattedYear = "${pickedDate.year}";
      controller.text = formattedYear;
    }
  }

  submitForm() {
    context.read<ProfileBloc>().add(SaveProfileDataEducationEvent(
        selectedEducationInfo: selectedEducationInfo));
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? textColor = isDarkMode
        ? const Color.fromARGB(255, 221, 221, 221)
        : Color.fromARGB(184, 88, 88, 88);
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      print("state durumu $state");
      if (state is ProfileInitial) {
        context.read<ProfileBloc>().add(GetProfileInformation());
      }
      if (state is ProfileSaveSuccess) {
        print(state.selectedEducationInfo);
        return Stack(children: [
          Form(
            key: _formKey,
            child: state.selectedEducationInfo.isNotEmpty
                ? ListView.builder(
                    itemCount: state.selectedEducationInfo.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        // SizedBox(
                        //   height: phoneHeight / 30,
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Eğitim Durumu*",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              DropdownButtonFormField(
                                value: state
                                        .selectedEducationInfo[index]
                                            ['education']!
                                        .isNotEmpty
                                    ? state.selectedEducationInfo[index]
                                        ['education']!
                                    : education,
                                items: educationalStatus.map((statu) {
                                  return DropdownMenuItem(
                                      value: statu, child: Text(statu));
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    education = value.toString();
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Lütfen Eğitim Durumu Seçiniz";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Seviye Seçiniz",
                                    contentPadding: EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid))),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Üniversite*",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                initialValue: state
                                        .selectedEducationInfo[index]['school']!
                                        .isNotEmpty
                                    ? state.selectedEducationInfo[index]
                                        ['school']!
                                    : school,
                                onSaved: (newValue) => school = newValue!,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Lütfen Okulunuzu Giriniz";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Kampüs 365",
                                    contentPadding: EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid))),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bölüm*",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                initialValue: state
                                        .selectedEducationInfo[index]
                                            ['department']!
                                        .isNotEmpty
                                    ? state.selectedEducationInfo[index]
                                        ['department']!
                                    : department,
                                onSaved: (newValue) => department = newValue!,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Lütfen Bölümünüzü Giriniz";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Yazılım",
                                    contentPadding: EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid))),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Başlangıç Yılı*",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: yearOfStartController,
                                // initialValue: state.selectedEducationInfo[index]
                                //     ['yearOfStart'],
                                readOnly: true,
                                onTap: () =>
                                    _selectDate(context, yearOfStartController),
                                onSaved: (newValue) => yearOfStart = newValue!,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Lütfen Başlangıç Yılınızı Seçiniz";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Başlangıç Yılınızı Seçiniz",
                                    contentPadding: EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid))),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mezuniyet Yılı*",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: graduationController,
                                readOnly: true,
                                onTap: () =>
                                    _selectDate(context, graduationController),
                                onSaved: (newValue) => graduation = newValue!,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Lütfen Mezuniyet Yılınızı Seçiniz";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Mezuniyet Yılınızı Seçiniz",
                                    contentPadding: EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid))),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: phoneHeight / 30,
                        ),
                        SizedBox(
                          width: phoneWidth / 1.2,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  selectedEducationInfo.add({
                                    'education': education,
                                    'school': school,
                                    'department': department,
                                    'yearOfStart': yearOfStart,
                                    'graduation': graduation
                                  });
                                  submitForm();
                                }
                              },
                              child: Text("Kaydet",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ),

                        SizedBox(
                          height: phoneHeight / 20,
                        ),
                        Footer()
                      ]);
                    },
                  )
                : SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        height: phoneHeight / 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Eğitim Durumu*",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            DropdownButtonFormField(
                              // value: education,
                              items: educationalStatus.map((statu) {
                                return DropdownMenuItem(
                                    value: statu, child: Text(statu));
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  education = value.toString();
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Lütfen Eğitim Durumu Seçiniz";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Seviye Seçiniz",
                                  contentPadding: EdgeInsets.all(15),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Üniversite*",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(184, 88, 88, 88),
                                  fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              initialValue: school,
                              onSaved: (newValue) => school = newValue!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Lütfen Okulunuzu Giriniz";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Kampüs 365",
                                  contentPadding: EdgeInsets.all(15),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid))),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bölüm*",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(184, 88, 88, 88),
                                  fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              initialValue: department,
                              onSaved: (newValue) => department = newValue!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Lütfen Bölümünüzü Giriniz";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Yazılım",
                                  contentPadding: EdgeInsets.all(15),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Başlangıç Yılı*",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(184, 88, 88, 88),
                                  fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: yearOfStartController,
                              // initialValue: state.selectedEducationInfo[index]
                              //     ['yearOfStart'],
                              readOnly: true,
                              onTap: () =>
                                  _selectDate(context, yearOfStartController),
                              onSaved: (newValue) => yearOfStart = newValue!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Lütfen Başlangıç Yılınızı Seçiniz";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Başlangıç Yılınızı Seçiniz",
                                  contentPadding: EdgeInsets.all(15),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mezuniyet Yılı*",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(184, 88, 88, 88),
                                  fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: graduationController,
                              readOnly: true,
                              onTap: () =>
                                  _selectDate(context, graduationController),
                              onSaved: (newValue) => graduation = newValue!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Lütfen Mezuniyet Yılınızı Seçiniz";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Mezuniyet Yılınızı Seçiniz",
                                  contentPadding: EdgeInsets.all(15),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid))),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: phoneHeight / 30,
                      ),
                      SizedBox(
                        width: phoneWidth / 1.2,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                selectedEducationInfo.add({
                                  'education': education,
                                  'school': school,
                                  'department': department,
                                  'yearOfStart': yearOfStart,
                                  'graduation': graduation
                                });
                                submitForm();
                              }
                            },
                            child: Text(
                              "Kaydet",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )),
                      ),
                      SizedBox(
                        height: phoneHeight / 20,
                      ),
                      Footer()
                    ]),
                  ),
          ),
        ]);
      }
      return Center(
        child: Text("data"),
      );
    });
  }
}
