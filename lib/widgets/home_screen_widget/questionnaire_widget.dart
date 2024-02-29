import 'package:flutter/material.dart';

class QuestionnaireWidget extends StatefulWidget {
  const QuestionnaireWidget({Key? key}) : super(key: key);

  @override
  _QuestionnaireWidgetState createState() => _QuestionnaireWidgetState();
}

class _QuestionnaireWidgetState extends State<QuestionnaireWidget> {
  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Anketlerim"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: phoneHeight / 40,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: phoneHeight / 2.8,
              decoration: BoxDecoration(
                color: Colors.grey[300], // #e6e6e6 renk karşılığı
                borderRadius: BorderRadius.circular(12.0), // 0.75em karşılığı
              ),
              width: phoneWidth / 1.1,
              child: Column(
                children: [
                  SizedBox(
                    height: phoneHeight / 40,
                  ),
                  AspectRatio(
                      aspectRatio: 4 / 2,
                      child: Image.asset("lib/assets/anket.png")),
                  SizedBox(
                    height: phoneHeight / 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Atanmış herhangi bir anketiniz bulunmamaktadır",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 107, 17, 122),
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
