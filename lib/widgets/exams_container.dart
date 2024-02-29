// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ExamsContainer extends StatelessWidget {
  const ExamsContainer({
    Key? key,
    required this.examName,
    required this.examClass,
    required this.examTime,
  }) : super(key: key);
  final String examName;
  final String examClass;
  final String examTime;

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.13),
            blurRadius: 29.0,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(phoneWidth / 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sınavlarım",
              style: TextStyle(
                fontSize: phoneWidth / 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: phoneHeight / 60,
            ),
            Container(
              width: phoneWidth / 2.7,
              height: phoneHeight / 4.2,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurRadius: 29.0,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(phoneHeight / 53),
                child: Stack(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        examName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: phoneHeight / 80,
                      ),
                      Text(
                        examClass,
                        style: TextStyle(fontSize: phoneWidth / 32),
                      ),
                      SizedBox(
                        height: phoneHeight / 80,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.access_alarm,
                              color: Color.fromRGBO(136, 80, 196, 10)),
                          SizedBox(
                            width: phoneWidth / 65,
                          ),
                          Text(examTime),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                      top: 5,
                      right: 0,
                      child: Image.asset("lib/assets/tick.png")),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
