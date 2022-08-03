import 'package:flutter/material.dart';
import 'package:taskie_app/pages/home_screen.dart';
import 'package:taskie_app/pages/profile_page.dart';
import 'package:taskie_app/pages/schedule_page.dart';

import 'task_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final primaryColor = const Color(0xff3D16D6);

  final secondaryColor = const Color(0xff6D28D9);

  final accentColor = const Color(0xffffffff);

  final backgroundColor = const Color(0xffffffff);

  final errorColor = const Color(0xffEF4444);
  void _onItemTapped(int index, Widget page) {
    setState(() {
      _selectedIndex = index;
      currentPage = page;
    });
  }

  Widget currentPage = HomeScreen();
  final pages = [
    HomeScreen(),
    TaskPage(),
    SchedulePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(bucket: PageStorageBucket(), child: currentPage),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: SizedBox(
            height: 56,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBottomBar(
                      text: "Home",
                      icon: Icons.home_filled,
                      selected: _selectedIndex == 0,
                      onPressed: () {
                        _onItemTapped(0, HomeScreen());
                      }),
                  IconBottomBar(
                      text: "Event",
                      icon: Icons.event_note_outlined,
                      selected: _selectedIndex == 1,
                      onPressed: () {
                        _onItemTapped(1, TaskPage());
                      }),
                  IconBottomBar(
                      text: "Calendar",
                      icon: Icons.calendar_today_outlined,
                      selected: _selectedIndex == 2,
                      onPressed: () {
                        _onItemTapped(2, SchedulePage());
                      }),
                  IconBottomBar(
                      text: "Search",
                      icon: Icons.person,
                      selected: _selectedIndex == 3,
                      onPressed: () {
                        _onItemTapped(3, ProfilePage());
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? primaryColor : Colors.black54,
          ),
        ),
      ],
    );
  }
}
