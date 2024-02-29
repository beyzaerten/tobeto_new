import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/test/test_bloc.dart';
import 'package:tobeto_new/blocs/test/test_event.dart';
import 'package:tobeto_new/blocs/test/test_state.dart';
import 'package:tobeto_new/models/test.dart';
import 'package:tobeto_new/widgets/reviews_screen_widget/test_questions.dart';

class SofwareTest extends StatefulWidget {
  const SofwareTest({Key? key, required this.test}) : super(key: key);
  final Test test;

  @override
  State<SofwareTest> createState() => _SofwareTestState();
}

class _SofwareTestState extends State<SofwareTest> {
  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<TestBloc, TestState>(builder: (context, state) {
      print("state durumu $state");
      if (state is TestInitial) {
        context.read<TestBloc>().add(SaveTestDataEvent());
      }
      if (state is GetTests) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
          child: Card(
            elevation: 7,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.1357, 0.9838],
                      colors: [Color(0xFF1D0B8C), Color(0xFFBDA6FE)])),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: Row(children: [
                  Image.asset(
                    "lib/assets/platform-icon.png",
                    width: phoneWidth / 10,
                  ),
                  SizedBox(
                    width: phoneWidth / 30,
                  ),
                  Text(
                    widget.test.title,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black)),
                      onPressed: () {
                        if (widget.test.title == "Front End") {
                          List<TestModel1> filteredQuestions = state.qa
                              .where((question) => question.id == "1")
                              .toList();
                          print("filtreli liste ${filteredQuestions}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestQuestions(
                                  test: widget.test,
                                  filteredQuestions: filteredQuestions),
                            ),
                          );
                        }
                        if (widget.test.title == "Full Stack") {
                          List<TestModel1> filteredQuestions = state.qa
                              .where((question) => question.id == "2")
                              .toList();
                          print("filtreli liste ${filteredQuestions}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestQuestions(
                                  test: widget.test,
                                  filteredQuestions: filteredQuestions),
                            ),
                          );
                        }
                        if (widget.test.title == "Back End") {
                          List<TestModel1> filteredQuestions = state.qa
                              .where((question) => question.id == "3")
                              .toList();
                          print("filtreli liste ${filteredQuestions}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestQuestions(
                                  test: widget.test,
                                  filteredQuestions: filteredQuestions),
                            ),
                          );
                        }
                        if (widget.test.title == "Microsoft SQL Server") {
                          List<TestModel1> filteredQuestions = state.qa
                              .where((question) => question.id == "4")
                              .toList();
                          print("filtreli liste ${filteredQuestions}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestQuestions(
                                  test: widget.test,
                                  filteredQuestions: filteredQuestions),
                            ),
                          );
                        }
                        if (widget.test.title == "Masaüstü Programlama") {
                          List<TestModel1> filteredQuestions = state.qa
                              .where((question) => question.id == "5")
                              .toList();
                          print("filtreli liste ${filteredQuestions}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestQuestions(
                                  test: widget.test,
                                  filteredQuestions: filteredQuestions),
                            ),
                          );
                        }
                      },
                      child: Text("Başla"))
                ]),
              ),
            ),
          ),
        );
      } else
        return Center(
          child: Text("data"),
        );
    });
  }
}
