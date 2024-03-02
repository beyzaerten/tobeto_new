import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobeto_new/models/test.dart';

class TestQuestions extends StatefulWidget {
  const TestQuestions(
      {Key? key, required this.filteredQuestions, required this.test})
      : super(key: key);
  final List<TestModel1> filteredQuestions;
  final Test test;

  @override
  _TestQuestionsState createState() => _TestQuestionsState();
}

class _TestQuestionsState extends State<TestQuestions> {
  List<int> selectedAnswerIndices =
      List.filled(3, -1); // Her soru için ayrı indeks
  int correctCount = 0;
  int incorrectCount = 0;

  void isTrue(int questionIndex, int answerIndex, String answerString,
      String selectedAnswer) {
    if (answerString == selectedAnswer) {
      print("doğru");
      setState(() {
        correctCount++;
      });
    } else {
      print("yanlış");
      setState(() {
        incorrectCount++;
      });
    }

    setState(() {
      selectedAnswerIndices[questionIndex] = answerIndex;
    });
  }

  void resetTest() {
    setState(() {
      selectedAnswerIndices = List.filled(widget.filteredQuestions.length, -1);
      correctCount = 0;
      incorrectCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.test.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: phoneWidth / 20,
            ),
            ...widget.filteredQuestions.asMap().entries.map((entry) {
              int questionIndex = entry.key;
              TestModel1 test = entry.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: phoneWidth / 11, right: phoneWidth / 13),
                    child: Text(
                      test.question,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...test.answers.asMap().entries.map((answerEntry) {
                    int answerIndex = answerEntry.key;
                    String answer = answerEntry.value;
                    return Column(
                      children: [
                        SizedBox(
                          height: phoneHeight / 50,
                        ),
                        Center(
                          child: GestureDetector(
                              onTap: () {
                                isTrue(questionIndex, answerIndex,
                                    test.answerString, answer);
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                alignment: Alignment.centerLeft,
                                width: phoneWidth / 1.2,
                                // height: phoneHeight / 13,
                                decoration: BoxDecoration(
                                  color: selectedAnswerIndices[questionIndex] ==
                                          answerIndex
                                      ? Color.fromARGB(208, 166, 82, 255)
                                      : Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.13),
                                      blurRadius: selectedAnswerIndices[
                                                  questionIndex] ==
                                              answerIndex
                                          ? 25.0
                                          : 5.0,
                                      offset: Offset(
                                        0,
                                        selectedAnswerIndices[questionIndex] ==
                                                answerIndex
                                            ? 2
                                            : 1,
                                      ),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  answer,
                                  style: TextStyle(
                                      color: selectedAnswerIndices[
                                                  questionIndex] ==
                                              answerIndex
                                          ? Colors.white
                                          : Colors.black),
                                  softWrap: true,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              )),
                        ),
                      ],
                    );
                  }),
                  SizedBox(
                    height: 40,
                  )
                ],
              );
            }),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(208, 166, 82, 255),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              width: 200,
                              height: 170,
                              child: Stack(children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Doğru Sayısı: $correctCount",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      SizedBox(
                                        height: phoneHeight / 40,
                                      ),
                                      Text(
                                        "Yanlış Sayısı: $incorrectCount",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 1,
                                  right: 1,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    icon: Icon(Icons.close),
                                  ),
                                )
                              ]),
                            ),
                          );
                        },
                      );
                    },
                    child: Text("Testi Sonlandır"),
                  ),
                  SizedBox(
                    height: phoneHeight / 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(208, 166, 82, 255),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      resetTest();
                    },
                    child: Text("Baştan Başla"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: phoneHeight / 20,
            )
          ],
        ),
      ),
    );
  }
}
