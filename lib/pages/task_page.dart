import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:taskie_app/pages/controller.dart';
import 'package:taskie_app/pages/task_details.dart';

import '../utils/date_utils.dart' as date_util;

class TaskPageCard extends StatelessWidget {
  final String taskTitle, startTime, endTime, imageUrl;
  final Color color;
  final double progressRate;
  const TaskPageCard(
      {Key? key,
      required this.taskTitle,
      required this.imageUrl,
      required this.color,
      required this.progressRate,
      required this.startTime,
      required this.endTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.0, left: 7.0, right: 10.0),
      padding: EdgeInsets.all(3.5),
      height: 74,
      width: MediaQuery.of(context).size.width / 1.51,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 7,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.2)),
          ]),
      child: Stack(children: [
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskTitle,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Progress',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(.8)),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      '${progressRate.ceil().toString()}%',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(.8)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Expanded(child: progressBar(color, progressRate)),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 13.33,
                      color: Colors.grey.withOpacity(.9),
                    ),
                    Text(
                      '${startTime}-${endTime}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.withOpacity(.9),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        Positioned(
            right: 15,
            top: 20,
            child: buildExpandedBox(
                color: Colors.white,
                children: [buildStackedImages(direction: TextDirection.rtl)])),
        Positioned(
            right: 2,
            top: 18,
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3.5),
                  shape: BoxShape.circle,
                  color: Colors.grey),
              child: Center(
                child: Text(
                  '+${urlImages.length.toString()}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 7,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ))
      ]),
    );
  }
}

Widget buildExpandedBox({
  required List<Widget> children,
  required Color color,
}) =>
    Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
final urlImages = [
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
];
Widget buildStackedImages({
  TextDirection direction = TextDirection.ltr,
}) {
  final double size = 20;
  final double xShift = 10;

  final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();

  return StackedWidgets(
    direction: direction,
    items: items,
    size: size,
    xShift: xShift,
  );
}

Widget progressBar(Color color, double progressRate) {
  return Container(
    height: 15.0,
    width: 130,
    child: Stack(
      children: [
        Container(
          height: 5,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color.withOpacity(.48),
          ),
        ),
        Container(
          height: 5,
          width: 130 * (progressRate / 100) + 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
        ),
        Positioned(
          top: -2,
          left: 130 * (progressRate / 100),
          child: Container(
            height: 7.5,
            width: 7.5,
            decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5)),
          ),
        )
      ],
    ),
  );
}

Widget buildImage(String urlImage) {
  final double borderSize = 1.5;

  return ClipOval(
    child: Container(
      padding: EdgeInsets.all(borderSize),
      color: Colors.white,
      child: ClipOval(
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

class StackedWidgets extends StatelessWidget {
  final List<Widget> items;
  final TextDirection direction;
  final double size;
  final double xShift;

  const StackedWidgets({
    Key? key,
    required this.items,
    this.direction = TextDirection.ltr,
    this.size = 5,
    this.xShift = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allItems = items
        .asMap()
        .map((index, item) {
          final left = size - xShift;

          final value = Container(
            width: size,
            height: size,
            child: item,
            margin: EdgeInsets.only(left: left * index),
          );

          return MapEntry(index, value);
        })
        .values
        .toList();

    return Stack(
      children: allItems,
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({
    Key? key,
  }) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  late ScrollController listScrollController1, listScrollController2;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 10.0 * currentDateTime.day);
    listScrollController1 = ScrollController();
    listScrollController2 = ScrollController();
    listScrollController1.addListener(() {
      listScrollController2.animateTo(listScrollController1.offset,
          duration: const Duration(milliseconds: 10), curve: Curves.linear);
    });
    listScrollController2.addListener(() {
      listScrollController1.animateTo(listScrollController2.offset,
          duration: const Duration(milliseconds: 10), curve: Curves.linear);
    });
    super.initState();
  }

  void dispose() {
    listScrollController1.dispose();
    listScrollController2.dispose();
    scrollController.dispose();
    super.dispose();
  }

  Widget titleView() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 15,
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              date_util.DateUtils.months[currentDateTime.month - 1],
              style: const TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              width: 40,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
            )
          ],
        ));
  }

  Widget hrizontalCapsuleListView() {
    return Container(
      width: width,
      height: 150,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index);
        },
      ),
    );
  }

  Widget capsuleView(int index) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentDateTime = currentMonthList[index];
            });
          },
          child: Container(
            width: 60,
            height: 103,
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            decoration: BoxDecoration(
                color: (currentMonthList[index].day != currentDateTime.day)
                    ? Colors.transparent
                    : Color(0xFF3D16D6),
                borderRadius: BorderRadius.circular(40),
                boxShadow: !(currentMonthList[index].day != currentDateTime.day)
                    ? [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 4,
                          spreadRadius: 4,
                          color: Color(0xFF3D16D6).withOpacity(.3),
                        )
                      ]
                    : null),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    currentMonthList[index].day.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? Colors.grey.withOpacity(.6)
                                : Colors.white),
                  ),
                  Text(
                    date_util.DateUtils
                        .weekdays[currentMonthList[index].weekday - 1],
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? Colors.grey.withOpacity(.6)
                                : Colors.white),
                  ),
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget topView() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            titleView(),
            hrizontalCapsuleListView(),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Tasks',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '10 task today',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.withOpacity(.6)),
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: const Color(0xFF3D16D6).withOpacity(.8),
                    child: Image.asset('assets/calendar.png'),
                  )
                ],
              ),
              FadeInDown(
                  duration: Duration(milliseconds: 500), child: topView()),
              const Text(
                'Daily task',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                        flex: 2,
                        child: Container(
                          height: size.height,
                          child: ListView.builder(
                              controller: listScrollController2,
                              itemCount: projectList2.length,
                              itemBuilder: (context, i) {
                                final time = projectList2[i];
                                return Container(
                                  height: size.height / 10,
                                  margin: EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 20.0,
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        time.starTime,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            color: Colors.grey.withOpacity(.6)),
                                      ),
                                      Text(time.endTime,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              color:
                                                  Colors.grey.withOpacity(.6)))
                                    ],
                                  ),
                                );
                              }),
                        )),
                    Flexible(
                        flex: 8,
                        child: Container(
                          child: ListView.builder(
                              controller: listScrollController1,
                              physics: BouncingScrollPhysics(),
                              itemCount: projectList.length,
                              itemBuilder: (context, i) {
                                final task = projectList[i];
                                return Container(
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 4,
                                            height: 40,
                                            color: Color(0xFF3D16D6),
                                          ),
                                          Container(
                                            height: 14,
                                            width: 14,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 3),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Color(0xFF3D16D6),
                                                    width: 2.5),
                                                shape: BoxShape.circle),
                                          ),
                                          Container(
                                            width: 4,
                                            height: 40,
                                            color: Color(0xFF3D16D6),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: FadeInRight(
                                          duration: Duration(milliseconds: 500),
                                          child: GestureDetector(
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => TaskDetails(
                                                          project: task,
                                                        ))),
                                            child: TaskPageCard(
                                                taskTitle: task.taskTitle,
                                                startTime: task.starTime,
                                                endTime: task.endTime,
                                                imageUrl: task.imageUrl,
                                                color: task.color,
                                                progressRate:
                                                    task.progressRate),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Color(0xFF3D16D6),
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 40.0,
        ),
      ),
    );
  }
}
