import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String taskTitle, startTime, endTime, imageUrl;
  final Color color;
  final double progressRate;
  const TaskCard(
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
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(10.0),
      height: 100,
      width: MediaQuery.of(context).size.width,
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
              radius: 25,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskTitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.withOpacity(.8)),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      progressRate.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
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
            right: 30,
            top: 30,
            child: buildExpandedBox(
                color: Colors.white,
                children: [buildStackedImages(direction: TextDirection.rtl)])),
        Positioned(
            right: 10,
            top: 30,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3.5),
                  shape: BoxShape.circle,
                  color: Colors.grey),
              child: Center(
                child: Text(
                  '+${urlImages.length.toString()}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
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
  final double size = 40;
  final double xShift = 20;

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
    height: 20.0,
    width: 150,
    child: Stack(
      children: [
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color.withOpacity(.48),
          ),
        ),
        Container(
          height: 10,
          width: progressRate + 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
        ),
        Positioned(
          top: -2,
          left: progressRate,
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3.5)),
          ),
        )
      ],
    ),
  );
}

Widget buildImage(String urlImage) {
  final double borderSize = 3.5;

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
    this.size = 20,
    this.xShift = 20,
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
