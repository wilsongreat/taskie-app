import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:intl/intl.dart' show DateFormat;
import 'package:taskie_app/widgets/text_field_normal.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime(2019, 2, 3);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  DateTime _targetDateTime = DateTime(2019, 2, 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Schedule',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height / 2,
                  //   child: SfDateRangePicker(
                  //     view: DateRangePickerView.month,
                  //     showNavigationArrow: true,
                  //     enablePastDates: true,
                  //     todayHighlightColor: Colors.grey,
                  //     selectionColor: Color(0xFF3D16D6),
                  //     selectionMode: DateRangePickerSelectionMode.multiple,
                  //     monthViewSettings:
                  //         DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
                  //     headerStyle: DateRangePickerHeaderStyle(
                  //         textAlign: TextAlign.center,
                  //         textStyle: TextStyle(
                  //             fontSize: 20.0,
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.black)),
                  //   ),
                  // ),
                  FadeInDown(
                      duration: Duration(milliseconds: 500), child: calender()),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Add Task',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFieldNorm(
                          label: 'Project Name',
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          hintText: ''),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFieldNorm(
                          label: 'Description',
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          hintText: '',
                          maxLines: 10,
                          suffixIcon: SizedBox.shrink()),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget calender() {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 16.0),
      height: MediaQuery.of(context).size.height / 1.75,
      child: CalendarCarousel<Event>(
        onDayPressed: (DateTime date, List<Event> events) {
          this.setState(() => _currentDate = date);
        },
        iconColor: Colors.black,
        weekdayTextStyle: TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
        weekendTextStyle: TextStyle(
          color: Colors.black,
        ),
        headerMargin: EdgeInsets.symmetric(horizontal: 10.0),

        dayPadding: 4.0,
        weekDayMargin: EdgeInsets.symmetric(horizontal: 10),
        prevMonthDayBorderColor: Colors.grey,
        nextMonthDayBorderColor: Colors.grey,
        todayButtonColor: Colors.transparent,
        todayBorderColor: Color(0xFF3D16D6),
        todayTextStyle: TextStyle(color: Colors.black),
        thisMonthDayBorderColor: Colors.black,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
        customDayBuilder: (
          /// you can provide your own build function to make custom day containers
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
          /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
          /// This way you can build custom containers for specific days only, leaving rest as default.

          // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
          if (day.day == 15) {
            return;
          } else {
            return null;
          }
        },
        // maxSelectedDate: DateTime(2),
        weekFormat: false,
        height: 420.0,
        selectedDateTime: _currentDate,
        selectedDayBorderColor: Color(0xFF3D16D6),
        selectedDayButtonColor: Color(0xFF3D16D6),
        daysHaveCircularBorder: true,
        headerTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),

        /// null for not rendering any border, true for circular border, false for rectangular border
      ),
    );
  }
}
