import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  final DateTime rentalDate;  // rentalDate를 받음
  final DateTime returnDate;  // returnDate를 받음
  final Duration difference;
  final Function(DateTime, DateTime, Duration) onDatesChanged;

  CalendarWidget({required this.rentalDate, required this.returnDate, required this.difference, required this.onDatesChanged});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime? _selectedStartDay;
  DateTime? _selectedEndDay;
  Duration? _difference;
  DateTime _focusedDay = DateTime.now();
  

  @override
  void initState() {
    super.initState();
    _selectedStartDay = widget.rentalDate;
    _selectedEndDay = widget.returnDate;
    _difference = _selectedEndDay?.difference(_selectedStartDay!);
     _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2021, 3, 12),
      lastDay: DateTime.utc(2030, 3, 12),
      headerStyle: HeaderStyle(
        titleCentered: true,
        titleTextFormatter: (date, locale) =>
            DateFormat.yM(locale).format(date),
        formatButtonVisible: false,
        titleTextStyle: const TextStyle(
            fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      calendarStyle: CalendarStyle(
        rangeHighlightColor:
            const Color(0xFF0567ED).withOpacity(0.1),
        selectedDecoration: const BoxDecoration(
          color: const Color(0xFF0567ED),
          shape: BoxShape.circle,
        ),
      ),
      selectedDayPredicate: (day) {
        return isSameDay(day, _selectedStartDay) ||
            isSameDay(day, _selectedEndDay);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          if (_selectedStartDay == null || _selectedEndDay != null) {
            _selectedStartDay = selectedDay;
            _selectedEndDay = null;
          } else {
            if (selectedDay.isBefore(_selectedStartDay!)) {
              _selectedStartDay = selectedDay;
            } else {
              _selectedEndDay = selectedDay;
            }
            if (_selectedStartDay != null && _selectedEndDay != null) {
              _difference = _selectedEndDay!.difference(_selectedStartDay!);
              widget.onDatesChanged(
                  _selectedStartDay!, _selectedEndDay!, _difference!);
            }
          }
          // Focus on the first day of the selected range month
          _focusedDay = DateTime(selectedDay.year, selectedDay.month, 1);
        });
      },
      rangeStartDay: _selectedStartDay,
      rangeEndDay: _selectedEndDay,
    );
  }
}
