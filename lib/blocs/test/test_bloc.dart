import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/test/test_event.dart';
import 'package:tobeto_new/blocs/test/test_state.dart';
import 'package:tobeto_new/repository/education_repository.dart';

final firebaseFirestore = FirebaseFirestore.instance;

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<SaveTestDataEvent>((event, emit) async {
      try {
        final tests = await TestRepository().getTestInfoFromFirebase();
        print("bu ne acaba ${tests.qa}");

        emit(GetTests(qa: tests.qa));
      } catch (e) {
        emit(TestSaveFailure());
        print("sorun ne $e");
      }
    });
  }
}
