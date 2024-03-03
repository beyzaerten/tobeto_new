import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/auth/auth_event.dart';
import 'package:tobeto_new/blocs/auth/auth_state.dart';
import 'package:tobeto_new/constants/collection_name.dart';
import 'package:tobeto_new/repository/user_repository.dart';
import 'package:tobeto_new/screens/login_screen/login_screen.dart';

final firebaseAuth = FirebaseAuth.instance;
final firebaseFirestore = FirebaseFirestore.instance;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? errorMessage;
  AuthBloc() : super(Initial()) {
    firebaseAuth.authStateChanges().listen(
      (user) {
        if (user != null) {
          emit(Authenticated(user: user));
        } else {
          emit(NotAuthenticated(errorMessage: errorMessage));
        }
      },
    );

    on<Login>((event, emit) async {
      try {
        UserCredential userCredential =
            await firebaseAuth.signInWithEmailAndPassword(
                email: event.email, password: event.password);
      } on FirebaseAuthException catch (e) {
        errorMessage = e.message;
        NotAuthenticated(errorMessage: e.message);
        print("hatanın sebebi ${e.message}");
      }
    });

    on<Register>((event, emit) async {
      try {
        UserCredential userCredential =
            await firebaseAuth.createUserWithEmailAndPassword(
                email: event.email, password: event.password);

        await firebaseFirestore
            .collection(Collections.USERS)
            .doc(userCredential.user!.uid)
            .set({
          "email": event.email,
          "username": event.username,
          "registerDate": DateTime.now()
        });
      } on FirebaseAuthException catch (e) {}
    });

    // on<ChangePassword>((event, emit) async {
    //   try {
    //     User? user = firebaseAuth.currentUser;

    //     if (user != null) {
    //       await user.updatePassword(event.newPassword);
    //       emit(PasswordChangedSuccessfully());
    //     } else {
    //       emit(PasswordChangeFailed("Kullanıcı bulunamadı"));
    //     }
    //   } on FirebaseAuthException catch (e) {
    //     print("Hata: $e");
    //     emit(PasswordChangeFailed(e.message!));
    //   }
    // });

    on<Logout>((event, emit) async {
      await firebaseAuth.signOut();
      emit(AuthLoggedOut());
      print("çıkış yapıldı");
    });

    on<GetInformation>((event, emit) async {
      final userInfos = await UserRepository().getUserInfo();
      print(userInfos.userName);
      emit(InformationState(userName: userInfos.userName));
    });
  }
}
