// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_event.dart';
import 'package:tobeto_new/blocs/profile/profile_state.dart';
import 'package:tobeto_new/screens/profile_screen.dart';
import 'package:tobeto_new/widgets/footer.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
      controllers['birthday']!.text =
          _selectedDate!.toLocal().toString().split(' ')[0];
    } else {
      setState(() {
        _selectedDate = null;
        // values['birthday'] = '';
      });
      controllers['birthday']!.text = '';
    }
    _selectedDate = pickedDate;
  }

  Map<String, TextEditingController> controllers = {
    'name': TextEditingController(),
    'surname': TextEditingController(),
    'phone': TextEditingController(),
    'birthday': TextEditingController(),
    'tcno': TextEditingController(),
    'eposta': TextEditingController(),
    'country': TextEditingController(),
    'city': TextEditingController(),
    'district': TextEditingController(),
    'street': TextEditingController(),
    'aboutmyself': TextEditingController(),
  };

  Map<String, String> values = {
    'name': '',
    'surname': '',
    'phone': '',
    'birthday': '',
    'tcno': '',
    'eposta': '',
    'country': '',
    'city': '',
    'district': '',
    'street': '',
    'aboutmyself': '',
  };

  submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<ProfileBloc>().add(SaveProfileDataEvent(
            name: values['name']!,
            surname: values['surname']!,
            phone: values['phone']!,
            birthday: values['birthday']!,
            tcno: values['tcno']!,
            eposta: values['eposta']!,
            country: values['country']!,
            city: values['city']!,
            district: values['district']!,
            street: values['street']!,
            aboutmyself: values['aboutmyself']!,
          ));
      print("isim ${controllers['name']}");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ProfileScreen()));
    }
  }

  String name = "";
  String surname = "";
  String phone = "";
  String birthday = "";
  String tcno = "";
  String eposta = "";
  String country = "";
  String city = "";
  String district = "";
  String street = "";
  String aboutmyself = "";

  @override
  void initState() {
    super.initState();

    // Sayfa oluşturulduğunda, varsa önceki değerleri controller'lara atayın
  }

  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      print("state durumu $state");
      if (state is ProfileInitial) {
        context.read<ProfileBloc>().add(GetProfileInformation());
      }

      if (state is ProfileSaveSuccess) {
        name = state.name;
        surname = state.surname;
        phone = state.phone;
        birthday = state.birthday;
        tcno = state.tcno;
        eposta = state.eposta;
        country = state.country;
        city = state.city;
        district = state.district;
        street = state.street;
        aboutmyself = state.aboutmyself;
        return Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: phoneHeight / 30,
              ),
              AspectRatio(
                aspectRatio: 16 / 6,
                child: Image.asset("lib/assets/images.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextFormField('Adınız*', 'name'),
                    buildTextFormField('Soyadınız*', 'surname'),
                    buildTextFormField('Telefon Numaranız*', 'phone'),
                    buildTextFormField(
                      'Doğum Tarihiniz*',
                      'birthday',
                    ),
                    buildTextFormField('TC Kimlik No*', 'tcno'),
                    buildTextFormField('E-posta*', 'eposta'),
                    buildTextFormField('Ülke*', 'country'),
                    buildTextFormField('İl*', 'city'),
                    buildTextFormField('İlçe*', 'district'),
                    buildTextFormField('Mahalle/Sokak', 'street', maxLines: 5),
                    buildTextFormField('Hakkımda', 'aboutmyself',
                        maxLines: 5, hintText: 'Kendini kısaca tanıt'),
                  ],
                ),
              ),
              SizedBox(
                height: phoneHeight / 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: phoneWidth / 12),
                child: ElevatedButton(
                  onPressed: submitForm,
                  child: Text("Kaydet",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: phoneHeight / 20,
              ),
              Footer()
            ],
          ),
        );
      }
      return Center(
        child: Text("data"),
      );
    });
  }

  Widget buildTextFormField(String label, String key,
      {int maxLines = 1, String? hintText}) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? textColor = isDarkMode
        ? const Color.fromARGB(255, 221, 221, 221)
        : Color.fromARGB(184, 88, 88, 88);
    if (key == 'birthday') {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  // controller: TextEditingController(text: values[key]),
                  // initialValue: _selectedDate!.toString(),
                  controller: controllers['birthday'],
                  onSaved: (newValue) => values[key] = newValue!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen $label giriniz';
                    }
                    return null;
                  },
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    hintText: hintText,
                    hintStyle: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(192, 108, 108, 108)),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(style: BorderStyle.solid),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            keyboardType: key == 'phone'
                ? TextInputType.phone
                : key == 'email'
                    ? TextInputType.emailAddress
                    : key == 'tcno'
                        ? TextInputType.number
                        : TextInputType.text,
            initialValue: key == 'name'
                ? name
                : key == 'surname'
                    ? surname
                    : key == 'phone'
                        ? phone
                        : key == 'tcno'
                            ? tcno
                            : key == 'birthday'
                                ? birthday
                                : key == 'eposta'
                                    ? eposta
                                    : key == 'country'
                                        ? country
                                        : key == 'city'
                                            ? city
                                            : key == 'district'
                                                ? district
                                                : key == 'street'
                                                    ? street
                                                    : key == 'aboutmyself'
                                                        ? aboutmyself
                                                        : "",
            // controller: controllers[key],
            onSaved: (newValue) => values[key] = newValue!,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lütfen $label giriniz';
              }
              return null;
            },
            maxLines: maxLines,

            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 13, color: Color.fromARGB(192, 108, 108, 108)),
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(style: BorderStyle.solid),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
