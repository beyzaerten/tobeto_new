import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_event.dart';
import 'package:tobeto_new/blocs/profile/profile_state.dart';
import 'package:tobeto_new/constants/collection_name.dart';
import 'package:tobeto_new/repository/profile_repository.dart';

final firebaseAuth = FirebaseAuth.instance;
final firebaseFirestore = FirebaseFirestore.instance;

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<SaveProfileDataEvent>((event, emit) async {
      try {
        final profileUser = firebaseAuth.currentUser;
        final document = firebaseFirestore
            .collection(Collections.USERS)
            .doc(profileUser!.uid);

        await document.update(
          {
            'name': event.name,
            'surname': event.surname,
            'phone': event.phone,
            'birthday': event.birthday,
            'tcno': event.tcno,
            'eposta': event.eposta,
            'country': event.country,
            'city': event.city,
            'district': event.district,
            'street': event.street,
            'aboutmyself': event.aboutmyself,
          },
        );

        // Başarılı bir şekilde güncellendiğinde bir state yayınlayabilirsiniz.
      } catch (e) {
        print("Firestore Hatası: $e");
        emit(ProfileSaveFailure());
      }
    });

    on<SaveProfileDataWorkEvent>((event, emit) async {
      try {
        final profileUser = firebaseAuth.currentUser;
        final document = firebaseFirestore
            .collection(Collections.USERS)
            .doc(profileUser!.uid);

        await document.update(
          {
            'university': event.university,
            'position': event.position,
            'sector': event.sector,
            'workCity': event.workCity,
            'startBusiness': event.startBusiness,
            'endbusiness': event.endbusiness,
            'jobDescription': event.jobDescription,
          },
        );

        // Başarılı bir şekilde güncellendiğinde bir state yayınlayabilirsiniz.
      } catch (e) {
        print("Firestore Hatası: $e");
        emit(ProfileSaveFailure());
      }
    });

    on<SaveProfileDataEducationEvent>((event, emit) async {
      try {
        final profileUser = firebaseAuth.currentUser;
        final document = firebaseFirestore
            .collection(Collections.USERS)
            .doc(profileUser!.uid);
        await document
            .update({'selectedEducationInfo': event.selectedEducationInfo});
      } catch (e) {
        print("Firestore Hatası: $e");
        emit(ProfileSaveFailure());
      }
    });

    on<SaveProfileDataAbilitiesEvent>((event, emit) async {
      try {
        final profileUser = firebaseAuth.currentUser;
        final document = firebaseFirestore
            .collection(Collections.USERS)
            .doc(profileUser!.uid);
        await document
            .update({'selectedAbilitiesList': event.selectedAbilitiesList});
      } catch (e) {
        print("Firestore Hatası: $e");
        emit(ProfileSaveFailure());
      }
    });

    on<SaveProfileDataSocialMediaEvent>((event, emit) async {
      try {
        final profileUser = firebaseAuth.currentUser;
        final document = firebaseFirestore
            .collection(Collections.USERS)
            .doc(profileUser!.uid);
        await document.update({'socialMediaLinks': event.socialMediaLinks});
      } catch (e) {
        print("Firestore Hatası: $e");
        emit(ProfileSaveFailure());
      }
    });

    on<SaveProfileDataLanguageEvent>((event, emit) async {
      try {
        final profileUser = firebaseAuth.currentUser;
        final document = firebaseFirestore
            .collection(Collections.USERS)
            .doc(profileUser!.uid);
        await document.update({'languages': event.languages});
      } catch (e) {
        print("Firestore Hatası: $e");
        emit(ProfileSaveFailure());
      }
    });

    on<SaveProfileDataCertificateEvent>((event, emit) async {
      try {
        final profileUser = firebaseAuth.currentUser;
        final document = firebaseFirestore
            .collection(Collections.USERS)
            .doc(profileUser!.uid);
        await document.update({'certificateUrl': event.certificateUrl});
      } catch (e) {
        print("Firestore Hatası: $e");
        emit(ProfileSaveFailure());
      }
    });

    on<GetProfileInformation>((event, emit) async {
      try {
        final userInfos = await ProfileRepository().getProfileInfo();
        print(userInfos.aboutmyself);

        emit(ProfileSaveSuccess(
            name: userInfos.name,
            surname: userInfos.surname,
            phone: userInfos.phone,
            birthday: userInfos.birthday,
            tcno: userInfos.tcno,
            eposta: userInfos.eposta,
            country: userInfos.country,
            city: userInfos.city,
            district: userInfos.district,
            street: userInfos.street,
            aboutmyself: userInfos.aboutmyself,
            university: userInfos.university,
            position: userInfos.position,
            sector: userInfos.sector,
            workCity: userInfos.workCity,
            startBusiness: userInfos.startBusiness,
            endbusiness: userInfos.endbusiness,
            jobDescription: userInfos.jobDescription,
            selectedEducationInfo: userInfos.selectedEducationInfo,
            selectedAbilitiesList: userInfos.selectedAbilitiesList,
            certificateUrl: userInfos.certificateUrl,
            socialMediaLinks: userInfos.socialMediaLinks,
            languages: userInfos.languages));
      } catch (e) {
        emit(ProfileSaveFailure());
      }
    });
  }
}
