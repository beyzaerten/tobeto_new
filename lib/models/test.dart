import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Test {
  String title;
  Test({
    required this.title,
  });
}

class TestModel {
  List<TestModel1> qa;
  TestModel({
    required this.qa,
  });

  factory TestModel.fromTestFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final List<dynamic>? testList = snapshot.data()?['qa'];
    print("test list: $testList");
    if (testList == null) {
      return TestModel(qa: []);
    }

    List<TestModel1> test = testList.map((testMap) {
      return TestModel1(
        id: testMap['id'] as String,
        question: testMap['question'] as String,
        answers: List<String>.from(testMap['answers'] ?? []),
        answerString: testMap['answerString'] as String,
      );
    }).toList();

    return TestModel(qa: test);
  }
}

class TestModel1 {
  String id;
  String question;
  String answerString;
  List<String> answers;
  TestModel1({
    required this.id,
    required this.question,
    required this.answers,
    required this.answerString,
  });
}
