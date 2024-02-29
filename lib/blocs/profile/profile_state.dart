abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileSaveSuccess extends ProfileState {
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
  String certificateUrl;
  List<Map<String, String>> socialMediaLinks;
  List<Map<String, String>> languages;

  ProfileSaveSuccess({
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
}

class ProfileSaveFailure extends ProfileState {}
