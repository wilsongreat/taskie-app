import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:taskie_app/pages/controller.dart';
import 'package:taskie_app/widgets/search_bar.dart';

import '../widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          child: Image.asset('assets/user.png'),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi,',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            Text('Akorede',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/bell.png',
                            height: 25,
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xFFFAFAFA)),
                                  shape: BoxShape.circle,
                                  color: Color(0xFFD01313)),
                            ),
                            // child: CircleAvatar(
                            //   radius: 5,
                            //   backgroundColor: Color(0xFFD01313),
                            // ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                SearchInput(
                    textController: _searchController,
                    hintText: 'Search Project/Task'),
                SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Weekly Overview',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: FadeInLeft(
                    duration: Duration(milliseconds: 500),
                    child: Row(
                      children: [
                        ActivityCard(
                            'Running', '21 Projects', Color(0xFF47AAFF)),
                        SizedBox(
                          width: 10.0,
                        ),
                        ActivityCard(
                            'Pending', '14 Projects', Color(0xFFFEBE71)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: FadeInLeft(
                    duration: Duration(milliseconds: 500),
                    child: Row(
                      children: [
                        ActivityCard(
                            'Completed', '5 Projects', Color(0xFF41D388)),
                        SizedBox(
                          width: 10.0,
                        ),
                        ActivityCard('Cancel', '4 Projects', Color(0xFFFD3E6A)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Latest Projects',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'See More',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF5D5FEF)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: projectList.length,
                      itemBuilder: (context, i) {
                        final task = projectList[i];
                        return FadeInRight(
                          duration: Duration(milliseconds: 500),
                          child: TaskCard(
                              taskTitle: task.taskTitle,
                              progressRate: task.progressRate,
                              startTime: task.starTime,
                              endTime: task.endTime,
                              imageUrl: task.imageUrl,
                              color: task.color),
                        );
                      }),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
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

Widget ActivityCard(String taskTitle, String projects, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
    margin: EdgeInsets.only(bottom: 10),
    height: 80,
    width: 150,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(13.0)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.white),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              projects,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
        Container(
          height: 12,
          width: 12.0,
          margin: EdgeInsets.only(right: 20.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.white)),
          child: Icon(Icons.arrow_forward, size: 10, color: Colors.white),
        )
      ],
    ),
  );
}

// final imageUrl = [
//   'assets/person2png.png',
//   'assets/person2png.png',
//   'assets/person2png.png',
// ];
