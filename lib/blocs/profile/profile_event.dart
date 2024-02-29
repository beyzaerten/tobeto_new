abstract class ProfileEvent {}

class SaveProfileDataEvent extends ProfileEvent {
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

  SaveProfileDataEvent({
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
  });
}

class SaveProfileDataWorkEvent extends ProfileEvent {
  final String university;
  final String position;
  final String sector;
  final String workCity;
  final String startBusiness;
  final String endbusiness;
  final String jobDescription;

  SaveProfileDataWorkEvent(
      {required this.university,
      required this.position,
      required this.sector,
      required this.workCity,
      required this.startBusiness,
      required this.endbusiness,
      required this.jobDescription});
}

class SaveProfileDataEducationEvent extends ProfileEvent {
  List<Map<String, String>> selectedEducationInfo;
  SaveProfileDataEducationEvent({
    required this.selectedEducationInfo,
  });
}

class SaveProfileDataAbilitiesEvent extends ProfileEvent {
  final List<String> selectedAbilitiesList;

  SaveProfileDataAbilitiesEvent({required this.selectedAbilitiesList});
}

class SaveProfileDataSocialMediaEvent extends ProfileEvent {
  List<Map<String, String>> socialMediaLinks;

  SaveProfileDataSocialMediaEvent({required this.socialMediaLinks});
}

class SaveProfileDataLanguageEvent extends ProfileEvent {
  List<Map<String, String>> languages;
  SaveProfileDataLanguageEvent({
    required this.languages,
  });
}

class SaveProfileDataCertificateEvent extends ProfileEvent {
  final String certificateUrl;

  SaveProfileDataCertificateEvent({required this.certificateUrl});
}

class GetProfileInformation extends ProfileEvent {}
