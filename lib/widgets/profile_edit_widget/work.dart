import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_event.dart';
import 'package:tobeto_new/blocs/profile/profile_state.dart';
import 'package:intl/intl.dart';
import 'package:tobeto_new/widgets/footer.dart';

class Work extends StatefulWidget {
  const Work({Key? key}) : super(key: key);

  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {
  final _formKey = GlobalKey<FormState>();

  submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<ProfileBloc>().add(SaveProfileDataWorkEvent(
          university: university,
          position: position,
          sector: sector,
          workCity: workCity,
          startBusiness: startBusiness,
          endbusiness: endbusiness,
          jobDescription: jobDescription));
    }
  }

  TextEditingController universityController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController sectorController = TextEditingController();
  TextEditingController workCityController = TextEditingController();
  TextEditingController startBusinessController = TextEditingController();
  TextEditingController endbusinessController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();

  String university = "";
  String position = "";
  String sector = "";
  String workCity = "";
  String startBusiness = "";
  String endbusiness = "";
  String jobDescription = "";

  Future<void> _selectDate(BuildContext context, bool isStartBusiness) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      String formattedDate = DateFormat('dd.MM.yyyy').format(pickedDate);
      setState(() {
        if (isStartBusiness) {
          startBusinessController.text = formattedDate;
        } else {
          endbusinessController.text = formattedDate;
        }
      });
    }
  }

  List<String> cities = ['Ankara', 'İstanbul', 'İzmir', 'Adana', 'Bursa'];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? textColor = isDarkMode
        ? const Color.fromARGB(255, 221, 221, 221)
        : Color.fromARGB(184, 88, 88, 88);
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        print("state durumu $state");
        if (state is ProfileInitial) {
          context.read<ProfileBloc>().add(GetProfileInformation());
        }
        if (state is ProfileSaveSuccess) {
          return Form(
            key: _formKey,
            child: ListView(children: [
              // SizedBox(
              //   height: phoneHeight / 45,
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kurum Adı*",
                      style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      initialValue: state.university,
                      // controller: universityController,
                      onSaved: (newValue) => university = newValue!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lütfen Bu Alanı Doldurunuz";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Kampüs 365",
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(style: BorderStyle.solid))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pozisyon*",
                      style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      initialValue: state.position,
                      // controller: positionController,
                      onSaved: (newValue) => position = newValue!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lütfen Bu Alanı Doldurunuz";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Front-End Developer",
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(style: BorderStyle.solid))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sektör*",
                      style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      initialValue: state.sector,
                      // controller: sectorController,
                      onSaved: (newValue) => sector = newValue!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lütfen Bu Alanı Doldurunuz";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Yazılım",
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(style: BorderStyle.solid))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Şehir Seçiniz*",
                      style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    DropdownButtonFormField(
                      items: cities.map((city) {
                        return DropdownMenuItem(value: city, child: Text(city));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          workCity = value!;
                        });
                      },
                      onSaved: (newValue) => workCity = newValue!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lütfen Şehir Seçiniz";
                        }
                        return null;
                      },
                      value: state.workCity.isEmpty ? null : state.workCity,
                      decoration: InputDecoration(
                        hintText: "İl Seçiniz",
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "İş Başlangıcı*",
                      style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => _selectDate(context, true),
                      child: AbsorbPointer(
                        child: TextFormField(
                          // initialValue: state.startBusiness,
                          controller: startBusinessController,
                          onSaved: (newValue) => startBusiness = newValue!,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Lütfen Tarih Seçiniz";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "gg.aa.yyyy",
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(style: BorderStyle.solid))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "İş Bitişi*",
                      style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => _selectDate(context, false),
                      child: AbsorbPointer(
                        child: TextFormField(
                          // initialValue: state.endbusiness,
                          controller: endbusinessController,
                          onSaved: (newValue) => endbusiness = newValue!,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Lütfen Tarih Seçiniz";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "gg.aa.yyyy",
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(style: BorderStyle.solid))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "İş Açıklaması",
                      style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      initialValue: state.jobDescription,
                      // controller: jobDescriptionController,
                      maxLines: 5,
                      onSaved: (newValue) => jobDescription = newValue!,

                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(style: BorderStyle.solid))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: phoneHeight / 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: phoneWidth / 12),
                child: ElevatedButton(
                    onPressed: () {
                      submitForm();
                    },
                    child: Text("Kaydet",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ),
              SizedBox(
                height: phoneHeight / 20,
              ),
              Footer()
            ]),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
