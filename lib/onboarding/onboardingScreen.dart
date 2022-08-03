import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taskie_app/auth/login_screen.dart';
import 'package:taskie_app/widgets/my_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int selectedIindex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  !(selectedIindex == 2)
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Skip',
                            style: TextStyle(
                                color: Color(0xFF3D16D6),
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.8,
                    child: PageView.builder(
                        controller: _controller,
                        itemCount: OnBoardScreenList.length,
                        onPageChanged: (index) {
                          setState(() {
                            selectedIindex = index;
                          });
                        },
                        itemBuilder: (context, i) {
                          final screen = OnBoardScreenList[i];
                          return OnBoardScreen(
                              index: i,
                              imageUrl: screen.imageUrl,
                              label: screen.label);
                        }),
                  ),
                ],
              ),
              !(selectedIindex == 2)
                  ? SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: ScrollingDotsEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          activeDotColor: Color(0xFF3D16D6),
                          dotColor: Color(0xFF3D16D6).withOpacity(0.68)))
                  : SizedBox.shrink(),
              Column(
                children: [
                  !(selectedIindex == 2)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            !(selectedIindex == 0)
                                ? FadeIn(
                                    duration: Duration(milliseconds: 200),
                                    child: GestureDetector(
                                      onTap: () {
                                        _controller.previousPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFE5E5E5),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                offset: Offset(0, 4),
                                                blurRadius: 5,
                                              )
                                            ]),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              size: 20.0,
                                              color: Color(0xFF3D16D6),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                : SizedBox.shrink(),
                            FadeIn(
                                duration: Duration(milliseconds: 200),
                                child: GestureDetector(
                                  onTap: () {
                                    _controller.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 80.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF3D16D6),
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            offset: Offset(0, 4),
                                            blurRadius: 5,
                                          )
                                        ]),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Next',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 15.0,
                                        )
                                      ],
                                    )),
                                  ),
                                ))
                          ],
                        )
                      : FadeIn(
                          duration: Duration(milliseconds: 300),
                          child: MyButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen())),
                            width: null,
                            text: 'Get Started',
                          )),
                  SizedBox(
                    height: 30.0,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

final OnBoardScreenList = <OnBoardScreen>[
  OnBoardScreen(
    index: 0,
    imageUrl: 'assets/images/Completed task _Isometric 1.png',
    label: 'Organize your \nday',
  ),
  OnBoardScreen(
    index: 1,
    imageUrl: 'assets/images/Completed task2.png',
    label: 'All things \ndone',
  ),
  OnBoardScreen(
    index: 2,
    imageUrl: 'assets/images/Completed task3.png',
    label: 'Unlimited task \nlist',
  ),
];

class OnBoardScreen extends StatelessWidget {
  final String imageUrl, label;
  final int index;
  const OnBoardScreen(
      {Key? key,
      required this.imageUrl,
      required this.label,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          animation(
            index,
            300,
            Image.asset(
              imageUrl,
            ),
          ),
          animation(
            index,
            150,
            Text(
              label,
              style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333)),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

Widget animation(
  int index,
  int delay,
  Widget child,
) {
  if (index == 1) {
    return FadeInDown(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
  return FadeInUp(
    delay: Duration(milliseconds: delay),
    child: child,
  );
}
