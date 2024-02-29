import 'package:tobeto_new/models/test.dart';

abstract class TestState {}

class TestInitial extends TestState {}

class GetTests extends TestState {
  final List<TestModel1> qa;

  GetTests({required this.qa});
}

class TestSaveFailure extends TestState {}
