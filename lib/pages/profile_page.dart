import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: FadeIn(
                  duration: Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset('assets/profile_img.png'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Bajulaiye Akorede. V',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      profileItems(
                          'assets/profile_peerson.png', 'Personal Info'),
                      profileItems('assets/zigzag.png', 'Current Progress'),
                      profileItems('assets/settings.png', 'Settings'),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  FadeInUp(
                    delay: Duration(seconds: 3),
                    duration: Duration(milliseconds: 500),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF3D16D6).withOpacity(.16)),
                        child: Center(
                          child: Image.asset('assets/share.png'),
                        ),
                      ),
                    ),
                  ),
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

Widget profileItems(
  String prefixIcon,
  String label,
) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey.withOpacity(.1)),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(prefixIcon),
              SizedBox(
                width: 20,
              ),
              Text(
                label,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 15.0,
          )
        ],
      ),
    ),
  );
}
