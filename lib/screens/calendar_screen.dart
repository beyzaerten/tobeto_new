import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tobeto_new/models/calendar_model.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  var _selectedDate;
  var _focusedDay = DateTime.now();
  var selectedStr;

  List<Event> _getMyEvents(day) {
    if (day == null || !(day is DateTime)) {
      return [];
    }
    final DateFormat formatter = DateFormat("dd.MM.yyyy");
    String formattedStr = formatter.format(day);
    selectedStr = formattedStr;
    return events[formattedStr] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;

    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? textColor = isDarkMode
        ? Theme.of(context).textTheme.bodyMedium!.color
        : Theme.of(context).textTheme.bodyMedium!.color;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: phoneHeight / 30,
          ),
          TableCalendar(
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Colors.white // Dark mode'daysa beyaz renk
                        : const Color.fromARGB(
                            255, 65, 65, 65), // Dark mode değilse siyah renk
              ),
            ),
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(1990, 01, 01),
            lastDay: DateTime.utc(2050, 01, 01),
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            eventLoader: _getMyEvents,
            calendarStyle: CalendarStyle(
                weekendTextStyle: TextStyle(
                  color: isDarkMode
                      ? const Color.fromARGB(255, 197, 197, 197)
                      : const Color.fromARGB(
                          255, 57, 57, 57), // Hafta sonu günleri metin rengi
                ),
                markerSize: 8,
                markerDecoration: BoxDecoration(
                    color: isDarkMode ? Colors.white : Colors.black,
                    shape: BoxShape.circle)),
            daysOfWeekHeight: 80,
            startingDayOfWeek: StartingDayOfWeek.monday,
            onPageChanged: (focusedDay) {
              print(focusedDay);
            },
            onDaySelected: (selectedDay, focusedDay) {
              print(selectedDay);
              print(focusedDay);

              setState(() {
                _focusedDay = focusedDay;
                _selectedDate = selectedDay;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDate, day);
            },
          ),
          SizedBox(height: 18),
          if (_selectedDate != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Seçilen Tarih: ${DateFormat('dd.MM.yyyy').format(_selectedDate)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Etkinlikler:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildEventList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventList() {
    final eventsForSelectedDay = _getMyEvents(
      _selectedDate,
    );

    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? textColor = isDarkMode
        ? Theme.of(context).textTheme.bodyMedium!.color
        : Theme.of(context).textTheme.bodyMedium!.color;

    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_selectedDate != null && eventsForSelectedDay.isNotEmpty)
          Column(
            children: eventsForSelectedDay
                .map((event) => Container(
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? Color.fromARGB(255, 44, 44, 44)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: isDarkMode
                            ? [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.332),
                                  blurRadius: 10.0,
                                  offset: Offset(0, 1),
                                )
                              ]
                            : [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                      ),
                      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 26),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.clock,
                                  size: 19,
                                ),
                                SizedBox(
                                  width: phoneWidth / 60,
                                ),
                                Text(event.date),
                                SizedBox(
                                  width: phoneWidth / 60,
                                ),
                                Text(event.time)
                              ],
                            ),
                            SizedBox(
                              height: phoneHeight / 70,
                            ),
                            Text(event.title),
                            SizedBox(
                              height: phoneHeight / 70,
                            ),
                            Text(event.teacher),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              _selectedDate != null
                  ? 'Bu tarihe ait bir etkinlik bulunmamaktadır.'
                  : 'Lütfen bir tarih seçin.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
      ],
    );
  }
}
