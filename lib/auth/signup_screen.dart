import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../widgets/my_button.dart';
import '../widgets/text_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: FadeInDown(
            duration: Duration(milliseconds: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height / 7,
                ),
                Text(
                  'Create a new account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Fill all forms to continue',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Form(
                      child: Container(
                    child: ListView(
                      children: [
                        InputField(
                          inputController: usernameController,
                          isPassword: false,
                          hasSuffixIcon: false,
                          hintText: 'Full Name',
                          prefixIcon: Image.asset('assets/person_icon.png'),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        InputField(
                          inputController: emailController,
                          isPassword: false,
                          hasSuffixIcon: false,
                          hintText: 'Email Address',
                          prefixIcon: Image.asset('assets/Icon_email.png'),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        InputField(
                          inputController: passwordController,
                          isPassword: true,
                          hasSuffixIcon: true,
                          hintText: 'Password',
                          prefixIcon: Image.asset('assets/Icon_password.png'),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        MyButton(onPressed: () {}, text: 'Sign Up'),
                        SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              socialLinks('assets/google.png', 30),
                              socialLinks('assets/apple.png', 20),
                              socialLinks('assets/facebook.png', 20),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                      wordSpacing: 3,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => LoginScreen()));
                                  },
                                  child: Text(
                                    'Sign in ',
                                    style: TextStyle(
                                        color: Color(0xFF3D16D6),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                )
                              ]),
                        )
                      ],
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget socialLinks(String imageUrl, double? imgHeight) {
  return Container(
    margin: EdgeInsets.only(right: 10.0),
    height: 50.0,
    width: 50.0,
    decoration: BoxDecoration(
        shape: BoxShape.circle, color: Color(0xFF333333).withOpacity(0.08)),
    child: Image.asset(
      imageUrl,
      height: imgHeight ?? 20.0,
    ),
  );
}
