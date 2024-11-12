import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: DateTime.now(), 
      firstDay: DateTime.utc(2021, 3, 12), 
      lastDay: DateTime.utc(2030, 3, 12),
      headerStyle: HeaderStyle(
        titleCentered: true,
        titleTextFormatter: (date, locale) => DateFormat.yM(locale).format(date),
          formatButtonVisible: false,
          titleTextStyle: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold
      ),
      
      ));
  }
}

/*onTap: () {
            // 페이지를 이전 페이지로 이동
            Navigator.pop(context);
          }, */