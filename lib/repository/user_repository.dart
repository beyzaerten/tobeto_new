import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/models/user_model.dart';

class UserRepository {
  Future<UserModel> getUserInfo() async {
    final firestoreUser = FirebaseFirestore.instance;
    final userFromDb = await firestoreUser
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final userInfo = UserModel.fromFirestore(userFromDb);
    return userInfo;
  }
}
