import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_new/constants/collection_name.dart';
import 'package:tobeto_new/models/users.dart';

class ProfileRepository {
  Future<Users> getProfileInfo() async {
    final firestoreUser = FirebaseFirestore.instance;
    final userFromDb = await firestoreUser
        .collection(Collections.USERS)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final profileInfo = Users.fromFirestore(userFromDb);
    return profileInfo;
  }
}
