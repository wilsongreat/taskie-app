import 'package:flutter/material.dart';

class Projects {
  final String imageUrl, taskTitle, starTime, endTime;
  final double progressRate;
  final Color color;

  Projects({
    required this.imageUrl,
    required this.starTime,
    required this.endTime,
    required this.taskTitle,
    required this.progressRate,
    required this.color,
  });
}

final projectList = <Projects>[
  Projects(
      color: Color(0xFF47AAFF),
      taskTitle: 'Post Content On Instagram',
      imageUrl: 'assets/person1.png',
      progressRate: 74,
      starTime: '10.00am',
      endTime: '12.00pm'),
  Projects(
      color: Color(0xFFFEBE71),
      taskTitle: 'Post Advert On Instagram',
      imageUrl: 'assets/person2png.png',
      progressRate: 0,
      starTime: '9.00am',
      endTime: '9.30am'),
  Projects(
      color: Color(0xFF41D388),
      taskTitle: 'Filter Requests On Twitter',
      imageUrl: 'assets/person1.png',
      progressRate: 100,
      starTime: '1.00pm',
      endTime: '5.00pm'),
  Projects(
      color: Color(0xFF41D388),
      taskTitle: 'Filter Requests On Twitter',
      imageUrl: 'assets/person2png.png',
      progressRate: 100,
      starTime: '3.00pm',
      endTime: '5.00pm'),
  Projects(
      color: Color(0xFF47AAFF),
      taskTitle: 'Post Content On Instagram',
      imageUrl: 'assets/person1.png',
      progressRate: 74,
      starTime: '10.00am',
      endTime: '12.00pm'),
  Projects(
      color: Color(0xFFFEBE71),
      taskTitle: 'Post Advert On Instagram',
      imageUrl: 'assets/person2png.png',
      progressRate: 0,
      starTime: '9.00am',
      endTime: '9.30am'),
  Projects(
      color: Color(0xFF41D388),
      taskTitle: 'Filter Requests On Twitter',
      imageUrl: 'assets/person1.png',
      progressRate: 100,
      starTime: '1.00pm',
      endTime: '5.00pm'),
  Projects(
      color: Color(0xFF41D388),
      taskTitle: 'Filter Requests On Twitter',
      imageUrl: 'assets/person2png.png',
      progressRate: 100,
      starTime: '3.00pm',
      endTime: '5.00pm'),
];
final projectList2 = <Projects>[
  Projects(
      color: Color(0xFF47AAFF),
      taskTitle: 'Post Content On Instagram',
      imageUrl: 'assets/person1.png',
      progressRate: 74,
      starTime: '10.00am',
      endTime: '12.00pm'),
  Projects(
      color: Color(0xFFFEBE71),
      taskTitle: 'Post Advert On Instagram',
      imageUrl: 'assets/person2png.png',
      progressRate: 0,
      starTime: '9.00am',
      endTime: '9.30am'),
  Projects(
      color: Color(0xFF41D388),
      taskTitle: 'Filter Requests On Twitter',
      imageUrl: 'assets/person1.png',
      progressRate: 100,
      starTime: '1.00pm',
      endTime: '5.00pm'),
  Projects(
      color: Color(0xFF41D388),
      taskTitle: 'Filter Requests On Twitter',
      imageUrl: 'assets/person4.png',
      progressRate: 100,
      starTime: '3.00pm',
      endTime: '5.00pm'),
];
