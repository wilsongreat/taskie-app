import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../widgets/text_field_normal.dart';
import 'controller.dart';

class TaskDetails extends StatefulWidget {
  final Projects project;
  const TaskDetails({Key? key, required this.project}) : super(key: key);

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  bool switchVal = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Task Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF3D16D6).withOpacity(.16)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          size: 17,
                          color: Color(0xFF3D16D6),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/edit.png',
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        'Edit task',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3D16D6)),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFieldNorm(
                  label: 'Project Name',
                  suffixIcon: SizedBox.shrink(),
                  width: size.width,
                  hintText: widget.project.taskTitle,
                  height: 50,
                  maxLines: 1),
              SizedBox(
                height: 10.0,
              ),
              TextFieldNorm(
                  label: 'Description',
                  height: 100,
                  width: size.width,
                  hintText: 'Some Description',
                  maxLines: 10,
                  suffixIcon: SizedBox.shrink()),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Assign team',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 50,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey.withOpacity(.05)),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        width: size.width / 1.2,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: projectList.length,
                            itemBuilder: (ctx, i) {
                              return Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    projectList[i].imageUrl,
                                    height: 24,
                                  ));
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: DottedBorder(
                        // radius: 12,
                        color: Colors.grey.withOpacity(.8),
                        strokeWidth: 2,
                        borderType: BorderType.Circle,
                        child: Icon(
                          Icons.add,
                          size: 24.0,
                          color: Colors.grey.withOpacity(.8),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Flexible(
                      flex: 5,
                      child: TextFieldNorm(
                          label: 'Start Date',
                          height: 50,
                          width: size.width,
                          hintText: '00-00-0000',
                          maxLines: 1,
                          suffixIcon: Icon(Icons.calendar_today))),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      flex: 5,
                      child: TextFieldNorm(
                          label: 'Start Time',
                          height: 50,
                          width: size.width,
                          hintText: widget.project.starTime,
                          maxLines: 1,
                          suffixIcon: Icon(Icons.access_time))),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Flexible(
                      flex: 5,
                      child: TextFieldNorm(
                          label: 'Due Date',
                          height: 50,
                          width: size.width,
                          hintText: '00-00-0000',
                          maxLines: 1,
                          suffixIcon: Icon(Icons.calendar_today))),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      flex: 5,
                      child: TextFieldNorm(
                          label: 'Due Time',
                          height: 50,
                          width: size.width,
                          hintText: widget.project.endTime,
                          maxLines: 1,
                          suffixIcon: Icon(Icons.access_time))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/clock.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Set Reminder',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Switch(
                    value: switchVal,
                    onChanged: (newValue) {
                      setState(() {
                        switchVal = !switchVal;
                      });
                    },
                    activeColor: Color(0xFF09CD86),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset('assets/attach.png'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Attached Files',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
