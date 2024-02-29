import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String name;
  final String surname;
  final String phone;
  final String birthday;
  final String tcno;
  final String eposta;
  final String country;
  final String city;
  final String district;
  final String street;
  final String aboutmyself;
  final String university;
  final String position;
  final String sector;
  final String workCity;
  final String startBusiness;
  final String endbusiness;
  final String jobDescription;
  List<Map<String, String>> selectedEducationInfo;
  final List<String> selectedAbilitiesList;
  final String certificateUrl;
  List<Map<String, String>> socialMediaLinks;
  List<Map<String, String>> languages;

  Users({
    required this.name,
    required this.surname,
    required this.phone,
    required this.birthday,
    required this.tcno,
    required this.eposta,
    required this.country,
    required this.city,
    required this.district,
    required this.street,
    required this.aboutmyself,
    required this.university,
    required this.position,
    required this.sector,
    required this.workCity,
    required this.startBusiness,
    required this.endbusiness,
    required this.jobDescription,
    required this.selectedEducationInfo,
    required this.selectedAbilitiesList,
    required this.certificateUrl,
    required this.socialMediaLinks,
    required this.languages,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'surname': surname});
    result.addAll({'phone': phone});
    result.addAll({'birthday': birthday});
    result.addAll({'tcno': tcno});
    result.addAll({'eposta': eposta});
    result.addAll({'country': country});
    result.addAll({'city': city});
    result.addAll({'district': district});
    result.addAll({'street': street});
    result.addAll({'aboutmyself': aboutmyself});
    result.addAll({'university': university});
    result.addAll({'position': position});
    result.addAll({'sector': sector});
    result.addAll({'workCity': workCity});
    result.addAll({'startBusiness': startBusiness});
    result.addAll({'endmyself': endbusiness});
    result.addAll({'jobDescription': jobDescription});
    result.addAll({'selectedAbilitiesList': selectedAbilitiesList});

    return result;
  }

  factory Users.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data() as Map;
    List<Map<String, String>> socialMediaLinks = [];
    if (map['socialMediaLinks'] != null) {
      for (var socialMediaMap in map['socialMediaLinks']) {
        socialMediaLinks.add(Map<String, String>.from(socialMediaMap));
      }
    }

    List<Map<String, String>> languages = [];
    if (map['languages'] != null) {
      for (var languageMap in map['languages']) {
        languages.add(Map<String, String>.from(languageMap));
      }
    }

    List<Map<String, String>> selectedEducationInfo = [];
    if (map['selectedEducationInfo'] != null) {
      for (var educationMap in map['selectedEducationInfo']) {
        selectedEducationInfo.add(Map<String, String>.from(educationMap));
      }
    }

    return Users(
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      phone: map['phone'] ?? '',
      birthday: map['birthday'] ?? '',
      tcno: map['tcno'] ?? '',
      eposta: map['eposta'] ?? '',
      country: map['country'] ?? '',
      city: map['city'] ?? '',
      district: map['district'] ?? '',
      street: map['street'] ?? '',
      aboutmyself: map['aboutmyself'] ?? '',
      university: map['university'] ?? '',
      position: map['position'] ?? '',
      sector: map['sector'] ?? '',
      workCity: map['workCity'] ?? '',
      startBusiness: map['startBusiness'] ?? '',
      endbusiness: map['endbusiness'] ?? '',
      jobDescription: map['jobDescription'] ?? '',
      selectedEducationInfo: selectedEducationInfo,
      selectedAbilitiesList:
          List<String>.from(map['selectedAbilitiesList'] ?? []),
      certificateUrl: map['certificateUrl'] ?? '',
      socialMediaLinks: socialMediaLinks,
      languages: languages,
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) =>
      Users.fromFirestore(json.decode(source));
}
